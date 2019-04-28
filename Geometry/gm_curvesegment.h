#pragma once

#include <QVector>

#include "gm_point.h"

#include "../ObjectDictCatalogue/Entities/enumtype.h"


enum class InterpolationTypes {
    NONE,
    LINEAR,
    GEODESIC,
    ARC3_POINTS,
    LOXODROMIC,
    ELLIPTICAL,
    CONIC,
    CIRCULAR_ARC_CENTER_POINT_WITH_RADIUS
  };

class InterpolationType : public EnumType<InterpolationTypes>
{
  public:
    InterpolationType() = default;
    InterpolationType(InterpolationTypes t);
    InterpolationType(std::string t);

  private:
    void initMaps();
};




class GM_CurveSegment
{
public:
    GM_CurveSegment(const QVector<GM_Point>& controlPoints, const InterpolationType& interpolation);

    void addControlPoint(const GM_Point &controlPoint);

    QVector<GM_Point> controlPoints() const;
    InterpolationType interpolation() const;



private:
    QVector<GM_Point> m_controlPoints;
    InterpolationType m_interpolation;
};
