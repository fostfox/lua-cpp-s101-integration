#pragma once

#include <QVector>

#include "gm_point.h"

#include "../ObjectDictCatalogue/Entities/enumtype.h"
#include "gm_object.h"

enum class InterpolationTypes {
    NONE,
    LINEAR,
    GEODESIC,
    ARC3_POINTS,
    LOXODROMIC,
    ELLIPTICAL,
    CONIC,
    CIRCULAR_ARC_CENTER_POINT_WITH_RADIUS,
    /*
     * Undefined object type. Perhaps the default constructor
     * created a Type Object, so the type was set by default.
    */
    UNDEFINED
  };

class InterpolationType : public EnumType<InterpolationTypes>
{
  public:
    InterpolationType();
    InterpolationType(InterpolationTypes t);
    InterpolationType(std::string t);

  private:
    void initMaps();
};

class GM_CurveSegment : public GM_Object
{
public:
    GM_CurveSegment() = default;
    GM_CurveSegment(const QVector<GM_Point>& controlPoints);
    GM_CurveSegment(const QVector<GM_Point>& controlPoints, const InterpolationType& interpolation);
    ~GM_CurveSegment() = default;

    void addControlPoint(const GM_Point &controlPoint);

    QVector<GM_Point> controlPoints() const;
    InterpolationType interpolation() const;
    Type getType() const;


private:
    QVector<GM_Point> m_controlPoints;
    InterpolationType m_interpolation = InterpolationTypes::LOXODROMIC;
};
