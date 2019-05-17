#include "gm_point.h"


#include <optional>

//using std::optional;



GM_Point::GM_Point(const std::string &x, const std::string &y)
    :m_x(x), m_y(y)
{
}

GM_Point::GM_Point(const std::string &x, std::string y, const std::string &z)
    :m_x(x), m_y(y)
{
    m_z = z;
}


bool GM_Point::hasZ() const
{
    return m_z.has_value();
}

GM_Object::Type GM_Point::getType() const
{
    return GM_Object::POINT;
}


const std::string& GM_Point::x() const
{
    return m_x;
}

const std::string& GM_Point::y() const
{
    return m_y;
}

const std::string &GM_Point::z() const
{
    return m_z.value();
}
