#include "host_func_def.h"

#include "config.h"

#include "lua_portrayal_api.h"
#include "Geometry/gm_compositecurve.h"
#include "Geometry/gm_curve.h"
#include "Geometry/gm_curvesegment.h"
#include "Geometry/gm_multipoint.h"
#include "Geometry/gm_point.h"
#include "Geometry/gm_surface.h"

#include "ObjectDictCatalogue/Controllers/featurecataloguecontroller.h"
#include "ObjectMapCatalogue/Controllers/featurescontroller.h"
#include "ObjectDrawCatalogue/drawing_instructions_controller.h"

#include "profiler.h"

#include <QVector>
#include <QString>
#include <algorithm>
#include <functional>
#include <string>

using std::string;
using std::vector;

LuaHostFunc::LuaHostFunc(
        sol::state& lua
        ,const FeatureCatalogueController &dictObjCtrl
        ,const FeatureMapController &mapObjCtrl
        ,const ContexParametrController &contParamController
        ,DrawingInstructionsController &drawInstrCtrl)
    :m_lua(lua)
    ,m_mapObjCtrl(mapObjCtrl)
    ,m_dictObjCtrl(dictObjCtrl)
    ,m_contParamCtrl(contParamController)
    ,m_drawInstrCtrl(drawInstrCtrl)
    ,m_isActionState(true)
{
    loadFunctions();

    PortrayalInitializeContextParameters(m_lua, contParamController);


    //m_lua["TypeSystemChecks"]("true");

}

bool LuaHostFunc::doPortrayal()
{
    auto featuresIDs = m_mapObjCtrl.getFeaturesIDs();
    bool isSuccess = PortrayalMain(m_lua, featuresIDs);
    return isSuccess;
}

LuaHostFunc::~LuaHostFunc()
{
//    sol::table i1 = m_lua["calls"];
//    std::cerr << "cals\n" << std::endl;
//    i1.for_each([](sol::object key, sol::object value){
//        std::cerr << key.as<std::string>() << ";" << value.as<std::string>() << std::endl;
//    });
//    sol::table i2 = m_lua["total"];
//    std::cerr << "total\n" << std::endl;
//    i2.for_each([](sol::object key, sol::object value){
//            std::cerr << key.as<std::string>() << ";" << value.as<std::string>() << std::endl;
//    });
//    sol::table i11 = m_lua["calls1"];
//    std::cerr << "cals1\n" << std::endl;
//    i11.for_each([](sol::object key, sol::object value){
//        std::cerr << key.as<std::string>() << ";" << value.as<std::string>() << std::endl;
//    });
//    sol::table i21 = m_lua["total1"];
//    std::cerr << "total1\n" << std::endl;
//    i21.for_each([](sol::object key, sol::object value){
//            std::cerr << key.as<std::string>() << ";" << value.as<std::string>() << std::endl;
//    });
//    sol::table i12 = m_lua["calls2"];
//    std::cerr << "cals2\n" << std::endl;
//    i12.for_each([](sol::object key, sol::object value){
//        std::cerr << key.as<std::string>() << ";" << value.as<std::string>() << std::endl;
//    });
//    sol::table i22 = m_lua["total2"];
//    std::cerr << "total2\n" << std::endl;
//    i22.for_each([](sol::object key, sol::object value){
//            std::cerr << key.as<std::string>() << ";" << value.as<std::string>() << std::endl;
//    });
//    sol::table i13 = m_lua["calls3"];
//    std::cerr << "cals3\n" << std::endl;
//    i13.for_each([](sol::object key, sol::object value){
//        std::cerr << key.as<std::string>() << ";" << value.as<std::string>() << std::endl;
//    });
//    sol::table i23 = m_lua["total3"];
//    std::cerr << "total3\n" << std::endl;
//    i23.for_each([](sol::object key, sol::object value){
//            std::cerr << key.as<std::string>() << ";" << value.as<std::string>() << std::endl;
//    });
}

