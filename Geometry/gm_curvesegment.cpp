#include "gm_curvesegment.h"


using Type = InterpolationTypes;


InterpolationType::InterpolationType(InterpolationTypes t)
    :EnumType<Type>(t)
{
    initMaps();
}

InterpolationType::InterpolationType(std::string t)
    :EnumType<Type>(t)
{
    initMaps();
}

void InterpolationType::initMaps()
{
    modEnumToStrMap(m_enumToStrMap) = {
            { Type::NONE, "None" },
            { Type::LINEAR, "Linear" },
            { Type::GEODESIC, "Geodesic" },
            { Type::ARC3_POINTS, "Arc3Points" },
            { Type::LOXODROMIC, "Loxodromic" },
            { Type::ELLIPTICAL, "Elliptical" },
            { Type::CONIC, "Conic" },
            { Type::CIRCULAR_ARC_CENTER_POINT_WITH_RADIUS, "CircularArcCenterPointWithRadius" },
    };
    initEnumToStrMap();
}


GM_CurveSegment::GM_CurveSegment(const QVector<GM_Point> &controlPoints, const InterpolationType &interpolation)
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

InterpolationType GM_CurveSegment::interpolation() const
{
    return m_interpolation;
}

