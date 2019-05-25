#include "graphicbase_package.h"

GraphicBase::CRSType GraphicBase::toCRSType(const QString &type)
{
    if (!toCRSTypeMap.contains(type)){
        qFatal("has no CRS type in map");
    }
    return toCRSTypeMap[type];
}