void LuaHostFunc::loadFunctions()
{
    m_lua.set_function("HostPortrayalEmit", &LuaHostFunc::HostPortrayalEmit, this);
    m_lua.set_function("HostGetFeatureIDs", &LuaHostFunc::HostGetFeatureIDs, this);
    m_lua.set_function("HostFeatureGetCode", &LuaHostFunc::HostFeatureGetCode, this);
    m_lua.set_function("HostInformationTypeGetCode", &LuaHostFunc::HostInformationTypeGetCode, this);
    m_lua.set_function("HostFeatureGetSimpleAttribute", &LuaHostFunc::HostFeatureGetSimpleAttribute, this);
    m_lua.set_function("HostFeatureGetComplexAttributeCount", &LuaHostFunc::HostFeatureGetComplexAttributeCount, this);
    m_lua.set_function("HostFeatureGetSpatialAssociations", &LuaHostFunc::HostFeatureGetSpatialAssociations, this);
    m_lua.set_function("HostFeatureGetAssociatedFeatureIDs", &LuaHostFunc::HostFeatureGetAssociatedFeatureIDs, this);
    m_lua.set_function("HostFeatureGetAssociatedInformationIDs", &LuaHostFunc::HostFeatureGetAssociatedInformationIDs, this);
    m_lua.set_function("HostGetSpatial", &LuaHostFunc::HostGetSpatial, this);
    m_lua.set_function("HostSpatialGetAssociatedInformationIDs", &LuaHostFunc::HostSpatialGetAssociatedInformationIDs, this);
    m_lua.set_function("HostSpatialGetAssociatedFeatureIDs", &LuaHostFunc::HostSpatialGetAssociatedFeatureIDs, this);
    m_lua.set_function("HostInformationTypeGetSimpleAttribute", &LuaHostFunc::HostInformationTypeGetSimpleAttribute, this);
    m_lua.set_function("HostInformationTypeGetComplexAttributeCount", &LuaHostFunc::HostInformationTypeGetComplexAttributeCount, this);
    m_lua.set_function("HostGetFeatureTypeCodes", &LuaHostFunc::HostGetFeatureTypeCodes, this);
    m_lua.set_function("HostGetInformationTypeCodes", &LuaHostFunc::HostGetInformationTypeCodes, this);
    m_lua.set_function("HostGetSimpleAttributeTypeCodes", &LuaHostFunc::HostGetSimpleAttributeTypeCodes, this);
    m_lua.set_function("HostGetComplexAttributeTypeCodes", &LuaHostFunc::HostGetComplexAttributeTypeCodes, this);
    m_lua.set_function("HostGetRoleTypeCodes", &LuaHostFunc::HostGetRoleTypeCodes, this);
    m_lua.set_function("HostGetInformationAssociationTypeCodes", &LuaHostFunc::HostGetInformationAssociationTypeCodes, this);
    m_lua.set_function("HostGetFeatureAssociationTypeCodes", &LuaHostFunc::HostGetFeatureAssociationTypeCodes, this);
    m_lua.set_function("HostGetFeatureTypeInfo", &LuaHostFunc::HostGetFeatureTypeInfo, this);
    m_lua.set_function("HostGetInformationTypeInfo", &LuaHostFunc::HostGetInformationTypeInfo, this);
    m_lua.set_function("HostGetSimpleAttributeTypeInfo", &LuaHostFunc::HostGetSimpleAttributeTypeInfo, this);
    m_lua.set_function("HostGetComplexAttributeTypeInfo", &LuaHostFunc::HostGetComplexAttributeTypeInfo, this);

#ifdef DEBUG_OUT_ENABLE
    m_lua.set_function("HostDebuggerEntry", &LuaHostFunc::HostDebuggerEntry, this);
#endif
}

/*!
 * \brief HostPortrayalEmit
 * \param featureID: String
 *          > Used by the host to uniquely identify a feature instance.
 * \param drawingInstructions: String (DEF)
 *          > All of the drawing instructions generated for the feature instance identified by featureID.
 *            This string is in Data Exchange Format (DEF) as described in Part 13.
 * \param observedParameters: String (DEF)
 *          > The context parameters that were observed during the generation of the drawing
 *            instructions for this feature. This string is in DEF.
 * \return True
 *          > Continue script processing. The portrayal engine will continue to process feature
 *            instances.
 * \return False
 *          > Terminate script processing. No additional feature instances will be processed by the
 *            portrayal engine.
 * \remarks
 *          This function is called from the Portrayal Catalogue once per feature instance to provide drawing
 *          instructions to the host.
 *          The host can optionally use the observed context parameters to perform drawing instruction
 *          caching.
 */
bool LuaHostFunc::HostPortrayalEmit(const std::string &featureID, const std::string &drawingInstructions, const std::string &observedParameters)
{
    //PROFILING_TIME2("HostPortrayalEmit")
    m_drawInstrCtrl.setDrawInstr(stoi(featureID),
                                  DrawingInstructions (drawingInstructions)
                                  );
    return m_isActionState;
}

