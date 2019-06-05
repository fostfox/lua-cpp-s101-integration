#include "portrayalcataloguecontroller.h"




pcatalogue::SymbolProfile PortrayalCatalogueController::symbolProfile(const QString &refId) const
{
    if (!m_symbolProfileMap.contains(refId)){
        qFatal(("Where is no refId="+refId+"in map").toLocal8Bit());
    }
    return m_symbolProfileMap.value(refId);
}

pcatalogue::ColorPalette PortrayalCatalogueController::colorPalette(const QString &refId) const
{
    if (!m_colorProfileMap.contains(refId)){
        qFatal(("Where is no refId="+refId+"in map").toLocal8Bit());
    }
    return m_colorProfileMap.value(refId);
}

line_styles::LineStyle PortrayalCatalogueController::lineStyle(const QString &refId) const
{
    if (!m_lineStyleMap.contains(refId)){
        qFatal(("Where is no refId="+refId+"in map").toLocal8Bit());
    }
    return m_lineStyleMap.value(refId);
}

area_fills::SymbolFill PortrayalCatalogueController::symbolFill(const QString &refId) const
{
    if (!m_symbolFillMap.contains(refId)){
        qFatal(("Where is no refId="+refId+"in map").toLocal8Bit());
    }
    return m_symbolFillMap.value(refId);
}

void PortrayalCatalogueController::addSymbolProfile(const QString &refId, const pcatalogue::SymbolProfile &symbol)
{
    m_symbolProfileMap.insert(refId, symbol);
}

void PortrayalCatalogueController::addColorProfile(const QString &refId, const pcatalogue::ColorPalette &color)
{
    m_colorProfileMap.insert(refId, color);
}

void PortrayalCatalogueController::addLineStyle(const QString &refId, const line_styles::LineStyle &lineStyle)
{
    m_lineStyleMap.insert(refId, lineStyle);

}

void PortrayalCatalogueController::addSymbolFill(const QString &refId, const area_fills::SymbolFill &symbolFill)
{
    m_symbolFillMap.insert(refId, symbolFill);
}
