#pragma once

#include <QImage>
#include <memory>
#include <QObject>

class FeatureMapController;
class DrawingInstructionsController;
class PortrayalCatalogueController;
class GM_CompositeCurve;
class GM_Curve;
class GM_Point;
class GM_Surface;
namespace drawing_instruction { class DrawingInstruction; }
namespace line_styles { class Dash; }
namespace symbol { class LineSymbolPlacement; }
class QPointF;
class Fe2spRef;
class QGraphicsScene;
class QGraphicsItem;
class ScaleGroup;

class DrawEngine : public QObject
{
    Q_OBJECT

public:
    DrawEngine(
               const FeatureMapController&
               , const DrawingInstructionsController&
               , const PortrayalCatalogueController&
               ,QObject* parent = nullptr);

    void draw(const QSizeF &dpiInM, QGraphicsScene* scene, double scale);
    void setHeightWidth(double h, double w);
    const QImage& img() const;
    void setVisibleScaledItems(float mapScale);

private:
    const FeatureMapController& m_mapCtrl;
    const DrawingInstructionsController& m_drawCtrl;
    const PortrayalCatalogueController& m_symbolCtrl;

    QImage m_img;

    QVector<ScaleGroup*> m_scaleGroups;

private:
    using shared_instruction = std::shared_ptr<drawing_instruction::DrawingInstruction>;
    using vDrawingInstruction = QVector<shared_instruction>;

    void drawPoint(const Fe2spRef &, GM_Point * , const vDrawingInstruction& );
    void drawCurve(const Fe2spRef &, GM_Curve * , const vDrawingInstruction& );
    void drawCompositeCurve(const Fe2spRef &, GM_CompositeCurve * , const vDrawingInstruction& );
    void drawSurface(const Fe2spRef &, GM_Surface * , const vDrawingInstruction& );

    QVector<QPointF> getAreaPoints(const Fe2spRef &, GM_Curve * ref);
    QVector<QPointF> getAreaPoints(const Fe2spRef &, GM_CompositeCurve * ref);
    QPointF getPoint(const QVector<QPointF>& points, int linePlacementMode, double offset, double &rotation);

    double rotationQt(double rotation, int rotationCRSType, double lineRotation = 0);
    QPointF transform(const GM_Point& );

    void setGroupItem(QGraphicsItem* item, const shared_instruction &drawInstr);

    QSizeF m_dpiInM;
    double m_scale;
    QGraphicsScene* m_scene;

    double m_trueNorthDirection = 90;
    double height, width;
};