/*!
 * \brief HostGetFeatureIDs
 * \return string[]
 *          > A Lua array containing all of the feature IDs in the dataset.
 * \remarks
 *          Instructs the host to return all feature IDs relevant to the current scripting catalogue operation.
 *          This would typically be all of the features in an S100_Dataset or S100_DataCoverage.
 *          As discussed in clause 13-8, the host is responsible for ensuring each feature ID uniquely
 *          identifies a single feature instance among all product types and datasets to be used during
 *          the current scripting session.
 */
const sol::table LuaHostFunc::HostGetFeatureIDs()
{
    //PROFILING_TIME2("HostGetFeatureIDs")
    const auto &luaFeaturesIds = helpLuaTable(m_lua, m_mapObjCtrl.getFeaturesIDs());
    return luaFeaturesIds;
}

/*!
 * \brief HostFeatureGetCode
 * \param featureID: string
 *          > Used by the host to uniquely identify a feature instance.
 * \return string
 *          > The code defined by the Feature Catalogue for the feature type of the feature
 *            instance.
 * \remarks
 *          Instructs the host to return the feature type code for the feature instance identified by
 *          featureID.
 */
const std::string LuaHostFunc::HostFeatureGetCode(const std::string &featureID)
{
    //PROFILING_TIME2("HostFeatureGetCode")
    const auto& featCtrl = m_dictObjCtrl.featureTypeCtrl();

    string featureCode = m_mapObjCtrl.getCodeById(stoi(featureID));
    if (!featCtrl.hasInMap(featureCode)){ ///TODO:
//            // Попробуем найти среди alias'ов
//            for (const auto& feature : featCtrl.types()){
//                const auto& featAliases = feature.header().alias();
//                auto it = std::find(featAliases.begin(), featAliases.end(), featureCode);
//                // Обновляем на реальный FeatureCode, если alias совпадает
//                if (it != featAliases.end()){
//                    featureCode = feature.header().code();
//                    break;
//                }
//            }

        if (m_dictObjCtrl.hasInfeatureAliasMap(featureCode)){
            featureCode = m_dictObjCtrl.featureCode(featureCode);
        } else {
            qFatal(("No Feature " + featureID).c_str());
        }
    }
    return featureCode;
}

/*!
 * \brief HostInformationTypeGetCode
 * \param informationTypeID: string
 *          > Used by the host to uniquely identify an information type instance.
 * \return string
            > The code defined by the Feature Catalogue for the information type of the information
              type instance.
 * \remarks
 *          Instructs the host to return the information type code for the information type instance
 *          identified by informationTypeID.
 */
const std::string LuaHostFunc::HostInformationTypeGetCode(const std::string &informationTypeID)
{
    //PROFILING_TIME2("HostInformationTypeGetCode")
    const auto& informationTypeCode = luaGetUnknownAttributeString(m_lua);
    return informationTypeCode;
}

/*!
 * \brief HostFeatureGetSimpleAttribute
 * \param featureID: string
 *          > Used by the host to uniquely identify a feature instance.
 * \param path: path (string DEF)
 *          > An attribute path as described in clause 13-6.2
 * \param attributeCode: string
 *          > One of the attribute codes defined in the Feature Catalogue for the feature type
 *            identified by featureID.
 * \return string[]
 *          > The textual representation of each attribute value, as described in clause 13-8.1. An
 *            array is returned even if the attribute has a single value.
 * \remarks
 *          Instructs the host to perform a simple attribute lookup on the attribute attributeCode at the
 *          path path for the feature instance identified by featureID. An empty array is returned if the
 *          requested attribute is not present
 */
const sol::table LuaHostFunc::HostFeatureGetSimpleAttribute(const std::string &featureID, const std::string &path, const std::string &attributeCode)
{
    //PROFILING_TIME2("HostFeatureGetSimpleAttribute")

    sol::table simpleAtrValues;
    bool isSetSimpleAttrOnMap = m_mapObjCtrl.hasSimpleAttribute(stoi(featureID), path, attributeCode);

    if (isSetSimpleAttrOnMap){
        auto atribute = m_mapObjCtrl.getSimpleAttribute(stoi(featureID), path, attributeCode);
        simpleAtrValues = helpLuaTable(m_lua, atribute.value());
    } else {
        simpleAtrValues = m_lua.create_table();
        simpleAtrValues.add(luaGetUnknownAttributeString(m_lua));
    }

    return simpleAtrValues;
}

