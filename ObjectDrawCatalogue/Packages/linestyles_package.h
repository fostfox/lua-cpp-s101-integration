#pragma once

#include "graphicbase_package.h"

#include <optional>
#include <QVector>


namespace line_styles {

enum class JoinStyle {
    BEVEL,
    MITER,
    ROUND
};
JoinStyle toJoinStyle(const QString &type);

enum class CapStyle {
    BUTT,
    SQUARE,
    ROUND
};
CapStyle toCapStyle(const QString & type);

class Dash
{
public:
    Dash() = default;
    Dash(double start, double length);
    double start() const;
    double length() const;

private:
    double m_start;
    double m_length;
};


class LineSymbol
{
public:
    LineSymbol(const QString& reference
               , double rotation
               , double scaleFactor
               , graphic_base::CRSType crsType
               , double position);
    QString reference() const;
    double rotation() const;
    double scaleFactor() const;
    graphic_base::CRSType crsType() const;
    double position() const;

private:
    QString m_reference;
    double m_rotation;
    double m_scaleFactor;
    graphic_base::CRSType m_crsType;
    double m_position;
};


class AbstractLineStyle
{
public:
    AbstractLineStyle() = default;
    virtual ~AbstractLineStyle() = default;
};


class LineStyleReference : public AbstractLineStyle
{
public:
    LineStyleReference(const QString& styleRef);
    QString styleRef() const;

private:
    QString m_styleRef;
};


class LineStyle : public AbstractLineStyle
{
public:
    LineStyle(double offset, CapStyle capStyle, JoinStyle joinStyle, const graphic_base::Pen& pen);

    QVector<Dash> dash() const;
    void addDash(const Dash &dash);

    const QVector<LineSymbol>& symbols() const;
    void addSymbol(const LineSymbol& symbol);

    std::optional<double> intervalLength() const;
    void setIntervalLength(double intervalLength);

    double offset() const;
    CapStyle capStyle() const;
    JoinStyle joinStyle() const;
    const graphic_base::Pen& pen() const;


private:
    double m_offset;
    CapStyle m_capStyle;
    JoinStyle m_joinStyle;
    std::optional<double> m_intervalLength;
    QVector<Dash> m_dash;
    graphic_base::Pen m_pen;
    QVector<LineSymbol> m_symbols;
};




}// namespace LineStyles
