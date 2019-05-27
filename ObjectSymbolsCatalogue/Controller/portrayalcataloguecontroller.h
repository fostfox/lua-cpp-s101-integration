#pragma once





class PortrayalCatalogueBuilder;



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
    void addSymbolProfile(const QString &refId
                          , const pcatalogue::SymbolProfile& symbol
                          );
    void addColorProfile(const QString &refId
                         , const pcatalogue::ColorProfile& color
                         );
    void addLineStyle(const QString &refId
                      , double intervalLength
                      , double width
                      , QString color
                      , QVector<std::pair<QString, double>> refSymbolAndPos
                      , QVector<std::pair<double, double>> dashStartLenght
                      );
    void addSymbolFill(const QString &refId
                       , const graphic_base::Vector& v1
                       , const graphic_base::Vector& v2
                       , const QString &AreaCRSType
                       );

private:
    using refid_t = QString;
    QMap<refid_t, pcatalogue::SymbolProfile> m_symbolProfileMap;
    QMap<refid_t, pcatalogue::ColorProfile> m_colorProfileMap;
    QMap<refid_t, line_styles::LineStyle> m_lineStyleMap;
    QMap<refid_t, area_fills::SymbolFill> m_symbolFillMap;
};
