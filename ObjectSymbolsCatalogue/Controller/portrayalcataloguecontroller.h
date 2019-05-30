#pragma once

#include <QMap>

class PortrayalCatalogueBuilder;
namespace pcatalogue {
class SymbolProfile;
class ColorProfile;
}
namespace line_styles {
class LineStyle;
class LineSymbol;
}
namespace area_fills {
class SymbolFill;
class AreaCRSType;
}
namespace graphic_base {
class Vector;
}


class PortrayalCatalogueController
{
public:
    PortrayalCatalogueController() = default;

    const pcatalogue::SymbolProfile& symbolProfile(const QString &refId) const;
    const pcatalogue::ColorProfile& colorProfile(const QString &refId) const;
    const line_styles::LineStyle& lineStyle(const QString &refId) const;
    const area_fills::SymbolFill& symbolFill(const QString &refId) const;

protected:
    friend PortrayalCatalogueBuilder;
    void addSymbolProfile(const QString &refId, const pcatalogue::SymbolProfile& symbol);
    void addColorProfile(const QString &refId, const pcatalogue::ColorProfile& color);
    void addLineStyle(const QString &refId, const line_styles::LineStyle &lineStyle);
    void addSymbolFill(const QString &refId, const area_fills::SymbolFill &symbolFill);

private:
    using refid_t = QString;
    QMap<refid_t, pcatalogue::SymbolProfile> m_symbolProfileMap;
    QMap<refid_t, pcatalogue::ColorProfile> m_colorProfileMap;
    QMap<refid_t, line_styles::LineStyle> m_lineStyleMap;
    QMap<refid_t, area_fills::SymbolFill> m_symbolFillMap;
};
