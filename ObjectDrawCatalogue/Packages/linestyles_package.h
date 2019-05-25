#ifndef LINESTYLES_PACKAGE_H
#define LINESTYLES_PACKAGE_H

#include "graphicbase_package.h"

#include <optional>
#include <QVector>
#include <QString>
#include <QMap>


namespace LineStyles {

enum class JoinStyle {
    BEVEL,
    MITER,
    ROUND
};
const static QMap<QString, JoinStyle> toJoinStyleMap = {
    { "Bevel", JoinStyle::BEVEL },
    { "Miter", JoinStyle::MITER },
    { "Round", JoinStyle::ROUND },
};
JoinStyle toJoinStyle(const QString &type);

enum class CapStyle {
    BUTT,
    SQUARE,
    ROUND
};
const static QMap<QString, CapStyle> toCapStyleMap = {
    { "Butt", CapStyle::BUTT },
    { "Square", CapStyle::SQUARE },
    { "Round", CapStyle::ROUND },
};
CapStyle toCapStyle(const QString & type);

class Dash
{
public:
    Dash(double start, double length);
private:
    double m_start;
    double m_length;
};


class LineSymbol
{
public:
    LineSymbol();
private:
    QString m_reference;
    double m_rotation;
    double m_scaleFactor;
    GraphicBase::CRSType m_crsType;
    double m_position;
};


class AbstractLineStyle
{
public:
    AbstractLineStyle();
    virtual ~AbstractLineStyle();
};


class LineStyle : public AbstractLineStyle
{
public:
    LineStyle(double offset, CapStyle capStyle, JoinStyle joinStyle, GraphicBase::Pen pen);

    QVector<Dash> dash() const;
    void addDash(const Dash &dash);

private:
    double m_offset;
    CapStyle m_capStyle;
    JoinStyle m_joinStyle;
    std::optional<double> m_intervalLength;
    QVector<Dash> m_dash;
    GraphicBase::Pen m_pen;
    QVector<LineSymbol> m_symbols;
};
};


}

#endif // LINESTYLES_PACKAGE_H