/*!
 * \brief HostFeatureGetComplexAttributeCount
 * \param featureID: string
 *          > Used by the host to uniquely identify a feature instance.
 * \param path: path (string DEF)
 *          > An attribute path as described in clause 13-6.2.
 * \param attributeCode: string
 *          > One of the attribute codes defined in the Feature Catalogue for the feature type
 *            identified by featureID.
 * \return integer
 *          > The number of matching complex attributes that exist at the path for the feature
 *            instance.
 * \remarks
 *          Instructs the host to return the number of attributes matching attributeCode at the given
 *          attribute path for the given feature instance. The given path will always be valid for the feature
 *          instance. The returned integer can be zero.
 */
int LuaHostFunc::HostFeatureGetComplexAttributeCount(const std::string &featureID, const std::string &path, const std::string &attributeCode)
{
    //PROFILING_TIME2("HostFeatureGetComplexAttributeCount")
    int featureCACount = static_cast<int>(
                m_mapObjCtrl.getComplexAttributeSize(stoi(featureID), path, attributeCode)
                );
    return featureCACount;
}

/*!
 * \brief HostFeatureGetSpatialAssociations
 * \param featureID: string
 *          > Used by the host to uniquely identify a feature instance.
 * \return SpatialAssociation[]
 *          > A Lua array containing all of the spatial associations for the feature instance
 *            represented by featureID.
 * \remarks
 *          Instructs the host to return an array containing the spatial associations for the given feature
 *          instance. For each spatial association the feature contains, the host calls the standard
 *          catalogue function CreateSpatialAssociation to create the SpatialAssociation object.
 *          The host should return an empty array if the feature has no spatial associations.
 */
const sol::table LuaHostFunc::HostFeatureGetSpatialAssociations(const std::string &featureID)
{//TODO: Точно на хосте всегда только один SpAss?
    //PROFILING_TIME2("HostFeatureGetSpatialAssociations")

    auto luaFSpatialAssociations = m_lua.create_table();

    if (m_mapObjCtrl.hasSpatialAssotiation(stoi(featureID))) {
        Fe2spRef featureSpatioalAss = m_mapObjCtrl.getFeatureById(stoi(featureID)).fe2spRef();
        auto luaFSAss = luaCreateSpatialAssociation(m_lua, featureSpatioalAss);
        luaFSpatialAssociations.add(luaFSAss);
    }

    return luaFSpatialAssociations;
}

/*!
 * \brief HostFeatureGetAssociatedFeatureIDs
 * \param featureID: string
 *          > Used by the host to uniquely identify a feature instance.
 * \param associationCode: string
 *          > Code for requested association as defined by the Feature Catalogue.
 * \param roleCode: string or nil
 *          > Code for requested role as defined by the Feature Catalogue. Can be nil if
 *            associationCode by itself is enough to specify the association or if all roles defined by
 *            associationCode are desired.
 * \return string[]
 *          > A Lua array containing the associated features IDs
 * \remarks
 *          When called, the host returns an array containing the feature IDs associated with the given
 *          feature instance that match associationCode and roleCode. If no matches are found the host
 *          returns an empty array.
 *          The roleCode may be nil, in which case only the associationCode should be used for lookup.
 */
const sol::table LuaHostFunc::HostFeatureGetAssociatedFeatureIDs(const std::string &featureID, const std::string &associationCode, const sol::object &roleCode)
{
    // TODO: HOST FUNCTION IS NOT IMPLEMENTED
            //PROFILING_TIME2("HostFeatureGetAssociatedFeatureIDs")
            [[maybe_unused]] const string& ac = associationCode;
            [[maybe_unused]] const sol::object & rc = roleCode;
            auto featureAssFeatureIDs = helpEmptyTable(m_lua);
            return featureAssFeatureIDs;
}

/*!
 * \brief HostFeatureGetAssociatedInformationIDs
 * \param featureID: string
 *          > Used by the host to uniquely identify a feature instance.
 * \param associationCode: string
 *          > Code for requested association as defined by the Feature Catalogue.
 * \param roleCode: string or nil
 *          > Code for requested role as defined by the Feature Catalogue. Can be nil if
 *            associationCode by itself is enough to specify the association or if all roles defined by
 *            associationCode are desired.
 * \return string[]
 *          > A Lua array containing the associated information IDs
 * \remarks
 *          When called, the host returns an array containing the information IDs associated with the
 *          given feature instance that match associationCode and roleCode. If no matches are found the
 *          host returns an empty array.
 *          The roleCode may be nil, in which case only the associationCode is used for lookup.
 */
