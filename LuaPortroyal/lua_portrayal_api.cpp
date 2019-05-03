#include "lua_portrayal_api.h"

#include <algorithm>

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

#include "../Geometry/gm_point.h"
#include "../Geometry/gm_multipoint.h"
#include "../Geometry/gm_curve.h"
#include "../Geometry/gm_curvesegment.h"
#include "../Geometry/gm_compositecurve.h"
#include "../Geometry/gm_surface.h"


#include "../ObjectMapCatalogue/Entries/feature.h"

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


sol::table helpCreateAttributeBindings(sol::state &lua, const QVector<FC_AttributeBinding> &atrBinds)
{
    sol::table luaAttributeBindings = lua.create_table();
    for (const auto &attrBind : atrBinds){
        auto attributeBinding = luaCreateAttributeBinding(lua, &attrBind);
        luaAttributeBindings.add(attributeBinding);
    }
    return luaAttributeBindings;
}

sol::table helpCreateInformationBindings(sol::state &lua, const QVector<FC_InformationBinding> &infBinds)
{
    sol::table luaInformationBindings = lua.create_table();
    for (const auto &infBind: infBinds){
        auto luaInformationBinding = luaCreateInformationBinding(lua, &infBind);
        luaInformationBindings.add(luaInformationBinding);
    }
    return luaInformationBindings;
}

sol::table helpCreateFeatureBindings(sol::state &lua, const QVector<FC_FeatureBinding> &featBinds)
{
    sol::table luaFeatureBindings = lua.create_table();
    for (const auto &featureBind : featBinds){
        auto luaFeatureBind = luaCreateFeatureBinding(lua, &featureBind);
        luaFeatureBindings.add(luaFeatureBind);
    }
    return luaFeatureBindings;
}

sol::table helpCreatePointsArray(sol::state &lua, const QVector<GM_Point> &points)
{
    sol::table luaPoints = lua.create_table();
    for(const auto & p : points) {
        luaPoints.add(luaCreatePoint(lua, p));
    }
    return luaPoints;
}


sol::table helpCreateSpatialAssociations(sol::state &lua, const QVector<Fe2spRef> &spatialAssociations)
{
    sol::table luaspAss = lua.create_table();
    for(const auto & spAss : spatialAssociations) {
        luaspAss.add(luaCreateSpatialAssociation(lua, spAss));
    }
    return luaspAss;
}


sol::table helpCreateRoles(sol::state &lua, const QVector<FC_Role> &roles)
{
    sol::table luaRoles = lua.create_table();
    for (const auto &role : roles){ //TODO:: получение реальных ролей, а не кодов
        auto luaRole = luaCreateRole(lua, &role);
        luaRoles.add(luaRole);
    }
    return luaRoles;
}

//template<typename T>
//sol::table helpLuaTable(sol::state &lua, const std::vector<T> &seq)
//{
//    sol::table luaRoles = lua.create_table();
//    for (const auto &s : seq) {
//        luaRoles.add(s);
//    }
//    return luaRoles;
//}

sol::table helpEmptyTable(sol::state &lua)
{
    return lua.create_table();
}

bool PortrayalMain(sol::state &lua, const vector<string> &featureIDs)
{
    auto luaFeatureIDs = helpLuaTable(lua, featureIDs);
    auto isSuccessPortrayal = lua["PortrayalMain"](luaFeatureIDs);
    return isSuccessPortrayal;
}

void PortrayalInitializeContextParameters(sol::state &lua, const ContexParametrController &contextParameters)
{
    sol::table luaContextParameters = lua.create_table();
    for (const auto& cp : contextParameters.contextParameters()){
        auto luaCP = PortrayalCreateContextParameter(lua, cp);
        luaContextParameters.add(luaCP);
    }
    lua["PortrayalInitializeContextParameters"](
                luaContextParameters
                );
}

sol::object PortrayalCreateContextParameter(const sol::state &lua, const ContextParameter &param)
{
    sol::object luaContextParameter = lua["PortrayalCreateContextParameter"](
                param.id(),
                param.type(),
                param.defaultValue()
                );
    return luaContextParameter;
}

sol::object luaCreateItem(sol::state &lua, const FC_Item *item)
{
    auto luaaAliases = helpLuaTable(lua, item->alias());  //TODO: Need to Improve

    sol::object luaItem = lua["CreateItem"](
                item->code(),
                item->name(),
                item->defenition(),
                item->remarks(),
                luaaAliases
                );
    return luaItem;
}

