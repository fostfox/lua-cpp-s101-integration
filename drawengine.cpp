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

#include <QTextDocument>

#ifndef QT_NO_OPENGL
#include <QGLWidget>
#endif


DrawEngine::DrawEngine(const FeatureMapController &mc
                       , const DrawingInstructionsController &dc
                       , const PortrayalCatalogueController &pc, QObject *parent
                       )
    :m_img(QImage(map_params::WEIGHT, map_params::HEIGHT, QImage::Format_RGB16))
    ,m_mapCtrl(mc)
    ,m_drawCtrl(dc)
    ,m_symbolCtrl(pc)
{
}

void DrawEngine::draw(double dpim, QGraphicsScene *scene)
{
    m_dpi = dpim;
    m_scene = scene;

    using pair = std::pair<QString, DrawingInstructionsController::vDrawingInstruction>;

        for (const auto &featureId : m_mapCtrl.getFeaturesIDs()) {
            const auto &fe2spRef = m_mapCtrl.getFeatureById(featureId).fe2spRef();
            const auto &drawnstr = m_drawCtrl.drawInstr(QString::fromStdString(featureId));
            auto gm = m_mapCtrl.spatialObjectByRefId(std::to_string(fe2spRef.refId()));

            if (drawnstr.isEmpty()){
                continue;
            }

            switch (fe2spRef.refType()) {
            case 110: drawPoint(fe2spRef, static_cast<GM_Point*>(gm), drawnstr); break;
            case 120: drawCurve(fe2spRef, static_cast<GM_Curve*>(gm), drawnstr); break;
            case 125: drawCompositeCurve(fe2spRef, static_cast<GM_CompositeCurve*>(gm), drawnstr); break;
            case 130: drawSurface(fe2spRef, static_cast<GM_Surface*>(gm), drawnstr); break;
            }
        }
}

const QImage &DrawEngine::img() const
{
    return m_img;
}

void DrawEngine::drawPoint(const Fe2spRef &, GM_Point* ref, const DrawEngine::vDrawingInstruction &drawInstr)
{
    QPointF p = transform(*ref);
    for (const auto di : drawInstr){
        //QPainter painter(&m_img);

        auto pi = std::dynamic_pointer_cast<drawing_instruction::PointInstruction>(di);
        if (pi){
            auto ref = pi->symbol().reference();
            auto svg = m_symbolCtrl.symbolProfile(ref).svgItem();
            //auto pixmap = m_symbolCtrl.symbolProfile(ref).pixmap();
            //QGraphicsSvgItem* item = new QGraphicsSvgItem("XMLData/PC_PACK/Symbols/POSGEN03.svg");
            QGraphicsSvgItem* item = new QGraphicsSvgItem();
            //item->setScale(10);
            item->setZValue(di->drawingPriority());
            item->setSharedRenderer(svg->renderer());
            auto newP = p - QPointF(item->boundingRect().size().height(), item->boundingRect().size().width()) / 2.0;
            item->setPos(newP);
            m_scene->addItem(item);
        }
        auto ti = std::dynamic_pointer_cast<drawing_instruction::TextInstruction>(di);
        if (ti){
            auto textPoint = dynamic_cast<const text_package::TextPoint*>(ti->text());
            if (textPoint) {
                if (!textPoint->elements().isEmpty()){
                    QGraphicsTextItem* item = new QGraphicsTextItem;
                    item->setZValue(di->drawingPriority());

                    auto elem = textPoint->elements()[0];
                    auto colorRef = elem.foregroundColor().token();
                    QColor color = colorRef.isEmpty()
                            ? QColor(103,114,109)
                            : m_symbolCtrl.colorPalette("1").colorProfile("Day", colorRef).color();
                    item->setDefaultTextColor(color);
                    QFont font;
                    //font.setFamily("Calibri");
                    font.setPointSize(elem.bodySize());
                    auto fontptr = dynamic_cast<text_package::FontCharacteristics*>(elem.font());
                    if (fontptr) {
                        font.setWeight(fontptr->weightQt());
                    }

                    item->setFont(font);
                    item->setRotation(textPoint->rotation());
                    item->setPlainText(elem.text());

                    QFontMetrics metrics(font);
                    auto brwidth = item->boundingRect().width();
                    auto brheight = item->boundingRect().height();
                    auto btwidth = metrics.width(elem.text());
                    auto btheight = metrics.height();
                    QPointF boundingRectOffset((brwidth-btwidth) / 2.0,  (brheight-btheight)/ 2.0);

                    auto newP = p-boundingRectOffset;

                    switch (textPoint->verticalAlignment()) {
                    case  text_package::VerticalAlignment::CENTER:
                        newP.ry() -= btheight/2.0;
                        break;
                    case  text_package::VerticalAlignment::BOTTOM:
                    case  text_package::VerticalAlignment::BASELINE:
                         newP.ry() -= btheight;
                    break;
                    }
                    switch (textPoint->horizontalAlignment()) {
                    case text_package::HorizontalAlignment::CENTER:
                        newP.rx() -= btwidth/2.0;
                        break;
                    case text_package::HorizontalAlignment::END:
                        newP.rx() -= btwidth;
                        break;
                    }

                    auto offset = textPoint->offset();
                    newP.rx() +=  offset.x()*m_dpi;
                    newP.ry() -=  offset.y()*m_dpi;

                    item->setPos(newP);
                    m_scene->addItem(item);
                }
            }
        }
    }

}

