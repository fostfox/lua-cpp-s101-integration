#include "portrayalcataloguecontroller.h"

#include "../../ObjectDrawCatalogue/Builder/drawinstructionparser_init.hpp"

#include "../Entities/color.h"
#include "../Entities/symbol.h"

static commands_initial_state::LineStylemDefault DEFAULT_LINE_STYLE;
static commands_initial_state::TransformDefault DEFAULT_TRANSFORM;



const pcatalogue::SymbolProfile &PortrayalCatalogueController::symbolProfile(const QString &refId) const
{
    if (!m_symbolProfileMap.contains(refId)){
        qFatal(("Where is no refId="+refId+"in map").toLocal8Bit());
    }
    return m_symbolProfileMap.value(refId);
}

void PortrayalCatalogueController::addSymbolProfile(const QString &refId, const pcatalogue::SymbolProfile &symbol)
{
    m_symbolProfileMap.insert(refId, symbol);
}

void PortrayalCatalogueController::addColorProfile(const QString &refId, const pcatalogue::ColorProfile &color)
{
    m_colorProfileMap.insert(refId, color);
}

void PortrayalCatalogueController::addLineStyle(const QString &refId, double intervalLength, double width, QString color, QVector<std::pair<QString, double> > refSymbolAndPos, QVector<std::pair<double, double> > dashStartLenght)
{
    graphic_base::Color colorG(color, DEFAULT_LINE_STYLE.transparency);
    graphic_base::Pen penG(width, colorG);

    line_styles::LineStyle lineStyle(DEFAULT_LINE_STYLE.offset
                        , DEFAULT_LINE_STYLE.capStyle
                        , DEFAULT_LINE_STYLE.joinStyle
                        , penG
                        );
    lineStyle.setIntervalLength(intervalLength);

    for (const auto& params : dashStartLenght){
        lineStyle.addDash(line_styles::Dash(params.first, params.second));
    }
    for (const auto& params : refSymbolAndPos){
        line_styles::LineSymbol symbol(params.first
                          , DEFAULT_LINE_STYLE.rotation
                          , DEFAULT_LINE_STYLE.scaleFactor
                          , DEFAULT_LINE_STYLE.crsType
                          , params.second);
        lineStyle.addSymbol(symbol);
    }

    m_lineStyleMap.insert(refId, lineStyle);

}

void PortrayalCatalogueController::addSymbolFill(const QString &refId, const graphic_base::Vector &v1, const graphic_base::Vector &v2, const QString &AreaCRSType)
{
    symbol::Symbol symbol(refId
                          ,DEFAULT_TRANSFORM.rotation
                          ,DEFAULT_TRANSFORM.rotationCRS
                          ,graphic_base::Vector(DEFAULT_TRANSFORM.xOffsetMM, DEFAULT_TRANSFORM.yOffsetMM)
                          );

    m_symbolFillMap.insert(refId, { symbol, v1, v2 });
}