sol::object luaCreateAttributeBinding(sol::state &lua, const FC_AttributeBinding *attrBind)
{
    sol::table permittedValues = lua.create_table();
    for (const auto& pValue : attrBind->permittedValues()){
        permittedValues.add(pValue);
    }

    sol::object luaAttributeBinding = lua["CreateAttributeBinding"](
                attrBind->attributeCode(),
                attrBind->multiplicity().lower,
                createUpperMuliplicity(lua, attrBind->multiplicity().upper),
                attrBind->sequentional(),
                permittedValues
                );
    return luaAttributeBinding;
}

sol::object luaCreateNamedType(const sol::state &lua, const sol::object &luaItem, const sol::table& luaAttributeBindingArr)
{
    sol::object luaNamedType = lua["CreateNamedType"](
                luaItem,
                false, //TODO: isAbstract
                luaAttributeBindingArr
                );
    return luaNamedType;
}

sol::object luaCreateInformationBinding(sol::state &lua, const FC_InformationBinding *infBind)
{
    auto luaInfAss = luaCreateInformationAssociation(lua, &infBind->associationRef());
    auto luaRole = luaCreateRole(lua, &infBind->roleRef());

    sol::object luaInformationBinding = lua["CreateInformationBinding"](
                infBind->informationType(),
                infBind->multiplicity().lower,
                createUpperMuliplicity(lua, infBind->multiplicity().upper),
                infBind->roleType().toQString(),
                luaRole,
                luaInfAss
                );
    return luaInformationBinding;
}

sol::object luaCreateObjectType(const sol::state& lua, const sol::object& LuaNamedType, const sol::table& LuaInformationBindings)
{
    sol::object luaObjectType = lua["CreateObjectType"](
                LuaNamedType,
                LuaInformationBindings
                );
    return luaObjectType;
}

sol::object luaCreateFeatureBinding(sol::state &lua, const FC_FeatureBinding *fb)
{
    sol::object luaRole = luaCreateRole(lua, &fb->roleRef());//TODO:: получение реальных ролей, а не кодов
    sol::object luaFeatureAss = luaCreateFeatureAssociation(lua, &fb->associationRef());//TODO:: получение реальных ролей, а не кодов

    //sol::table

    sol::object luaFeatureBinding = lua["CreateFeatureBinding"](
                fb->featureType(),
                fb->multiplicity().lower,
                createUpperMuliplicity(lua, fb->multiplicity().upper),
                fb->roleType().toQString(),
                luaRole,
                luaFeatureAss
                );
        return luaFeatureBinding;
}


sol::object luaCreateFeatureAssociation(sol::state &lua, const FC_FeatureAssociation *featureAssocoation)
{
    auto item = featureAssocoation->header();
    auto luaItem = luaCreateItem(lua, &item);
    auto luaNamedType = luaCreateNamedType(lua, luaItem, lua.create_table()); // TODO: temorary create empy table

    sol::table luaRoles = helpCreateRoles(lua, featureAssocoation->roleRefs());

    auto luaFeatureAss = lua["CreateFeatureAssociation"](
                luaNamedType,
                luaRoles,
                sol::nil, //TODO superType
                sol::nil // TODO: subType
                );
    return luaFeatureAss;
}

sol::object luaCreateRole(sol::state &lua, const FC_Role *role)
{
    auto luaItem = luaCreateItem(lua, &role->header());
    auto luaRole = lua["CreateRole"](
                luaItem
                );
    return luaRole;
}

sol::object luaCreateInformationType(const sol::state &lua, sol::object luaObjectType, sol::object luaSuperType, sol::table luaSubTypes)
{
    auto infType = lua["CreateInformationType"](
                luaObjectType,
                luaSuperType,
                luaSubTypes
                );
    return infType;
}

