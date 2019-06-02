#include "linestyles_package.h"

line_styles::JoinStyle line_styles::toJoinStyle(const QString &type)
{
    const static QMap<QString, JoinStyle> toJoinStyleMap = {
        { "Bevel", JoinStyle::BEVEL },
        { "Miter", JoinStyle::MITER },
        { "Round", JoinStyle::ROUND },
    };
    if (!toJoinStyleMap.contains(type)){
        qFatal("has no JoinStyle type in map");
    }
    return toJoinStyleMap[type];
}

line_styles::CapStyle line_styles::toCapStyle(const QString &type)
{
    const static QMap<QString, CapStyle> toCapStyleMap = {
        { "Butt", CapStyle::BUTT },
        { "Square", CapStyle::SQUARE },
        { "Round", CapStyle::ROUND },
    };
    if (!toCapStyleMap.contains(type)){
        qFatal("has no CapStyle type in map");
    }
    return toCapStyleMap[type];
}

line_styles::LineStyle::LineStyle(double offset, line_styles::CapStyle capStyle, line_styles::JoinStyle joinStyle, const graphic_base::Pen &pen)
    :m_offset(offset), m_capStyle(capStyle), m_joinStyle(joinStyle), m_pen(pen)
{

}

QVector<line_styles::Dash> line_styles::LineStyle::dash() const
{
    return m_dash;
}

void line_styles::LineStyle::addDash(const line_styles::Dash &dash)
{
    m_dash.push_back(dash);
}

const QVector<line_styles::LineSymbol> &line_styles::LineStyle::symbols() const
{
    return m_symbols;
}

void line_styles::LineStyle::addSymbol(const line_styles::LineSymbol &symbol)
{
    m_symbols.push_back(symbol);
}

void line_styles::LineStyle::setIntervalLength(double intervalLength)
{
    m_intervalLength = intervalLength;
}

const graphic_base::Pen &line_styles::LineStyle::pen() const
{
    return m_pen;
}

std::optional<double> line_styles::LineStyle::intervalLength() const
{
    return m_intervalLength;
}

line_styles::JoinStyle line_styles::LineStyle::joinStyle() const
{
    return m_joinStyle;
}

Qt::PenJoinStyle line_styles::LineStyle::joinStyleQt() const
{
    switch (m_joinStyle) {
    case JoinStyle::BEVEL:
        return Qt::PenJoinStyle::BevelJoin;
    case JoinStyle::MITER:
        return Qt::PenJoinStyle::MiterJoin;
    case JoinStyle::ROUND:
        return Qt::PenJoinStyle::RoundJoin;
    }
}

line_styles::CapStyle line_styles::LineStyle::capStyle() const
{
    return m_capStyle;
}

Qt::PenCapStyle line_styles::LineStyle::capStyleQt() const
{
    switch (m_capStyle) {
    case CapStyle::BUTT:
        return Qt::PenCapStyle::FlatCap;
    case CapStyle::ROUND:
        return Qt::PenCapStyle::RoundCap;
    case CapStyle::SQUARE:
        return Qt::PenCapStyle::SquareCap;
    }
}

double line_styles::LineStyle::offset() const
{
    return m_offset;
}

line_styles::Dash::Dash(double start, double length)
    :m_start(start), m_length(length)
{

}

double line_styles::Dash::start() const
{
    return m_start;
}

double line_styles::Dash::length() const
{
    return m_length;
}

QString line_styles::LineStyleReference::styleRef() const
{
    return m_styleRef;
}

line_styles::LineStyleReference::LineStyleReference(const QString &styleRef)
    :m_styleRef(styleRef)
{
}

line_styles::LineSymbol::LineSymbol(const QString &reference, double rotation, double scaleFactor, graphic_base::CRSType crsType, double position)
    :m_reference(reference), m_rotation(rotation), m_scaleFactor(scaleFactor), m_crsType(crsType), m_position(position)
{

}

double line_styles::LineSymbol::position() const
{
    return m_position;
}

graphic_base::CRSType line_styles::LineSymbol::crsType() const
{
    return m_crsType;
}

double line_styles::LineSymbol::scaleFactor() const
{
    return m_scaleFactor;
}

double line_styles::LineSymbol::rotation() const
{
    return m_rotation;
}

QString line_styles::LineSymbol::reference() const
{
    return m_reference;
}
