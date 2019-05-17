#include "gm_curve.h"

GM_Curve::GM_Curve(const GM_Point &startPoint, const GM_Point &endPoint, QVector<GM_CurveSegment> segments)
    :m_startPoint(startPoint)
    ,m_endPoint(endPoint)
    ,m_segments(segments)
{

}

void GM_Curve::setStartPoint(const GM_Point &p)
{
    m_startPoint = p;
}

void GM_Curve::setEndPoint(const GM_Point &p)
{
    m_endPoint = p;
}

void GM_Curve::setSegments(const QVector<GM_CurveSegment> &seg)
{
    m_segments = seg;
}

void GM_Curve::addSegment(const GM_CurveSegment &seg)
{
    m_segments.push_back(seg);
}

const GM_Point &GM_Curve::startPoint() const
{
    return m_startPoint;
}

const GM_Point &GM_Curve::endPoint() const
{
    return m_endPoint;
}

const QVector<GM_CurveSegment> &GM_Curve::segments() const
{
    return m_segments;
}

GM_Object::Type GM_Curve::getType() const
{
    return GM_Object::CURVE;
}
