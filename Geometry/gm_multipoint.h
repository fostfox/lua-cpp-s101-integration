#pragma once

#include <QVector>

#include "gm_point.h"



class GM_MultiPoint
{
public:
    GM_MultiPoint() = default;
    GM_MultiPoint(const QVector<GM_Point>& points);

    void addPoint(const GM_Point& point);

    QVector<GM_Point> points() const;

private:
    QVector<GM_Point> m_points;
};
