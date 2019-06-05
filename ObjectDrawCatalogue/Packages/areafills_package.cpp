#include "areafills_package.h"

area_fills::AreaCRSType area_fills::toAreaCRSType(const QString &type)
{
    const static QMap<QString, AreaCRSType> toAreaCRSTypeMap = {
        { "Global", AreaCRSType::GLOBAL },
        { "LocalGeometry", AreaCRSType::LOCAL_GEOMETRY },
        { "GlobalGeometry", AreaCRSType::GLOBAL_GEOMETRY },
    };
    if (!toAreaCRSTypeMap.contains(type)){
        qFatal("has no AreaCRSType type in map");
    }
    return toAreaCRSTypeMap[type];
}

area_fills::AreaFillReference::AreaFillReference(const QString& reference)
    :m_reference(reference)
{
}

const QString& area_fills::AreaFillReference::reference() const
{
    return m_reference;
}

area_fills::ColorFill::ColorFill(graphic_base::Color color)
    :m_color(color)
{
}

const graphic_base::Color& area_fills::ColorFill::color() const
{
    return m_color;
}

area_fills::SymbolFill::SymbolFill()
    :AbstractAreaFill ()
{

}

area_fills::SymbolFill::SymbolFill(const symbol::Symbol& symbol, const graphic_base::Vector& v1, const graphic_base::Vector& v2)
    :m_symbol(symbol), m_v1(v1), m_v2(v2)
{
}

const graphic_base::Vector& area_fills::SymbolFill::v2() const
{
    return m_v2;
}

const graphic_base::Vector& area_fills::SymbolFill::v1() const
{
    return m_v1;
}

const symbol::Symbol& area_fills::SymbolFill::symbol() const
{
    return m_symbol;
}
