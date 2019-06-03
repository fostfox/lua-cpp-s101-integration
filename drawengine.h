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
class QPointF;
class Fe2spRef;

class DrawEngine
{
public:
    DrawEngine(const FeatureMapController&
               , const DrawingInstructionsController&
               , const PortrayalCatalogueController&);

    void draw(double dpi);
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
    QPointF transform(const GM_Point& );

    double m_dpi;
};
