#pragma once

#include "symbol_package.h"


namespace area_fills {

enum class AreaCRSType {
    GLOBAL,
    LOCAL_GEOMETRY,
    GLOBAL_GEOMETRY
};
AreaCRSType toAreaCRSType(const QString &type);


class AbstractAreaFill
{
public:
    AbstractAreaFill() = default;
    virtual ~AbstractAreaFill() = default;
};


class AreaFillReference : public AbstractAreaFill
{
public:
    AreaFillReference(const QString &reference);
    const QString &reference() const;

private:
    QString m_reference;
};


class ColorFill : public AbstractAreaFill
{
public:
    ColorFill(graphic_base::Color color);
    const graphic_base::Color &color() const;

private:
    graphic_base::Color m_color;
};


class SymbolFill : public AbstractAreaFill
{
public:
    SymbolFill();
    SymbolFill(const symbol::Symbol &symbol, const graphic_base::Vector &v1, const graphic_base::Vector &v2);
    const symbol::Symbol& symbol() const;
    const graphic_base::Vector& v1() const;
    const graphic_base::Vector& v2() const;

private:
    symbol::Symbol m_symbol;
    graphic_base::Vector m_v1;
    graphic_base::Vector m_v2;
};

}
