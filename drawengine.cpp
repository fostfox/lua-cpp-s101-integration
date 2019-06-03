#include "drawengine.h"

#include "ObjectMapCatalogue/Controllers/featurescontroller.h"
#include "ObjectDrawCatalogue/Controller/drawing_instructions_controller.h"
#include "ObjectDrawCatalogue/Packages/drawinginstruction_package.h"
#include "ObjectSymbolsCatalogue/Controller/portrayalcataloguecontroller.h"

#include "config.h"

#include "Geometry/gm_point.h"
#include "Geometry/gm_curve.h"
#include "Geometry/gm_compositecurve.h"
#include "Geometry/gm_surface.h"

#include <QPainter>
#include <QGraphicsScene>
#include <QStaticText>
#include <QStyleOptionGraphicsItem>
#include <QSvgRenderer>
#include <QGraphicsView>

#ifndef QT_NO_OPENGL
#include <QGLWidget>
#endif


DrawEngine::DrawEngine(const FeatureMapController &mc,
        const DrawingInstructionsController &dc,
        const PortrayalCatalogueController &pc)
    :m_img(QImage(map_params::WEIGHT
                 , map_params::HEIGHT
                 , QImage::Format_RGB16)
           )
    ,m_mapCtrl(mc)
    ,m_drawCtrl(dc)
    ,m_symbolCtrl(pc)
{
}

void DrawEngine::draw(double dpi)
{
    m_dpi = dpi / 25.4;

    using pair = std::pair<QString, DrawingInstructionsController::vDrawingInstruction>;

    auto m = m_drawCtrl.drawInstr().toStdMap();
    std::vector<pair> v;
    std::copy(m.begin(), m.end(), std::back_inserter<std::vector<pair>>(v));
    std::sort(v.begin(), v.end(), [](pair& l, pair& r){
        auto s = std::make_shared<drawing_instruction::NullInstruction>("","",0,drawing_instruction::FeatureReference(""));
        l.second.push_back(s);
        r.second.push_back(s);
       return l.second[0]->drawingPriority() < r.second[0]->drawingPriority();
    });

    for (const auto &p : v) {
        const auto & featureId = p.first.toStdString();
        const auto &drawnstr = p.second;

        const auto &fe2spRef = m_mapCtrl.getFeatureById(featureId).fe2spRef();
        auto gm = m_mapCtrl.spatialObjectByRefId(std::to_string(fe2spRef.refId()));

        switch (fe2spRef.refType()) {
        case 110: drawPoint(fe2spRef, static_cast<GM_Point*>(gm), drawnstr); break;
        case 120: drawCurve(fe2spRef, static_cast<GM_Curve*>(gm), drawnstr); break;
        case 125: drawCompositeCurve(fe2spRef, static_cast<GM_CompositeCurve*>(gm), drawnstr); break;
        case 130: drawSurface(fe2spRef, static_cast<GM_Surface*>(gm), drawnstr); break;
        }
    }

//    for (const auto &featureId : m_mapCtrl->getFeaturesIDs()) {
//        const auto &fe2spRef = m_mapCtrl->getFeatureById(featureId).fe2spRef();
//        const auto &drawnstr = m_drawCtrl->drawInstr(QString::fromStdString(featureId));
//        auto gm = m_mapCtrl->spatialObjectByRefId(std::to_string(fe2spRef.refId()));

//        switch (fe2spRef.refType()) {
//        case 110: drawPoint(fe2spRef, static_cast<GM_Point*>(gm), drawnstr); break;
//        case 120: drawCurve(fe2spRef, static_cast<GM_Curve*>(gm), drawnstr); break;
//        case 125: drawCompositeCurve(fe2spRef, static_cast<GM_CompositeCurve*>(gm), drawnstr); break;
//        case 130: drawSurface(fe2spRef, static_cast<GM_Surface*>(gm), drawnstr); break;
//        }
//    }
}

const QImage &DrawEngine::img() const
{
    return m_img;
}

