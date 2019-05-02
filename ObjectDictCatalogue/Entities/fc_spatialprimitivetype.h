#pragma once

#include "enumtype.h"


enum class FC_SpatialPrimitiveTypes {
    Point,
    PointSet,
    Curve,
    Surface,
    Coverage,
    NoGeometry,

    /*
     * Undefined object type. Perhaps the default constructor
     * created a Type Object, so the type was set by default.
    */
    UNDEFINED
};

class FC_SpatialPrimitiveType : public EnumType<FC_SpatialPrimitiveTypes>
{
  public:
    FC_SpatialPrimitiveType();
    FC_SpatialPrimitiveType(const std::string& type);
    FC_SpatialPrimitiveType(FC_SpatialPrimitiveTypes type);

private:
    void initMaps();
};
