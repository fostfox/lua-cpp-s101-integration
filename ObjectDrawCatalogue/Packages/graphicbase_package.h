#ifndef GRAPHICBASE_PACKAGE_H
#define GRAPHICBASE_PACKAGE_H

#include <QString>
#include <QMap>

namespace GraphicBase {

enum class CRSType{
    GEOGRAPHIC_CRS,
    PORTRAYAL_CRS,
    LOCAL_CRS,
    LINE_CRS,
};

const static QMap<QString, CRSType> toCRSTypeMap = {
    { "GeographicCRS", CRSType::GEOGRAPHIC_CRS },
    { "PortrayalCRS", CRSType::PORTRAYAL_CRS },
    { "LocalCRS", CRSType::LOCAL_CRS },
    { "LineCRS", CRSType::LINE_CRS },
};

CRSType toCRSType(const QString &type);


class Point
{
public:
    Point();
private:
    double m_x;
    double m_y;
};

class Vector
{
public:
    Vector(double x, double y);
private:
    double m_x;
    double m_y;
};

class Color
{
public:
    Color(QString token, double transparency);
private:
    QString m_token;
    double m_transparency;
};

class Pen
{
public:
    Pen(double width, Color color);
private:
    double m_width;
    Color m_color;
};

}
#endif // GRAPHICBASE_PACKAGE_H
