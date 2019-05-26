#include "graphicbase_package.h"

graphic_base::CRSType graphic_base::toCRSType(const QString &type)
{
    const static QMap<QString, CRSType> toCRSTypeMap = {
        { "GeographicCRS", CRSType::GEOGRAPHIC_CRS },
        { "PortrayalCRS", CRSType::PORTRAYAL_CRS },
        { "LocalCRS", CRSType::LOCAL_CRS },
        { "LineCRS", CRSType::LINE_CRS },
    };
    if (!toCRSTypeMap.contains(type)){
        qFatal("has no CRS type in map");
    }
    return toCRSTypeMap[type];
}

graphic_base::Point::Point(double x, double y)
    :m_x(x), m_y(y)
{
}

double graphic_base::Point::y() const
{
    return m_y;
}

double graphic_base::Point::x() const
{
    return m_x;
}

graphic_base::Vector::Vector(double x, double y)
    :m_x(x), m_y(y)
{

}

double graphic_base::Vector::x() const
{
    return m_x;
}

double graphic_base::Vector::y() const
{
    return m_y;
}

graphic_base::Color::Color(const QString &token, double transparency)
    :m_token(token), m_transparency(transparency)
{

}

QString graphic_base::Color::token() const
{
    return m_token;
}

double graphic_base::Color::transparency() const
{
    return m_transparency;
}

graphic_base::Pen::Pen(double width, graphic_base::Color color)
    :m_width(width), m_color(color)
{

}

double graphic_base::Pen::width() const
{
    return m_width;
}

graphic_base::Color graphic_base::Pen::color() const
{
    return m_color;
}
