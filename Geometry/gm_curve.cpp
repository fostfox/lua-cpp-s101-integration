#include "gm_curve.h"

GM_Curve::GM_Curve(const GM_Point &startPoint, const GM_Point &endPoint, QVector<GM_CurveSegment> segments)
    :m_startPoint(startPoint)
    ,m_endPoint(endPoint)
    ,m_segments(segments)
{

}

GM_Point GM_Curve::startPoint() const
{
    return m_startPoint;
}

GM_Point GM_Curve::endPoint() const
{
    return m_endPoint;
}

QVector<GM_CurveSegment> GM_Curve::segments() const
{
    return m_segments;
}
