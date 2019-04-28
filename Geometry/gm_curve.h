#pragma once

#include "gm_curvesegment.h"

class GM_Curve
{
public:
    GM_Curve(const GM_Point& startPoint, const GM_Point& endPoint, QVector<GM_CurveSegment> segments);


    GM_Point startPoint() const;
    GM_Point endPoint() const;
    QVector<GM_CurveSegment> segments() const;

private:
    GM_Point m_startPoint;
    GM_Point m_endPoint;
    QVector<GM_CurveSegment> m_segments;
};