sol::object luaCreateSimpleAttribute(sol::state &lua, const FC_SimpleAttribute *sa)
{
    auto luaItem = luaCreateItem(lua, &sa->header());

    sol::table luaListedValues = lua.create_table();
    for (const auto& listedValue : sa->listedValues()){
        auto luaListedValue = luaCreateListedValue(lua, &listedValue);
        luaListedValues.add(luaListedValue);
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

sol::object luaCreateListedValue(sol::state &lua, const FC_ListedValue *lv)
{
    sol::object remarks = lv->remarks().empty()
            ? sol::nil
            : sol::make_object(lua, lv->remarks()[0]);
    sol::table alias = helpLuaTable(lua, lv->alias());  // TODO; нужно улучшить

    sol::object luaListedValue = lua["CreateListedValue"](
                lv->label(),
                lv->defenition(),
                lv->code(),
                remarks,
                alias
                );
    return luaListedValue;
}

sol::object luaCreateComplexAttribute(sol::state &lua, const FC_ComplexAttribute *ca)
{
    auto luaItem = luaCreateItem(lua, &ca->header());

    sol::table subAttributeBindings = helpCreateAttributeBindings(lua, ca->attributeBindings());

    auto complAttr = lua["CreateComplexAttribute"](
                luaItem,
                subAttributeBindings
                );
    return complAttr;
}



sol::table luaCreateFeatureType(const sol::state &lua, const sol::object &luaObjectType, const std::string &featureUseType, const sol::table &permittedPrimitives, const sol::table &luaFeatureBindings, sol::object luaSuperType, sol::table luaSubType)
{    
    sol::table featureType = lua["CreateFeatureType"](
                luaObjectType,
                featureUseType,
                permittedPrimitives,
                luaFeatureBindings,
                luaSuperType,
                luaSubType
                );
    return featureType;

}

sol::object luaCreateSpatialAssociation(const sol::state &lua, const Fe2spRef &spAssociation)
{
    string spType;

    switch (spAssociation.refType()) {
    case 110: spType = "Point"; break;
    //case : spType = "MultiPoint"; break;
    case 120: spType = "Curve"; break;
    case 125: spType = "CompositeCurve"; break;
    case 130: spType = "Surface"; break;
    default:
        qDebug() << "ref Type " << spAssociation.refType();
        throw "Unsupported Spatial type (refType)";
    }

    string orient;
    switch (spAssociation.orientation()) {
    case 1: orient = "Forward"; break;
    case 2: orient = "Forward"; break;
    case 255: orient = "Reverse"; break;
    default:
        throw "Unsupported Spatial orientation (orientation)";
    }

    string spatialID = std::to_string(spAssociation.refId());

    sol::object featureType = lua["CreateSpatialAssociation"](
                spType,
                spatialID,
                orient,
                spAssociation.scamin(),
                spAssociation.scamax()
                );
    return featureType;

}

sol::object luaCreatePoint(const sol::state &lua, const GM_Point& point)
{
    sol::object z = point.hasZ()
            ? sol::make_object(lua, std::to_string(point.z()))
            : sol::nil;

    sol::object luaPoint  = lua["CreatePoint"] (
                std::to_string(point.x()),
                std::to_string(point.y()),
                z
                );

    return luaPoint;
}

sol::object luaCreateMultiPoint(sol::state &lua, const GM_MultiPoint& mp)
{
    sol::object luaPoint  = lua["CreateMultiPoint"] (
                helpCreatePointsArray(lua, mp.points())
                );
    return luaPoint;
}

sol::object luaCreateCurveSegment(sol::state &lua, const GM_CurveSegment& cs)
{
    sol::object luaPoint  = lua["CreateCurveSegment"] (
                helpCreatePointsArray(lua, cs.controlPoints()),
                cs.interpolation().toQString()
                );

    return luaPoint;
}

sol::object luaCreateCurve(sol::state &lua, const GM_Curve& c)
{
    sol::object luaStartPoint = luaCreatePoint(lua, c.startPoint());
    sol::object luaEndPoint = luaCreatePoint(lua, c.endPoint());

    sol::table luaSeqments = lua.create_table();
    for (const auto& segm : c.segments()) {
        luaSeqments.add(luaCreateCurveSegment(lua, segm));
    }
    sol::object luaPoint  = lua["CreateCurve"] (
                luaStartPoint,
                luaEndPoint,
                luaSeqments
                );

    return luaPoint;
}

sol::object luaCreateCompositeCurve(sol::state &lua, const GM_CompositeCurve& cc)
{
    sol::object luaPoint  = lua["CreateCompositeCurve"] (
                helpCreateSpatialAssociations(lua, cc.curveAssociations())
                );
    return luaPoint;
}

sol::object luaCreateSurface(sol::state &lua, const GM_Surface& ss)
{
    auto exteriorRing = luaCreateSpatialAssociation(lua, ss.exteriorRing());

    auto lueInteriorRings = ss.hasInteriorRings()
            ? helpCreateSpatialAssociations(lua, ss.interiorRings())
            : sol::nil;

    sol::object luaPoint  = lua["CreateSurface"] (
                exteriorRing,
                lueInteriorRings
                );
    return luaPoint;
}




sol::object luaGetUnknownAttributeString(sol::state &lua)
{
    return lua["GetUnknownAttributeString"](
            );
}

sol::object luaCreateInformationAssociation(sol::state &lua, const FC_InformationAssociation *infAss)
{
    auto luaItem = luaCreateItem(lua, &infAss->header());
    auto luaAttrBind = helpEmptyTable(lua);
    auto luaNamedType = luaCreateNamedType(lua, luaItem, luaAttrBind);

    auto luaRoles = helpCreateRoles(lua, infAss->rolesRef());

    return lua["CreateInformationAssociation"](
            luaNamedType,
            luaRoles,
            sol::nil,
            helpEmptyTable(lua)
            );
}


