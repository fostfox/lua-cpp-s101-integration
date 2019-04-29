#include "gm_point.h"


#include <optional>

using std::optional;



GM_Point::GM_Point(Real x, Real y)
    :m_x(x), m_y(y)
{
    m_z = new std::optional<Real>{};
}

GM_Point::GM_Point(Real x, Real y, Real z)
    :m_x(x), m_y(y)
{
    m_z = new std::optional<Real>{z};
}

GM_Point::~GM_Point()
{
    //delete m_z; TODO: ned fix memory leackage
}

bool GM_Point::hasZ() const
{
    return m_z->has_value();
}


Real GM_Point::x() const
{
    return m_x;
}

Real GM_Point::y() const
{
    return m_y;
}

Real GM_Point::z() const
{
    return m_z->value();
}