void DrawEngine::drawPoint(const Fe2spRef &, GM_Point* ref, const DrawEngine::vDrawingInstruction &drawInstr)
{
    QPointF p = transform(*ref);
    for (const auto di : drawInstr){
        QPainter painter(&m_img);
        painter.setBackgroundMode(Qt::TransparentMode);
        painter.setRenderHint(QPainter::Antialiasing);

        auto pi = std::dynamic_pointer_cast<drawing_instruction::PointInstruction>(di);
        if (pi){
            auto ref = pi->symbol().reference();
            auto svg = m_symbolCtrl.symbolProfile(ref).svgItem();
            auto pixmap = m_symbolCtrl.symbolProfile(ref).pixmap();

        }
        auto ti = std::dynamic_pointer_cast<drawing_instruction::TextInstruction>(di);
        if (ti){
            auto textPoint = dynamic_cast<const text_package::TextPoint*>(ti->text());
            if (textPoint) {
                if (!textPoint->elements().isEmpty()){
                    auto elem = textPoint->elements()[0];
                    auto colorRef = elem.foregroundColor().token();
                    QColor color = colorRef.isEmpty()
                            ? QColor(Qt::black)
                            : m_symbolCtrl.colorPalette("1").colorProfile("Day", colorRef).color();
                    painter.setPen(QPen(color));
                    QFont font;
                    font.setFamily("Times");
                    auto fontptr = dynamic_cast<text_package::FontCharacteristics*>(elem.font());
                    if (fontptr) {
                        font.setWeight(fontptr->weightQt());
                    }
                    font.setPointSize(elem.bodySize());
                    painter.setFont(font);
                    painter.rotate(textPoint->rotation());
                    painter.drawText(p, elem.text());
                    painter.end();
                }
            }
        }
    }

}

void DrawEngine::drawCurve(const Fe2spRef &fe2spRef, GM_Curve* ref, const DrawEngine::vDrawingInstruction &drawInstr)
{
    QPointF prevPoint;
    bool isStart = true;
    QList<QPointF> points;
    if (ref->segments().size() == 1){
        for (const auto &p : ref->segments()[0].controlPoints()) {
            if (!isStart){
                if (fe2spRef.orientation() == 1){
                    points.push_back(prevPoint);
                    points.push_back(transform(p));
                } else {
                    points.push_front(prevPoint);
                    points.push_front(transform(p));
                }
            }
            isStart = false;
            prevPoint = transform(p);
        }
    }

    for (const auto di : drawInstr){
        QPainter painter(&m_img);
        painter.setBackgroundMode(Qt::TransparentMode);
        painter.setRenderHint(QPainter::Antialiasing);
        auto li = std::dynamic_pointer_cast<drawing_instruction::LineInstruction>(di);
        if (li){
            auto lineStyle = dynamic_cast<const line_styles::LineStyle*>(li->lineStyle());
            if (lineStyle) {
                const auto &colorRef = lineStyle->pen().color();
                auto color = m_symbolCtrl.colorPalette("1").colorProfile("Day", colorRef.token()).color();
                color.setAlphaF(1 - colorRef.transparency());
                QPen p(QBrush(color), lineStyle->pen().width()*m_dpi);
                p.setCapStyle(lineStyle->capStyleQt());
                p.setJoinStyle(lineStyle->joinStyleQt());
                painter.setPen(p);
            }
            auto lineStylRef = dynamic_cast<const line_styles::LineStyleReference*>(li->lineStyle());
            if (lineStylRef) {
                auto lineStyle = m_symbolCtrl.lineStyle(lineStylRef->styleRef());

                const auto &colorRef = lineStyle.pen().color();
                auto color = m_symbolCtrl.colorPalette("1").colorProfile("Day", colorRef.token()).color();
                color.setAlphaF(1 - colorRef.transparency());
                QPen p(QBrush(color), lineStyle.pen().width()*m_dpi);
                p.setCapStyle(lineStyle.capStyleQt());
                p.setJoinStyle(lineStyle.joinStyleQt());
                painter.setPen(p);
            }
            painter.drawLines(points.toVector());
        }
        auto ti = std::dynamic_pointer_cast<drawing_instruction::TextInstruction>(di);
        if (ti){
        }
        painter.end();

    }


}

void DrawEngine::drawCompositeCurve(const Fe2spRef &fe2spRef, GM_CompositeCurve* ref, const DrawEngine::vDrawingInstruction &drawInstr)
{
    for (const auto curveAss : ref->curveAssociations()){
        auto refId = std::to_string(curveAss.refId());
        auto gm = m_mapCtrl.spatialObjectByRefId(refId);

        switch (gm->getType()) {
        case GM_Object::CURVE:
            drawCurve(curveAss, static_cast<GM_Curve*>(gm), drawInstr);
            break;
        case GM_Object::COMPOSITE_CURVE:
            drawCompositeCurve(curveAss, static_cast<GM_CompositeCurve*>(gm), drawInstr); break;
            break;
        }
    }
}