const sol::table LuaHostFunc::HostFeatureGetAssociatedInformationIDs(const std::string &featureID, const std::string &associationCode, const sol::object &roleCode)
{
    // TODO: HOST FUNCTION IS NOT IMPLEMENTED
            //PROFILING_TIME2("HostFeatureGetAssociatedInformationIDs")
            [[maybe_unused]] const string& ac = associationCode;
            [[maybe_unused]] const sol::object & rc = roleCode;
            auto featureAssInfIDs = helpEmptyTable(m_lua);
            return featureAssInfIDs;
}

/*!
 * \brief HostGetSpatial
 * \param spatialID: string
 *          > Used by the host to uniquely identify a spatial.
 * \return Spatial
 *          > A spatial object created via a standard catalogue function as listed in the remarks.
 * \remarks
 *          Queries the host for a given spatial.
 *          The host returns a spatial object created by one of the standard catalogue functions defined
 *          in clause 13-8.1.1.
 */
const sol::table LuaHostFunc::HostGetSpatial(const std::string &spatialID)
{
    //PROFILING_TIME2("HostGetSpatial")

    if (!m_mapObjCtrl.hasSpatialObject(stoi(spatialID))){
        qFatal(("Ihe spatilalID=" + spatialID + " not on the map").c_str());
        return sol::nil;
    }
    auto spatialP = m_mapObjCtrl.spatialObjectByRefId(stoi(spatialID));

    sol::object luaSpatial;
    switch (spatialP->getType()) {
    case GM_Object::POINT: {
        luaSpatial = luaCreatePoint(m_lua, *static_cast<GM_Point*>(spatialP));
    } break;
    case GM_Object::MULTIPOINT: {
        luaSpatial = luaCreateMultiPoint(m_lua, *static_cast<GM_MultiPoint*>(spatialP));
    } break;
    case GM_Object::CURVE: {
        luaSpatial = luaCreateCurve(m_lua, *static_cast<GM_Curve*>(spatialP));
    } break;
    case GM_Object::COMPOSITE_CURVE: {
        luaSpatial = luaCreateCompositeCurve(m_lua, *static_cast<GM_CompositeCurve*>(spatialP));
    } break;
    case GM_Object::SURFACE: {
        luaSpatial = luaCreateSurface(m_lua, *static_cast<GM_Surface*>(spatialP));
    } break;
    default:
        //qFatal("Unsupported switch statment);
        qFatal("Orange it's not my life, but I'm gangster");
    }
    return luaSpatial;
}

/*!
 * \brief HostSpatialGetAssociatedInformationIDs
 * \param spatialID: string
 *          > Used by the host to uniquely identify a spatial.
 * \param associationCode: string
 *          > Code for requested association as defined by the feature catalogue.
 * \param roleCode: string or nil
 *          > Code for requested role as defined by the feature catalogue. Can be nil if
 *            associationCode by itself is enough to specify the association or if all roles defined by
 *            associationCode are desired.
 * \return nil
 *          > The information association is not valid for this spatial.
 * \return String[]
 *          > A Lua array containing the associated information IDs.
 * \remarks
 *          When called, the host returns an array containing the information IDs for the given spatial
 *          instance that match associationCode and roleCode. If the information association is not valid
 *          for this feature according to the feature catalogue, the host returns nil. If no matches are
 *          found the host returns an empty array.
 *          The roleCode may be nil, in which case only the associationCode is used for lookup.
 */
const sol::object LuaHostFunc::HostSpatialGetAssociatedInformationIDs(const std::string &spatialID, const std::string &associationCode, const sol::object &roleCode)
{
    // TODO: HOST FUNCTION IS NOT IMPLEMENTED
            //PROFILING_TIME2("HostSpatialGetAssociatedInformationIDs")
            [[maybe_unused]] const string& ac = associationCode;
            [[maybe_unused]] const sol::object & rc = roleCode;
            sol::object spatialAssInfIDs = helpEmptyTable(m_lua);
            return spatialAssInfIDs;
}

