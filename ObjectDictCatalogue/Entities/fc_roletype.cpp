#include "fc_roletype.h"

using Type = FC_RoleTypes;


FC_RoleType::FC_RoleType()
    :EnumType<Type>(Type::UNDEFINED)
{
    initMaps();
}

FC_RoleType::FC_RoleType(std::string type)
    :EnumType<Type> (type)
{
    initMaps();
}

FC_RoleType::FC_RoleType(FC_RoleTypes type)
    :EnumType<Type> (type)
{
    initMaps();
}

void FC_RoleType::initMaps()
{
    modEnumToStrMap(m_enumToStrMap) = {
           { Type::Association, "association" } ,
           { Type::Aggregation, "aggregation" } ,
           { Type::Composition, "composition" },
           { Type::UNDEFINED    , "undefined" }
    };
    initEnumToStrMap();
}
