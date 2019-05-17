#pragma once

#include <QVector>

#include "gm_point.h"
#include "gm_object.h"


class GM_MultiPoint : public GM_Object
{
public:
    GM_MultiPoint() = default;
    GM_MultiPoint(const QVector<GM_Point>& points);
    ~GM_MultiPoint() = default;

    void addPoint(const GM_Point& point);

    const QVector<GM_Point>& points() const;
    Type getType() const;

private:
    QVector<GM_Point> m_points;
};