/*!
 * \brief HostSpatialGetAssociatedFeatureIDs
 * \param spatialID: string
 *          > Used by the host to uniquely identify a spatial.
 * \return string[]
 *          > A Lua array containing the requested associated feature IDs for the spatial identified
 *            by spatialID.
 * \return Nil
 *          > No features are associated to the spatial identified by spatialID.
 * \remarks
 *          When called, the host returns an array of all feature instances that reference the given spatia
 *          A feature instance is considered to be associated to a spatial either directly through the
 *          spatial associations on the feature, or indirectly in the case of curves referenced by composite
 *          curves.
 */
const sol::object LuaHostFunc::HostSpatialGetAssociatedFeatureIDs(const std::string &spatialID)
{
    //PROFILING_TIME2("HostSpatialGetAssociatedFeatureIDs")
    sol::object spatialAssFeaturesIDs = helpEmptyTable(m_lua);
    return spatialAssFeaturesIDs;
}

/*!
 * \brief HostInformationTypeGetSimpleAttribute
 * \param informationTypeID: string
 *          > Used by the host to uniquely identify an information instance.
 * \param path: path (string DEF)
 *          > An attribute path as defined in clause 13-6.2
 * \param attributeCode: string
 *          > One of the attribute codes defined in the Feature Catalogue for the information type
 *            identified by informationTypeID.
 * \return string[] or nil
 *          > The textual representation of each attribute value, as described in clause 13-8.1. An
 *            array is returned even if the attribute has a single value. The host should return nil if
 *            the requested attribute is not present.
 * \remarks
 *          Instructs the host to perform a simple attribute lookup on the attribute attributeCode at the
 *          indicated path for the information instance identified by informationTypeID. Nil is returned if
 *          the requested attribute is not present.
 */
const sol::object LuaHostFunc::HostInformationTypeGetSimpleAttribute(const std::string &informationTypeID, const std::string &path, const std::string &attributeCode)
{
    // TODO: HOST FUNCTION IS NOT IMPLEMENTED
            //PROFILING_TIME2("HostInformationTypeGetSimpleAttribute")
            [[maybe_unused]] const string& p = path;
            [[maybe_unused]] const string& ac = attributeCode;
            sol::object informSimpleAttrValue = sol::nil;
            return informSimpleAttrValue;
}

/*!
 * \brief HostInformationTypeGetComplexAttributeCount
 * \param informationTypeID: string
 *          > Used by the host to uniquely identify an information instance.
 * \param path: path (string DEF)
 *          > An attribute path as defined in clause 13-6.2
 * \param attributeCode: string
 *          > One of the attribute codes defined in the Feature Catalogue for the information type
 *            identified by informationTypeID.
 * \return integer
 *          > The number of matching complex attributes that exist at the path for the information
 *            instance.
 * \remarks
 *          Instructs the host to return the number of attributes matching attributeCode at the given
 *          attribute path for the given information instance. The given path will always be valid for the
 *          information instance. The returned integer can be zero.
 */
int LuaHostFunc::HostInformationTypeGetComplexAttributeCount(const std::string &informationTypeID, const std::string &path, const std::string &attributeCode)
{
    // TODO: HOST FUNCTION IS NOT IMPLEMENTED
           //PROFILING_TIME2("HostInformationTypeGetComplexAttributeCount")
           [[maybe_unused]] const string& p = path;
           [[maybe_unused]] const string& ac = attributeCode;
           int informCompleAttrCount = 0;
           return informCompleAttrCount;
}

/*!
 * \brief HostGetFeatureTypeCodes
 * \return string[]
 *         > Array containing all feature type codes as defined in the Feature Catalogue.
 */
const sol::table LuaHostFunc::HostGetFeatureTypeCodes()
{
    //PROFILING_TIME2("HostGetFeatureTypeCodes")
    const auto& featureTypeCodes = m_dictObjCtrl.featureTypeCtrl().codes();
    auto luafeatureTypeCodes = helpLuaTable(m_lua, featureTypeCodes);
    return luafeatureTypeCodes;
}

/*!
 * \brief HostGetInformationTypeCodes()
 * \return string[]
 *         > Array containing all information type codes as defined in the Feature Catalogue.
 */
const sol::table LuaHostFunc::HostGetInformationTypeCodes()
{
    //PROFILING_TIME2("HostGetInformationTypeCodes")
    const auto& informTypeCodes = m_dictObjCtrl.informationTypeCrtl().codes();
    auto luaInformTypeCodes = helpLuaTable(m_lua, informTypeCodes);
    return luaInformTypeCodes;
}

/*!
 * \brief HostGetSimpleAttributeTypeCodes
 * \return string[]
 *         > Array containing all simple attribute type codes as defined in the Feature Catalogue.
 */
