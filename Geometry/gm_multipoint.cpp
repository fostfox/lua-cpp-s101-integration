#include "gm_multipoint.h"

GM_MultiPoint::GM_MultiPoint(const QVector<GM_Point> &points)
    :m_points(points)
{

}

void GM_MultiPoint::addPoint(const GM_Point &point)
{
    m_points.push_back(point);
}

QVector<GM_Point> GM_MultiPoint::points() const
{
    return m_points;
}
