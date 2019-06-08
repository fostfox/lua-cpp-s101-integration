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
#include <iostream>

#ifndef QT_NO_OPENGL
#include <QGLWidget>
#endif

#include <math.h>

qreal euclideanDistance(const QPointF &from, const QPointF& to)
{
    double dx = to.x() - from.x();
    double dy = to.y() - from.y();
    return sqrt(dx*dx + dy*dy);
}

double DrawEngine::rotationQt(double rotation, int rotationType, double lineRotation)
{
    switch ((graphic_base::CRSType)rotationType) {
    case graphic_base::CRSType::LINE_CRS:
        return rotation + lineRotation;
    case graphic_base::CRSType::LOCAL_CRS:
        return rotation;
    case graphic_base::CRSType::PORTRAYAL_CRS:
        return rotation;
    case graphic_base::CRSType::GEOGRAPHIC_CRS:
        return rotation+m_trueNorthDirection-90;
    }
}

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

void DrawEngine::setHeightWidth(double h, double w){
    height = h;
    width = w;
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
        auto pi = std::dynamic_pointer_cast<drawing_instruction::PointInstruction>(di);
        if (pi){
            auto ref = pi->symbol().reference();
            auto pixmap = m_symbolCtrl.symbolProfile(ref).pixmap();
            auto* item = new QGraphicsPixmapItem(pixmap);
            item->setFlag(QGraphicsItem :: ItemIgnoresTransformations);
            item->setZValue(di->drawingPriority());

            item->setPos(p);
            item->setTransformOriginPoint(QPointF(item->boundingRect().size().height(), item->boundingRect().size().width()) / 2.0);
            auto rot = rotationQt(pi->symbol().rotation(), (int)pi->symbol().rotationCRS());
            item->setRotation(rot);
            auto newP = QPointF(pixmap.height(), pixmap.width()) / 2.0;
            auto offset = pi->symbol().offset();
            newP.rx() +=  offset.x()*m_dpi;
            newP.ry() -=  offset.y()*m_dpi;
            auto t = item->transform();
            item->setTransform({t.m11(),t.m12(),t.m21(),t.m22(),t.dx()-newP.x(),t.dy()-newP.y()});

            m_scene->addItem(item);
        }
        auto ti = std::dynamic_pointer_cast<drawing_instruction::TextInstruction>(di);
        if (ti){
            auto textPoint = dynamic_cast<const text_package::TextPoint*>(ti->text());
            if (textPoint) {
                if (!textPoint->elements().isEmpty()){
                    QGraphicsTextItem* item = new QGraphicsTextItem;
                    item->setFlag(QGraphicsItem :: ItemIgnoresTransformations);
                    item->setZValue(di->drawingPriority());

                    auto elem = textPoint->elements()[0];
                    auto colorRef = elem.foregroundColor().token();
                    QColor color = colorRef.isEmpty()
                            ? QColor(103,114,109)
                            : m_symbolCtrl.colorPalette("1").colorProfile("Day", colorRef).color();
                    item->setDefaultTextColor(color);
                    QFont font;
                    font.setPointSize(elem.bodySize());
                    auto fontptr = dynamic_cast<text_package::FontCharacteristics*>(elem.font());
                    if (fontptr) {
                        font.setWeight(fontptr->weightQt());
                    }

                    item->setFont(font);
                    item->setPlainText(elem.text());
                    item->setPos(p);

                    QFontMetrics metrics(font);
                    auto brwidth = item->boundingRect().width();
                    auto brheight = item->boundingRect().height();
                    auto btwidth = metrics.width(elem.text());
                    auto btheight = metrics.height();
                    QPointF boundingRectOffset((brwidth-btwidth) / 2.0,  (/*brheight-*/btheight)/ 2.0);

                    auto newP = boundingRectOffset;

                    switch (textPoint->verticalAlignment()) {
                    case  text_package::VerticalAlignment::CENTER:
                        newP.ry() += btheight/2.0;
                        break;
                    case  text_package::VerticalAlignment::BOTTOM:
                    case  text_package::VerticalAlignment::BASELINE:
                         newP.ry() += btheight;
                    break;
                    }
                    switch (textPoint->horizontalAlignment()) {
                    case text_package::HorizontalAlignment::CENTER:
                        newP.rx() += btwidth/2.0;
                        break;
                    case text_package::HorizontalAlignment::END:
                        newP.rx() += btwidth;
                        break;
                    }

                    item->setTransformOriginPoint(newP);
                    item->setRotation(textPoint->rotation());

                    auto offset = textPoint->offset();
                    newP.rx() -=  offset.x()*m_dpi;
                    newP.ry() +=  offset.y()*m_dpi;

                    auto t = item->transform();
                    item->setTransform({t.m11(),t.m12(),t.m21(),t.m22(),t.dx()-newP.x(),t.dy()-newP.y()});

                    m_scene->addItem(item);
                }
            }
        }
    }
}

