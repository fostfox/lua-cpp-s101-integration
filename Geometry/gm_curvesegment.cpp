#include "gm_curvesegment.h"

GM_CurveSegment::GM_CurveSegment(const QVector<GM_Point> &controlPoints, GM_CurveSegment::InterpolationTypes interpolation)
    :m_controlPoints(controlPoints), m_interpolation(interpolation)
{

}

void GM_CurveSegment::addControlPoint(const GM_Point &controlPoint)
{
    m_controlPoints.push_back(controlPoint);
}

QVector<GM_Point> GM_CurveSegment::controlPoints() const
{
    return m_controlPoints;
}

GM_CurveSegment::InterpolationTypes GM_CurveSegment::interpolation() const
{
    return m_interpolation;
}

