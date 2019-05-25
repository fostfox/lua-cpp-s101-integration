#include "areafills_package.h"

AreaFills::AreaCRSType AreaFills::toAreaCRSType(const QString &type)
{
    if (!toAreaCRSTypeMap.contains(type)){
        qFatal("has no AreaCRSType type in map");
    }
    return toAreaCRSTypeMap[type];
}