const sol::table LuaHostFunc::HostGetSimpleAttributeTypeCodes()
{
    //PROFILING_TIME2("HostGetSimpleAttributeTypeCodes")
    const auto& simpleAtrTypeCodes = m_dictObjCtrl.simpleAttributeCtrl().codes();
    auto luaSimpleAtrTypeCodes = helpLuaTable(m_lua, simpleAtrTypeCodes);
    return luaSimpleAtrTypeCodes;
}

/*!
 * \brief HostGetComplexAttributeTypeCodes
 * \return string[]
 *         > Array containing all complex attribute type codes as defined in the Feature
 *           Catalogue.
 */
const sol::table LuaHostFunc::HostGetComplexAttributeTypeCodes()
{
    //PROFILING_TIME2("HostGetComplexAttributeTypeCodes")
    const auto& complexAttrTypeCodes = m_dictObjCtrl.complexAttributeCtrl().codes();
    auto luaComplexAttrTypeCodes = helpLuaTable(m_lua, complexAttrTypeCodes);
    return luaComplexAttrTypeCodes;
}

/*!
 * \brief HostGetRoleTypeCodes
 * \return string[]
 *         > Array containing all role type codes as defined in the Feature Catalogue.
 */
const sol::table LuaHostFunc::HostGetRoleTypeCodes()
{
    //PROFILING_TIME2("HostGetRoleTypeCodes")
    const auto& roleTypeCodes = m_dictObjCtrl.rolesCtrl().codes();
    auto luaRoleTypeCodes = helpLuaTable(m_lua, roleTypeCodes);
    return luaRoleTypeCodes;
}

/*!
 * \brief HostGetInformationAssociationTypeCodes
 * \return string[]
 *         > Array containing all information association type codes as defined in the Feature
 *           Catalogue.
 */
const sol::table LuaHostFunc::HostGetInformationAssociationTypeCodes()
{
    //PROFILING_TIME2("HostGetInformationAssociationTypeCodes")
    const auto& infAssTypeCodes = m_dictObjCtrl.informationAssociationCtrl().codes();
    auto luaInfAssTypeCodes = helpLuaTable(m_lua, infAssTypeCodes);
    return luaInfAssTypeCodes;
}

/*!
 * \brief HostGetFeatureAssociationTypeCodes
 * \return string[]
 *         > Array containing all feature association type codes as defined in the Feature
 *           Catalogue.
 */
const sol::table LuaHostFunc::HostGetFeatureAssociationTypeCodes()
{
    //PROFILING_TIME2("HostGetFeatureAssociationTypeCodes")
    const auto& featureAssTypeCodes = m_dictObjCtrl.featureAssociationCtrl().codes();
    auto luaFeatureAssTypeCodes = helpLuaTable(m_lua, featureAssTypeCodes);
    return luaFeatureAssTypeCodes;
}

/*!
 * \brief HostGetFeatureTypeInfo
 * \param featureCode: string
 *          > Feature code matching an entry in the Feature Catalogue.
 * \return FeatureType
 *          > Lua data structure created by the CreateFeatureType() function.
 */
const sol::table LuaHostFunc::HostGetFeatureTypeInfo(std::string featureCode)
{
    //PROFILING_TIME2("HostGetFeatureTypeInfo")
    const FC_FeatureType &featureType = m_dictObjCtrl.featureTypeCtrl().type(featureCode);


    auto luaAttributeBindings = helpCreateAttributeBindings(m_lua, featureType.attributeBindings());
    auto luaInformationBindings = helpCreateInformationBindings(m_lua, featureType.informationBindings());
    auto luaFeatureBindings = helpCreateFeatureBindings(m_lua, featureType.featureBindings());

    auto luaItem = luaCreateItem(m_lua, &featureType.header());
    auto luaNamedType = luaCreateNamedType(m_lua, luaItem, luaAttributeBindings);
    auto luaObjectType = luaCreateObjectType(m_lua, luaNamedType, luaInformationBindings);

    sol::table luaPermittedPrimitives = m_lua.create_table();
    for (const auto& pp : featureType.permittedPrimitives()) {
        luaPermittedPrimitives.add(pp.toQString());
    }

    auto luaFeatureType = luaCreateFeatureType(
                m_lua,
                luaObjectType,
                featureType.featureUseType().toQString(),
                luaPermittedPrimitives,
                luaFeatureBindings
                );
    return luaFeatureType;
}

