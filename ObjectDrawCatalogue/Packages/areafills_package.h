#ifndef AREAFILLS_PACKAGE_H
#define AREAFILLS_PACKAGE_H

#include "graphicbase_package.h"
#include "symbol_package.h"


namespace AreaFills {

enum class AreaCRSType {
    GLOBAL,
    LOCAL_GEOMETRY,
    GLOBAL_GEOMETRY
};
const static QMap<QString, AreaCRSType> toAreaCRSTypeMap = {
    { "Global", AreaCRSType::GLOBAL },
    { "LocalGeometry", AreaCRSType::LOCAL_GEOMETRY },
    { "GlobalGeometry", AreaCRSType::GLOBAL_GEOMETRY },
};
AreaCRSType toAreaCRSType(const QString &type);


class AbstractAreaFill
{
public:
    AbstractAreaFill();
    virtual ~AbstractAreaFill();
};


class AreaFillReference : public AbstractAreaFill
{
public:
    AreaFillReference(QString m_reference);
private:
    QString m_reference;
};


class ColorFill : public AbstractAreaFill
{
public:
    ColorFill(GraphicBase::Color color);
private:
    GraphicBase::Color m_color;
};


class SymbolFill : public AbstractAreaFill
{
public:
    SymbolFill();
private:
    Symbol::Symbol m_symbol;
    GraphicBase::Vector m_v1;
    GraphicBase::Vector m_v2;
};

}
#endif // AREAFILLS_PACKAGE_H