void DrawEngine::drawCurve(const Fe2spRef &fe2spRef, GM_Curve* ref, const DrawEngine::vDrawingInstruction &drawInstr)
{
    //if (drawInstr[0].get()->featureReference().reference() != "19") return;

    auto points = getAreaPoints(fe2spRef, ref);
    QPainterPath path;
    if (points.isEmpty()) return;

    path.moveTo(points[0]);
    for (const auto& point : points){
        path.lineTo(point);
    }

    for (const auto di : drawInstr){
        QGraphicsPathItem* item = new QGraphicsPathItem;
        item->setZValue(di->drawingPriority());

        auto li = std::dynamic_pointer_cast<drawing_instruction::LineInstruction>(di);
        if (li){
            const line_styles::LineStyle* lineStyle = dynamic_cast<const line_styles::LineStyle*>(li->lineStyle());
            auto lineStylRef = dynamic_cast<const line_styles::LineStyleReference*>(li->lineStyle());
            if (lineStylRef) {
                lineStyle = new line_styles::LineStyle(m_symbolCtrl.lineStyle(lineStylRef->styleRef()));
            }
            if (lineStyle) {
                const auto &colorRef = lineStyle->pen().color();
                QColor color = m_symbolCtrl.colorPalette("1").colorProfile("Day", colorRef.token()).color();
                color.setAlphaF(1 - colorRef.transparency());
                QPen p(QBrush(color), lineStyle->pen().width()*m_dpi);
                p.setCapStyle(lineStyle->capStyleQt());
                p.setJoinStyle(lineStyle->joinStyleQt());

                const auto &dv = lineStyle->dash();
                if (!dv.isEmpty()) {
                    double w = lineStyle->pen().width();
                    QVector<qreal> dash;
                    for (int i = 0; i < dv.size() - 1; ++i){
                        double space = dv[i+1].start() - dv[i].start() - dv[i].length();
                        dash << dv[i].length()/w << space/w;
                    }
                    if (lineStyle->intervalLength()){
                        double space = lineStyle->intervalLength().value() - dv.last().start() - dv.last().length() + dv.first().start();
                        dash << dv.last().length()/w << space/w;
                    }
                    p.setDashPattern(dash);
                }
                item->setPen(p);
            }
            item->setPath(path);
        }
        auto pi = std::dynamic_pointer_cast<drawing_instruction::PointInstruction>(di);
        if (pi){


        }

        auto ti = std::dynamic_pointer_cast<drawing_instruction::TextInstruction>(di);
        if (ti){
        }
        if (li || ti) {
            m_scene->addItem(item);
        }
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
    //if (drawInstr[0].get()->featureReference().reference() != "15") return;

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
        QGraphicsPolygonItem *item = new QGraphicsPolygonItem();
        item->setPen(Qt::NoPen);
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
                item->setBrush(QBrush(color));
            }
            auto symbolFill = dynamic_cast<const area_fills::SymbolFill*>(ai->areaFill());
            if (symbolFill) {
            }
        }
        QPolygonF poly(points);
        if (poly.isClosed()){
            item->setPolygon(points);
            m_scene->addItem(item);
        } else {
            qCritical(QString("has not Closeded, refId=%1").arg(fe2spRef.refId()).toLocal8Bit());
        }

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

QPointF DrawEngine::getPoint(const QVector<QPointF> &points, const symbol::LineSymbolPlacement& linePlacement)
{
    using namespace symbol;
    switch (linePlacement.placementMode()) {
    case LinePlacementMode::RELATIVE_MODE : {

    } break;
    case LinePlacementMode::ABSOLUTE_MODE : {

    } break;

    }

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
    //const static double ky =  m_scene->height() / lat_length;
    //const static double kx =  m_scene->width() / lon_length;

    double y = std::stod(point.y());
    double x = std::stod(point.x());

    double y1 = (y - lat_min) * ky;
    double x1 = (x - lon_min) * kx;

    return QPointF(x1, map_params::HEIGHT - y1);
}

