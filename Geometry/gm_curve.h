#pragma once

#include "gm_curvesegment.h"
#include "gm_object.h"

class GM_Curve : public GM_Object
{
public:
    GM_Curve() = default;
    GM_Curve(const GM_Point& startPoint, const GM_Point& endPoint, QVector<GM_CurveSegment> segments);
    ~GM_Curve() = default;

    void setStartPoint(const GM_Point& p);
    void setEndPoint(const GM_Point& p);
    void setSegments(const QVector<GM_CurveSegment>& seg);
    void addSegment(const GM_CurveSegment& seg);

    GM_Point startPoint() const;
    GM_Point endPoint() const;
    QVector<GM_CurveSegment> segments() const;
    Type getType() const;

private:
    GM_Point m_startPoint;
    GM_Point m_endPoint;
    QVector<GM_CurveSegment> m_segments;
};
