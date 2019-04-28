#pragma once

#include <QVector>

#include "gm_point.h"



class GM_CurveSegment
{
public:
    enum InterpolationTypes {
        None, Linear, Geodesic, Arc3Points, Loxodromic, Elliptical, Conic, CircularArcCenterPointWithRadius
    } ;

    GM_CurveSegment(const QVector<GM_Point>& controlPoints, InterpolationTypes interpolation);

    void addControlPoint(const GM_Point &controlPoint);

    QVector<GM_Point> controlPoints() const;
    InterpolationTypes interpolation() const;


private:
    QVector<GM_Point> m_controlPoints;
    InterpolationTypes m_interpolation;
};