void DrawEngine::drawSurface(const Fe2spRef & fe2spRef, GM_Surface* ref, const DrawEngine::vDrawingInstruction &drawInstr)
{
    auto refId = std::to_string(ref->exteriorRing().refId());
    auto gm = m_mapCtrl.spatialObjectByRefId(refId);

    QVector<QPointF> points;
    switch (gm->getType()) {
    case GM_Object::CURVE:
        drawCurve(ref->exteriorRing(), static_cast<GM_Curve*>(gm), drawInstr);
        points = getAreaPoints(ref->exteriorRing(), static_cast<GM_Curve*>(gm));
        break;
    case GM_Object::COMPOSITE_CURVE:
        drawCompositeCurve(ref->exteriorRing(), static_cast<GM_CompositeCurve*>(gm), drawInstr);
        points = getAreaPoints(ref->exteriorRing(), static_cast<GM_CompositeCurve*>(gm));
        break;
    }

    for (const auto di : drawInstr){
        QPainter painter(&m_img);
        painter.setBackgroundMode(Qt::TransparentMode);
        painter.setRenderHint(QPainter::Antialiasing);
        painter.setPen(Qt::NoPen);
        auto ai = std::dynamic_pointer_cast<drawing_instruction::AreaInstruction>(di);
        if (ai){
            auto areaRef = dynamic_cast<const area_fills::AreaFillReference*>(ai->areaFill());
            if (areaRef) {

            }
            auto colorFill = dynamic_cast<const area_fills::ColorFill*>(ai->areaFill());
            if (colorFill) {
                const auto &colorRef = colorFill->color();
                auto color = m_symbolCtrl.colorPalette("1").colorProfile("Day", colorRef.token()).color();
                color.setAlphaF(1 - colorRef.transparency());
                painter.setBrush(QBrush(color));

            }
            auto symbolFill = dynamic_cast<const area_fills::SymbolFill*>(ai->areaFill());
            if (symbolFill) {

            }

        }
        QPolygonF poly(points);
        if (poly.isClosed()){
            painter.drawPolygon(points);
        } else {
            qCritical(QString("has not Closeded, refId=%1").arg(fe2spRef.refId()).toLocal8Bit());
        }

        painter.end();
    }





//    for (const auto curveAss : ref->interiorRings()){
//        auto gm = m_mapCtrl->spatialObjectByRefId(std::to_string(curveAss.refId()));

//        switch (gm->getType()) {
//        case GM_Object::CURVE:
//            drawCurve(static_cast<GM_Curve*>(gm), drawInstr);
//            break;
//        case GM_Object::COMPOSITE_CURVE:
//            drawCompositeCurve(static_cast<GM_CompositeCurve*>(gm), drawInstr); break;
//            break;
//        }
    //    }
}

QVector<QPointF> DrawEngine::getAreaPoints(const Fe2spRef& fe2spRef, GM_Curve *ref)
{
    QPointF prevPoint;

    QList<QPointF> points;
    if (ref->segments().size() == 1){
        for (const auto &p : ref->segments()[0].controlPoints()) {
                if (fe2spRef.orientation() == 1){
                    points.push_back(transform(p));
                } else {
                    points.push_front(transform(p));
                }
            prevPoint = transform(p);
        }
    }

    return points.toVector();
}

QVector<QPointF> DrawEngine::getAreaPoints(const Fe2spRef &fe2spRef, GM_CompositeCurve *ref)
{
    QVector<QPointF> points;
    for (const auto curveAss : ref->curveAssociations()){
        auto refId = std::to_string(curveAss.refId());
        auto gm = m_mapCtrl.spatialObjectByRefId(refId);

        switch (gm->getType()) {
        case GM_Object::CURVE: {
            auto p = getAreaPoints(curveAss, static_cast<GM_Curve*>(gm));
            points.append(p);
        } break;
        case GM_Object::COMPOSITE_CURVE: {
            auto p = getAreaPoints(curveAss, static_cast<GM_CompositeCurve*>(gm));
            points.append(p);
        } break;
        }
    }
    return points;
}

QPointF DrawEngine::transform(const GM_Point &point)
{
    //const double SHIFT_LAT = 90;
    //const double SHIFT_LON = 180;

    const static double lat_min = m_mapCtrl.getLatInterval().first;
    const static double lat_max = m_mapCtrl.getLatInterval().second;
    const static double lon_min = m_mapCtrl.getLonInterval().first;
    const static double lon_max = m_mapCtrl.getLonInterval().second;

    const static double lat_length = lat_max - lat_min;
    const static double lon_length = lon_max - lon_min;

    const static double ky =  map_params::HEIGHT / lat_length;
    const static double kx =  map_params::WEIGHT / lon_length;

    double y = std::stod(point.y());
    double x = std::stod(point.x());

    double y1 = (y - lat_min) * ky;
    double x1 = (x - lon_min) * kx;

    return QPointF(x1, map_params::HEIGHT - y1);
}