/*!
 * \brief HostGetInformationTypeInfo
 * \param informationCode: string
 *          > Information code matching an entry in the Feature Catalogue.
 * \return InformationType
 *          > Lua data structure created by the CreateInformationType() function.
 */
const sol::object LuaHostFunc::HostGetInformationTypeInfo(const std::string &informationCode)
{
    //PROFILING_TIME
    //PROFILING_TIME2("HostGetInformationTypeInfo")
    const auto &infType = m_dictObjCtrl.informationTypeCrtl().type(informationCode);

    auto luaAttributeBindings = helpCreateAttributeBindings(m_lua, infType.attributeBindings());

    auto luaItem = luaCreateItem(m_lua, &infType.header());
    auto luaNamedType = luaCreateNamedType(m_lua, luaItem, luaAttributeBindings);
    auto luaObjectType = luaCreateObjectType(m_lua, luaNamedType);

    auto luaInfType = luaCreateInformationType(m_lua, luaObjectType, sol::nil, sol::nil); //TODO: проверить аргументы, точно nil??
    return luaInfType;
}

/*!
 * \brief HostGetSimpleAttributeTypeInfo
 * \param attributeCode: string
 *          > Simple attribute code matching an entry in the Feature Catalogue.
 * \return SimpleAttribute
 *          > Lua data structure created by the CreateSimpleAttribute() function.
 */
const sol::object LuaHostFunc::HostGetSimpleAttributeTypeInfo(const std::string &attributeCode)
{
    //PROFILING_TIME2("HostGetSimpleAttributeTypeInfo")
    const auto &simplAttrType = m_dictObjCtrl.simpleAttributeCtrl().type(attributeCode);
    auto simpleAttrs = luaCreateSimpleAttribute(m_lua, &simplAttrType);
    return simpleAttrs;
}

/*!
 * \brief HostGetComplexAttributeTypeInfo
 * \param attributeCode: string
 *          > Complex attribute code matching an entry in the Feature Catalogue.
 * \return ComplexAttribute
 *          > Lua data structure created by the CreateComplexAttribute() function.
 */
const sol::object LuaHostFunc::HostGetComplexAttributeTypeInfo(const std::string &attributeCode)
{
    //PROFILING_TIME2("HostGetComplexAttributeTypeInfo")
    const auto &complAttrType = m_dictObjCtrl.complexAttributeCtrl().type(attributeCode);
    auto complexAttrs = luaCreateComplexAttribute(m_lua, &complAttrType);
    return complexAttrs;
}

/*!
 * \brief HostDebuggerEntry
 * \param debugAction: string
 *          > Indicates the requested debugger action:
 *                      break – Pause execution of the script.
 *                      Trace – Display a string in the debugging console.
 *                      Start_profiler – Begin line by line profiling of the script code.
 *                      Stop_profiler – Stop line by line profiling of the script code.
 * \param message: string
 *          > Message to display on the debugging console. This is optional for all debug actions
 *            except trace, where it is mandatory.
 * \remarks
 *          Host implementation of this function is optional.
 */
void LuaHostFunc::HostDebuggerEntry(const std::string &debugAction, const sol::object &msg)
{
    //qDebug() << "call HostDebuggerEntry";
    QString message;
    if (msg.is<int>() ||msg.is<double>() ){
        message = QString::number(msg.as<int>());
    } else if (msg.is<bool>()){
        message = msg.as<bool>() ? "True" : "False";
    } else if (msg == sol::nil){
        message = "nil";
    } else if (msg.is<string>()){
        message = msg.as<string>().c_str();
    }

    QString str;

    if ("break" == debugAction){
        m_isActionState = false;
        throw "Break from LUA";
    } else if ("trace" == debugAction) {
        qCritical(QString::fromStdString("currentFeatureId_processFeaturePortrayal: %1 %2 %3 %4")
                  .arg(m_currentFeatureId_processFeaturePortrayal)
                  .arg(str)
                  .arg(QString::fromStdString(debugAction))
                  .arg(message).toLocal8Bit().data());
        return;
    } else if ("start_performance" == debugAction) {
        //return;
    } else if ("stop_performance" == debugAction) {
        //return;
    } else if ("reset_performance" == debugAction) {

    } else {
        qWarning("Undefined debugger action");
    }

    qDebug((str + " " + QString::fromStdString(debugAction) + " # " + message).toLocal8Bit().data());
}



