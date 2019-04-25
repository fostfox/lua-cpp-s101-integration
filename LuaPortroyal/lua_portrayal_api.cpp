#include "lua_portrayal_api.h"

#include "../ObjectDictCatalogue/DataTypes/datatypes.h"
#include "../ObjectDictCatalogue/Entities/fc_item.h"
#include "../ObjectDictCatalogue/Entities/fc_role.h"
#include "../ObjectDictCatalogue/Entities/fc_featureassociation.h"
#include "../ObjectDictCatalogue/Entities/fc_simpleattribute.h"
#include "../ObjectDictCatalogue/Entities/fc_complexattribute.h"
#include "../ObjectDictCatalogue/Entities/fc_listedvalue.h"
#include "../ObjectDictCatalogue/Entities/fc_attributebinding.h"
#include "../ObjectDictCatalogue/Entities/fc_informationbinding.h"
#include "../ObjectDictCatalogue/Entities/fc_featurebinding.h"

#include <QDebug>

using std::string;
using std::vector;


sol::object createUpperMuliplicity(const sol::state& lua, const UnlimitedInteger &ui)
{
    sol::object upperMult = ui.infinite
            ? sol::nil
            : sol::make_object(lua, ui.value);
    return upperMult;
}


bool PortrayalMain(const sol::state &lua, const vector<string> &featureIDs)
{
   auto isSuccessPortrayal = lua["PortrayalMain"](featureIDs);
   return isSuccessPortrayal;
}

void PortrayalInitializeContextParameters(const sol::state &lua, const vector<ContextParameter> &contextParameters)
{
    vector<sol::object> luaContextParameters;
    
    qDebug() << __FUNCTION__;
    //throw "Нереализованная функциональность";
    //TODO: заполнение luaContextParameters

    lua["PortrayalInitializeContextParameters"](luaContextParameters);
}

sol::object PortrayalCreateContextParameter(const sol::state &lua, std::string name, string type, string defaultValue)
{
    sol::object luaContextParameter = lua["PortrayalCreateContextParameter"](
                name,
                type,
                defaultValue
                );
    return luaContextParameter;
}

sol::object luaCreateItem(const sol::state &lua, const FC_Item *item)
{
    sol::object luaItem = lua["CreateItem"](
                item->code(),
                item->name(),
                item->defenition(),
                item->remarks(),
                item->remarks()
                );
    return luaItem;
}

sol::object luaCreateAttributeBinding(const sol::state &lua, const FC_AttributeBinding *attrBind)
{
       sol::object luaAttributeBinding = lua["CreateAttributeBinding"](
                   attrBind->attributeCode(),
                   attrBind->multiplicity().lower,
                   createUpperMuliplicity(lua, attrBind->multiplicity().upper),
                   attrBind->sequentional(),
                   attrBind->permittedValues()
                   );
       return luaAttributeBinding;
}

sol::object luaCreateNamedType(const sol::state &lua, const sol::object &luaItem, const vector<sol::object> &luaAttributeBindingArr)
{
    sol::object luaNamedType = lua["CreateNamedType"](
                luaItem,
                false, //TODO: isAbstract
                luaAttributeBindingArr
                );
    return luaNamedType;
}

sol::object luaCreateInformationBinding(const sol::state &lua, const FC_InformationBinding *infBind)
{
    sol::object luaInformationBinding = lua["CreateInformationBinding"](
                infBind->informationType(),
                infBind->multiplicity().lower,
                createUpperMuliplicity(lua, infBind->multiplicity().upper),
                infBind->roleType().toQString(),
                sol::nil, //TODO: Role role (not defined)
                infBind->informationType()
                );
    return luaInformationBinding;
}

sol::object luaCreateObjectType(const sol::state& lua, sol::object LuaNamedType, std::vector<sol::object> LuaInformationBindings)
{
    sol::object luaObjectType = lua["CreateObjectType"](
                LuaNamedType,
                LuaInformationBindings
                );
    return luaObjectType;
}

sol::object luaCreateFeatureBinding(const sol::state &lua, const FC_FeatureBinding *fb)
{
//    sol::object luaRole = luaCreateRole(lua, fb.role());//TODO:: получение реальных ролей, а не кодов
//    sol::object luaFeatureAss = luaCreateFeatureAssociation(lua, fb.association());//TODO:: получение реальных ролей, а не кодов

//    sol::object luaObjectType = lua["CreateFeatureBinding"](
//                fb.featureType().toStdString(),
//                fb.multiplicity().lower,
//                createUpperMuliplicity(lua, fb.multiplicity().upper),
//                fb.roleType().toQString().toStdString(),
//                luaRole,
//                luaFeatureAss
//                );
//        return luaObjectType;
    throw ;
        return sol::object();
}


sol::object luaCreateFeatureAssociation(const sol::state &lua, const FC_FeatureAssociation *featureAssocoation)
{
//    auto luaItem = luaCreateItem(lua, featureAssocoation.header());
//    auto luaNamedType = luaCreateNamedType(lua, luaItem);

//    vector<sol::object> luaRoles;
//    luaRoles.reserve(featureAssocoation.role().size());
//    for (const auto &role : featureAssocoation.role()){ //TODO:: получение реальных ролей, а не кодов
//        auto luaRole = luaCreateRole(lua, role);
//        luaRoles.push_back(luaRole)
//    }

//    auto luaFeatureAss = lua["CreateFeatureAssociation"](
//                luaNamedType,
//                luaRoles,
//                sol::nil, //TODO superType
//                sol::nil // TODO: subType
//                );
//    return luaFeatureAss;
    throw ;
        return sol::object();
}

sol::object luaCreateRole(const sol::state &lua, const FC_Role *role)
{
    auto luaItem = luaCreateItem(lua, &role->header());
    auto luaRole = lua["CreateRole"](
                luaItem
                );
    return luaRole;
}

sol::object luaCreateInformationType(const sol::state &lua, sol::object luaObjectType, sol::object luaSuperType, std::vector<sol::object> luaSubTypes)
{
    auto infType = lua["CreateInformationType"](
                luaObjectType,
                luaSuperType,
                luaSubTypes
                );
}

sol::object luaCreateSimpleAttribute(const sol::state &lua, const FC_SimpleAttribute *sa)
{
    auto luaItem = luaCreateItem(lua, &sa->header());

    vector<sol::object> luaListedValues;
    for (const auto& listedValue : sa->listedValues()){
        auto luaListedValue = luaCreateListedValue(lua, &listedValue);
        luaListedValues.push_back(luaListedValue);
    }

    auto simplAttr = lua["CreateSimpleAttribute"](
                luaItem,
                sa->valueType().toQString(),
                sol::nil,
                sol::nil,
                sol::nil,
                luaListedValues
                );
    return simplAttr;
}

sol::object luaCreateListedValue(const sol::state &lua, const FC_ListedValue *lv)
{
    sol::object luaListedValue = lua["CreateListedValue"](
                lv->label(),
                lv->defenition(),
                lv->code(),
                lv->remarks(),
                lv->alias()
                );
    return luaListedValue;
}

sol::object luaCreateComplexAttribute(const sol::state &lua, const FC_ComplexAttribute *ca)
{
    auto luaItem = luaCreateItem(lua, &ca->header());

    vector<sol::object> subAttributeBindings;
    for (const auto& attrBind : ca->attributeBindings()){
        sol::object attrsBind = luaCreateAttributeBinding(lua, &attrBind);
        subAttributeBindings.push_back(attrsBind);
    }

    auto complAttr = lua["CreateComplexAttribute"](
                luaItem,
                subAttributeBindings
                );
    return complAttr;
}