void DrawEngine::drawCurve(const Fe2spRef &fe2spRef, GM_Curve* ref, const DrawEngine::vDrawingInstruction &drawInstr)
{
    auto points = getAreaPoints(fe2spRef, ref);
    QPainterPath path;
    if (points.isEmpty()) return;

    path.moveTo(points[0]);
    for (const auto& point : points){
        path.lineTo(point);
    }

    for (const auto di : drawInstr){
        auto li = std::dynamic_pointer_cast<drawing_instruction::LineInstruction>(di);
        if (li){
            QGraphicsPathItem* item = new QGraphicsPathItem;
            item->setZValue(di->drawingPriority());

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
                p.setCosmetic(true);

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
            m_scene->addItem(item);
        }
        auto pi = std::dynamic_pointer_cast<drawing_instruction::PointInstruction>(di);
        if (pi){
            auto sybol = pi->symbol();
            if (sybol.hasLinePlacement()){
                double rotation;
                auto point = getPoint(points, (int)sybol.linePlacement().placementMode(), sybol.linePlacement().offset(), rotation);

                auto ref = sybol.reference();
                auto pixmap = m_symbolCtrl.symbolProfile(ref).pixmap();
                auto* item = new QGraphicsPixmapItem(pixmap);
                item->setFlag(QGraphicsItem :: ItemIgnoresTransformations);
                item->setZValue(di->drawingPriority());

                item->setPos(point);
                item->setTransformOriginPoint(QPointF(item->boundingRect().size().height(), item->boundingRect().size().width()) / 2.0);

                rotation = rotationQt(sybol.rotation(), (int)sybol.rotationCRS(), rotation);
                item->setRotation(rotation);

                auto newP = QPointF(pixmap.height(), pixmap.width()) / 2.0;
                auto offset = pi->symbol().offset();
                newP.rx() +=  offset.x()*m_dpi;
                newP.ry() -=  offset.y()*m_dpi;
                auto t = item->transform();
                item->setTransform({t.m11(),t.m12(),t.m21(),t.m22(),t.dx()-newP.x(),t.dy()-newP.y()});

                m_scene->addItem(item);
            }
        }

        auto ti = std::dynamic_pointer_cast<drawing_instruction::TextInstruction>(di);
        if (ti){
            auto textLine = dynamic_cast<const text_package::TextLine*>(ti->text());
            if (textLine) {
                if (!textLine->elements().isEmpty()){
                    QGraphicsTextItem* item = new QGraphicsTextItem;
                    item->setFlag(QGraphicsItem :: ItemIgnoresTransformations);
                    item->setZValue(di->drawingPriority());

                    auto elem = textLine->elements()[0];
                    auto colorRef = elem.foregroundColor().token();
                    QColor color = colorRef.isEmpty()
                            ? QColor(103,114,109)
                            : m_symbolCtrl.colorPalette("1").colorProfile("Day", colorRef).color();
                    item->setDefaultTextColor(color);
                    QFont font;
                    font.setPointSize(elem.bodySize());
                    auto fontptr = dynamic_cast<text_package::FontCharacteristics*>(elem.font());
                    if (fontptr) {
                        font.setWeight(fontptr->weightQt());
                    }

                    item->setFont(font);
                    item->setPlainText(elem.text());

                    double rotation;
                    auto point = getPoint(points, (int)textLine->placementMode(), textLine->startOffset(), rotation);

                    item->setPos(point);

                    QFontMetrics metrics(font);
                    auto brwidth = item->boundingRect().width();
                    auto brheight = item->boundingRect().height();
                    auto btwidth = metrics.width(elem.text());
                    auto btheight = metrics.height();
                    QPointF boundingRectOffset((brwidth-btwidth) / 2.0,  (/*brheight-*/btheight)/ 2.0);


                    auto newP = boundingRectOffset;

                    switch (textLine->verticalAlignment()) {
                    case  text_package::VerticalAlignment::CENTER:
                        newP.ry() += btheight/2.0;
                        break;
                    case  text_package::VerticalAlignment::BOTTOM:
                    case  text_package::VerticalAlignment::BASELINE:
                         newP.ry() += btheight;
                    break;
                    }
                    switch (textLine->horizontalAlignment()) {
                    case text_package::HorizontalAlignment::CENTER:
                        newP.rx() += btwidth/2.0;
                        break;
                    case text_package::HorizontalAlignment::END:
                        newP.rx() += btwidth;
                        break;
                    }

                    item->setTransformOriginPoint(newP);
                    item->setRotation(rotation);

                    auto t = item->transform();
                    item->setTransform({t.m11(),t.m12(),t.m21(),t.m22(),t.dx()-newP.x(),t.dy()-newP.y()});

                    m_scene->addItem(item);
                }
            }
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
    QPolygonF poly(points);

//    for (const auto curveAss : ref->interiorRings()){
//        auto gm = m_mapCtrl.spatialObjectByRefId(std::to_string(curveAss.refId()));
//        QVector<QPointF> interiorPoints;
//        switch (gm->getType()) {
//        case GM_Object::CURVE:
//            drawCurve(curveAss, static_cast<GM_Curve*>(gm), drawInstr);
//            interiorPoints = getAreaPoints(ref->exteriorRing(), static_cast<GM_Curve*>(gm));
//            break;
//        case GM_Object::COMPOSITE_CURVE:
//            drawCompositeCurve(curveAss, static_cast<GM_CompositeCurve*>(gm), drawInstr);
//            interiorPoints = getAreaPoints(ref->exteriorRing(), static_cast<GM_CompositeCurve*>(gm));
//            break;
//        }
//        QPolygonF interiorPoly(interiorPoints);
//        poly = poly.subtracted(interiorPoly);
//   }


    for (const auto di : drawInstr){       
        QGraphicsPolygonItem *item = new QGraphicsPolygonItem();
        item->setPen(Qt::NoPen);
        auto ai = std::dynamic_pointer_cast<drawing_instruction::AreaInstruction>(di);
        if (ai){

            auto colorFill = dynamic_cast<const area_fills::ColorFill*>(ai->areaFill());
            if (colorFill) {
                const auto &colorRef = colorFill->color();
                auto color = m_symbolCtrl.colorPalette("1").colorProfile("Day", colorRef.token()).color();
                color.setAlphaF(1 - colorRef.transparency());
                item->setBrush(QBrush(color));
            }

            auto symbolFill = dynamic_cast<const area_fills::SymbolFill*>(ai->areaFill());
            auto areaRef = dynamic_cast<const area_fills::AreaFillReference*>(ai->areaFill());
            if (areaRef) {
                symbolFill = new area_fills::SymbolFill(m_symbolCtrl.symbolFill(areaRef->reference()));
            }
            if (symbolFill) {
                auto ref = symbolFill->symbol().reference();
                auto pixmap = m_symbolCtrl.symbolProfile(ref).pixmap();
//                QPixmap res(pixmap.size().width(),pixmap.size().height());
                QBrush brush;
                brush.setTexture(pixmap);
                brush.setMatrix({1,0,1,0,0,0});
                item->setBrush(brush);
            }
        }
        item->setPolygon(points);
        m_scene->addItem(item);
        if (!poly.isClosed()){
            qCritical(QString("has not Closeded, refId=%1").arg(fe2spRef.refId()).toLocal8Bit());
        }
    }
}

QVector<QPointF> DrawEngine::getAreaPoints(const Fe2spRef& fe2spRef, GM_Curve *ref)
{
    QVector<QPointF> points;
    if (ref->segments().size() == 1){
        for (const auto &p : ref->segments()[0].controlPoints()) {
            points.push_back(transform(p));
        }
    }
    return points;
}

QVector<QPointF> DrawEngine::getAreaPoints(const Fe2spRef &fe2spRef, GM_CompositeCurve *ref)
{
    QVector<QPointF> points;
    for (const auto curveAss : ref->curveAssociations()){
        auto refId = std::to_string(curveAss.refId());
        auto gm = m_mapCtrl.spatialObjectByRefId(refId);

        QVector<QPointF> p;
        switch (gm->getType()) {
        case GM_Object::CURVE: {
            p = getAreaPoints(curveAss, static_cast<GM_Curve*>(gm));
        } break;
        case GM_Object::COMPOSITE_CURVE: {
            p = getAreaPoints(curveAss, static_cast<GM_CompositeCurve*>(gm));
        } break;
        }
        if (curveAss.orientation() == 2){
            std::reverse(p.begin(), p.end());
        }
        points.append(p);
    }
    return points;
}

QPointF DrawEngine::getPoint(const QVector<QPointF> &points, int linePlacementMode, double offset, double& rotation)
{
    using namespace symbol;

    double offsetMM = offset*m_dpi;

    switch ((LinePlacementMode)linePlacementMode) {
    case LinePlacementMode::RELATIVE_MODE : {
        double sumDistances = 0;
        for (int i = 0; i < points.size()-1; ++i){
            sumDistances += euclideanDistance(points[i], points[i+1]);
        }
        offsetMM = offset * sumDistances;
    } [[fallthrough]];
    case LinePlacementMode::ABSOLUTE_MODE : {
        double sumDistances = 0;
        for (int i = 0; i < points.size()-1; ++i){
            double distance = euclideanDistance(points[i], points[i+1]);
            sumDistances += distance;
            if (sumDistances >= offsetMM){
                double k = (sumDistances - offsetMM) / distance;
                QPointF point = points[i] + (points[i+1] - points[i]) * k;
                auto angle = QLineF(points[i], points[i+1]).angle();
                rotation = -angle;//(angle >= 180) ? angle-180 : angle;
                return point;
            }
        }
    }
    }
}

QPointF DrawEngine::transform(const GM_Point &point)
{
    //const double SHIFT_LAT = 90;
    //const double SHIFT_LON = 180;

    const double lat_min = m_mapCtrl.getLatInterval().first;
    const double lat_max = m_mapCtrl.getLatInterval().second;
    const double lon_min = m_mapCtrl.getLonInterval().first;
    const double lon_max = m_mapCtrl.getLonInterval().second;

    const double lat_length = lat_max - lat_min;
    const double lon_length = lon_max - lon_min;

    const double ky =  height / lat_length;
    const double kx =  width / lon_length;
    //const static double ky =  m_scene->height() / lat_length;
    //const static double kx =  m_scene->width() / lon_length;

    double y = std::stod(point.y());
    double x = std::stod(point.x());

    double y1 = (y - lat_min) * ky;
    double x1 = (x - lon_min) * kx;

    return QPointF(x1, height - y1);
    //return QPointF(std::stod(point.x()), std::stod(point.y()));
}
