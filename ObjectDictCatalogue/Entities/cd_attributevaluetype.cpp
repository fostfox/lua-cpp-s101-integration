#include "cd_attributevaluetype.h"

using Type = CD_AttributeValueTypes;

CD_AttributeValueType::CD_AttributeValueType(CD_AttributeValueTypes t)
    :EnumType<Type>(t)
{
    initMaps();
}

CD_AttributeValueType::CD_AttributeValueType(std::string t)
    :EnumType<Type>(t)
{
    initMaps();
}

void CD_AttributeValueType::initMaps()
{
    modEnumToStrMap(m_enumToStrMap) = {
            { Type::BOOLEAN      , "boolean" },
            { Type::ENUMERATION  , "enumeration" },
            { Type::INTEGER      , "integer" },
            { Type::REAL         , "real" },
            { Type::TEXT         , "text" },
            { Type::DATE         , "date" },
    };
    initEnumToStrMap();
}
