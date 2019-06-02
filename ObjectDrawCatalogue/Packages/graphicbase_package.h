#pragma once

#include <QMap>

namespace graphic_base {

enum class CRSType{
    GEOGRAPHIC_CRS,
    PORTRAYAL_CRS,
    LOCAL_CRS,
    LINE_CRS,
};
CRSType toCRSType(const QString &type);


class Point
{
public:
    Point(double x, double y);
    double x() const;
    double y() const;

private:
    double m_x;
    double m_y;
};

class Vector
{
public:
    Vector(double x, double y);
    double x() const;
    double y() const;

private:
    double m_x;
    double m_y;
};

class Color
{
public:
    Color() = default;
    Color(const QString &token, double transparency);
    QString token() const;
    double transparency() const;

private:
    QString m_token;
    double m_transparency;
};

class Pen
{
public:
    Pen() = default;
    Pen(double width, Color color);
    double width() const;
    Color color() const;

private:
    double m_width;
    Color m_color;
};

};
