#pragma once

#include <QImage>
#include <memory>

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

#include <QObject>


class DrawEngine : public QObject
{
    Q_OBJECT

public:
    DrawEngine(
               const FeatureMapController&
               , const DrawingInstructionsController&
               , const PortrayalCatalogueController&
               ,QObject* parent = nullptr);

    void draw(double dpim, QGraphicsScene* scene);
    void setHeightWidth(double h, double w);
    const QImage& img() const;

private:
    const FeatureMapController& m_mapCtrl;
    const DrawingInstructionsController& m_drawCtrl;
    const PortrayalCatalogueController& m_symbolCtrl;

    QImage m_img;

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

    double m_dpi;
    QGraphicsScene* m_scene;

    double m_trueNorthDirection = 90;
    double height, width;
};
