#include "gm_point.h"


#include <optional>

using std::optional;



GM_Point::GM_Point(std::string x, std::string y)
    :m_x(x), m_y(y)
{
    m_z = new std::optional<std::string>{};
}

GM_Point::GM_Point(std::string x, std::string y, std::string z)
    :m_x(x), m_y(y)
{
    m_z = new std::optional<std::string>{z};
}

bool GM_Point::hasZ() const
{
    return m_z->has_value();
}

GM_Object::Type GM_Point::getType() const
{
    return GM_Object::POINT;
}


std::string GM_Point::x() const
{
    return m_x;
}

std::string GM_Point::y() const
{
    return m_y;
}

std::string GM_Point::z() const
{
    return m_z->value();
}
