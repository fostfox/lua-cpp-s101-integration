#pragma once

#include "enumtype.h"


enum class FC_SpatialPrimitiveTypes {
    Point,
    PointSet,
    Curve,
    Surface,
    Coverage,
    NoGeometry
};

class FC_SpatialPrimitiveType : public EnumType<FC_SpatialPrimitiveTypes>
{
  public:
    FC_SpatialPrimitiveType() = default;
    FC_SpatialPrimitiveType(const QString& type);
    FC_SpatialPrimitiveType(FC_SpatialPrimitiveTypes type);

private:
    void initMaps();
};
