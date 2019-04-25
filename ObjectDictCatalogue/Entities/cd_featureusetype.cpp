#include "cd_featureusetype.h"


using Type = CD_FeatureUseTypes;


CD_FeatureUseType::CD_FeatureUseType(CD_FeatureUseTypes type)
    :EnumType<Type>(type)
{
    initMaps();
}

CD_FeatureUseType::CD_FeatureUseType(std::string type)
    :EnumType<Type>(type)
{
    initMaps();
}

void CD_FeatureUseType::initMaps()
{
    modEnumToStrMap(m_enumToStrMap) = {
            { Type::GEOGRAPHIC     , "geographic" },
            { Type::META           , "meta" },
            { Type::CARTOGRAPHIC   , "cartographic" },
            { Type::THEME          , "theme" }
    };
    initEnumToStrMap();
}
