#include "fc_spatialprimitivetype.h"

using Type = FC_SpatialPrimitiveTypes;

FC_SpatialPrimitiveType::FC_SpatialPrimitiveType(const QString &type)
    :EnumType<Type>(type)
{
    initMaps();
}

FC_SpatialPrimitiveType::FC_SpatialPrimitiveType(Type type)
    :EnumType<Type>(type)
{
    initMaps();
}

void FC_SpatialPrimitiveType::initMaps()
{
    modEnumToStrMap(m_enumToStrMap) = {
           { Type::Point,       "point", },
           { Type::PointSet,    "pointSet" },
           { Type::Curve,       "curve" },
           { Type::Surface,     "surface"  },
           { Type::Coverage,    "coverage"  },
           { Type::NoGeometry,  "noGeometry"  }
       };
    initEnumToStrMap();
}
