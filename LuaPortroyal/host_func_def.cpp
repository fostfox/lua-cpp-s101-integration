#include "host_func_def.h"

#include "lua_portrayal_api.h"
#include "Geometry/gm_compositecurve.h"
#include "Geometry/gm_curve.h"
#include "Geometry/gm_curvesegment.h"
#include "Geometry/gm_multipoint.h"
#include "Geometry/gm_point.h"
#include "Geometry/gm_surface.h"

#include "ObjectDictCatalogue/Controllers/featurecataloguecontroller.h"
#include "ObjectMapCatalogue/Controllers/featurescontroller.h"
#include "drawing_instructions_controller.h"

#include "profiler.h"

#include <QVector>
#include <QDebug>
#include <QString>
#include <algorithm>
#include <functional>
#include <string>


//template<typename R, typename ...Args>
//void LuaHostFunc::setHostFunc(const std::string &funcName, const std::function<R(Args...)> &f)
//{
//    m_lua.set_function(funcName
//                       , [&](Args... args) -> R {
//        PROFILING_TIME2(funcName)
//        return f(args...);
//    });
//}


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

    ContexParametrController contextParamControl;
    PortrayalInitializeContextParameters(m_lua, contParamController);


    m_lua["TypeSystemChecks"]("true");

//    func("HostSpecialSetCurrentFeatureId"
//                , [&](std::string featureId) -> void
//    {  //TODO: Временное решение
//        m_currentFeatureId_processFeaturePortrayal = stoi(featureId);
//        qInfo() << QString::fromStdString("currentFeatureId_processFeaturePortrayal: "
//                                          + std::to_string(m_currentFeatureId_processFeaturePortrayal));

//    });
    m_lua.set_function("HostSpecialSetCurrentFeatureId", [&](std::string featureId){  //TODO: Временное решение
        m_currentFeatureId_processFeaturePortrayal = stoi(featureId);
        qInfo() << QString::fromStdString("currentFeatureId_processFeaturePortrayal: "
                                          + std::to_string(m_currentFeatureId_processFeaturePortrayal));
    });
}

//LuaHostFunc::~LuaHostFunc()
//{
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

//}

bool LuaHostFunc::doPortrayal(const std::vector<std::string> &featuresId)
{
    auto featuresIDs = featuresId;
    bool isSuccess = PortrayalMain(m_lua, featuresIDs);
    return isSuccess;
}



void LuaHostFunc::loadFunctions()
{
    using std::string;
    using std::vector;

    //-----------------------------------------------------------------------------
    // 9a-14.2 Portrayal Domain Specific Host Functions
    /** The host must implement the function described in the following clause in order to support
     * portrayal. This function is called from the portrayal domain specific catalogue functions, and
     * augments the standard host functions described in Part 13.
     */
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
    m_lua.set_function("HostPortrayalEmit"
                     , [&](const string &featureID, const string &drawingInstructions, const string &observedParameters)
                       -> bool
    {
        PROFILING_TIME2("HostPortrayalEmit")
        qDebug() << "call HostPortrayalEmit";
        m_drawInstrCtrl.setDrawInstr(stoi(featureID),
                                      DrawingInstructions (drawingInstructions)
                                      );
        return m_isActionState;
    });

    //-----------------------------------------------------------------------------------------------
    // 13-8.2 Standard Host Functions
    /** The host must provide a set of "callback" functions that provide the scripting environment
    with: Access to the host’s realization of the S-100 General Feature Model; access to type
    information for any entity defined by the model; and access to spatial operations which can be
    used to perform relational tests and operations on spatial elements defined by the model. The
    host may optionally provide a callback function used to interact with a debugger.
    Offloading these tasks to the host, rather than providing rigid data structures which are
    passed between the host and scripting, allows the host to interact with scripting using the
    hosts optimal representation of the General Feature Model. Host translation of its internal
    data model to a particular input schema is not necessary when using scripting.
    Any of the standard host functions may be called from the scripting catalogue during the
    execution of a script.
    */

    ///----------------------------------------------------------------------------------------------

    /** 13-8.2.1 Data Access Functions
     *
     * The host must implement the functions described on the following pages to allow the scripting
     * environment to access data the host has loaded from a dataset. These functions provide the
     * scripting environment with access to features, spatials, attribute values, and information
     * associations.
     *
     * \link PortrayalModel.lua
     * \link PortrayalAPI.lua
     */

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
    m_lua.set_function("HostGetFeatureIDs"
                     , [&]()
                       -> sol::table
    {
        PROFILING_TIME2("HostGetFeatureIDs")
        qDebug() << "call HostGetFeatureIDs";
        auto luaFeaturesIds = helpLuaTable(m_lua, m_mapObjCtrl.getFeaturesIDs());
        return luaFeaturesIds;
    });

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
    m_lua.set_function("HostFeatureGetCode"
                     , [&](const string &featureID)
                       -> string
    {
        PROFILING_TIME2("HostFeatureGetCode")
        qDebug() << "call HostFeatureGetCode";
        const auto& featCtrl = m_dictObjCtrl.featureTypeCtrl();

        string featureCode = m_mapObjCtrl.getCodeById(featureID);
        if (!featCtrl.hasInMap(featureCode)){
            qDebug() << "Passed not feature code (" << QString::fromStdString(featureCode) << ") searching in code aliases";
            // Попробуем найти среди alias'ов
            for (const auto& feature : featCtrl.types()){
                const auto& featAliases = feature.header().alias();
                auto it = std::find(featAliases.begin(), featAliases.end(), featureCode);
                // Обновляем на реальный FeatureCode, если alias совпадает
                if (it != featAliases.end()){
                    featureCode = feature.header().code();
                    break;
                }
            }
        }
        return featureCode;
    });

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
    m_lua.set_function("HostInformationTypeGetCode"
                     , [&](const string &informationTypeID)
                       -> sol::object
    {
        PROFILING_TIME2("HostInformationTypeGetCode")
        qDebug() << "call HostInformationTypeGetCode";
        qWarning() << "Return undef string - to the informationTypeID : " << QString::fromStdString(informationTypeID);
        auto informationTypeCode = luaGetUnknownAttributeString(m_lua);
        return informationTypeCode;
    });

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
    m_lua.set_function("HostFeatureGetSimpleAttribute"
                     , [&](const string &featureID, const string &path, const string &attributeCode)
                       -> sol::table
    {
        PROFILING_TIME2("HostFeatureGetSimpleAttribute")
        qDebug() << "call HostFeatureGetSimpleAttribute";

        sol::table simpleAtrValues;
        bool isSetSimpleAttrOnMap = m_mapObjCtrl.hasSimpleAttribute(featureID, path, attributeCode);

        if (isSetSimpleAttrOnMap){
            auto atribute = m_mapObjCtrl.getSimpleAttribute(featureID, path, attributeCode);
            simpleAtrValues = helpLuaTable(m_lua, atribute.value());
        } else {
            simpleAtrValues = m_lua.create_table();
            simpleAtrValues.add(luaGetUnknownAttributeString(m_lua));
        }

        return simpleAtrValues;
    });

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
    m_lua.set_function("HostFeatureGetComplexAttributeCount"
                     , [&](const string &featureID, const string &path, const string &attributeCode)
                       -> int
    {
        PROFILING_TIME2("HostFeatureGetComplexAttributeCount")
        qDebug() << "call HostFeatureGetComplexAttributeCount";
        qWarning() << "Maybe Not Working"; // TODO: Проверить получение кол-ва сложных аттрибутов

        int featureCACount = static_cast<int>(
                    m_mapObjCtrl.getComplexAttributeSize(featureID, path, attributeCode)
                    );
        return featureCACount;
    });

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
    m_lua.set_function("HostFeatureGetSpatialAssociations" //TODO: Точно на хосте всегда только один SpAss?
                     , [&](const string &featureID)
                       -> sol::table
    {
        PROFILING_TIME2("HostFeatureGetSpatialAssociations")
        qDebug() << "call HostFeatureGetSpatialAssociations";

        auto luaFSpatialAssociations = m_lua.create_table();

        if (m_mapObjCtrl.hasSpatialAssotiation(featureID)) {
            Fe2spRef featureSpatioalAss = m_mapObjCtrl.getFeatureById(featureID).fe2spRef();
            auto luaFSAss = luaCreateSpatialAssociation(m_lua, featureSpatioalAss);
            luaFSpatialAssociations.add(luaFSAss);
        } else {
            qWarning() << "for feature ID=" << QString::fromStdString(featureID) << " return empty SpatialAssociation[] table";
        }

        return luaFSpatialAssociations;
    });

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
    m_lua.set_function("HostFeatureGetAssociatedFeatureIDs"
                     , [&](const string &featureID, const string &associationCode, const sol::object &roleCode)
                       -> sol::table
    {
        PROFILING_TIME2("HostFeatureGetAssociatedFeatureIDs")
        qDebug() << "call HostFeatureGetAssociatedFeatureIDs";
        qWarning() << "Return empty string[] - to the featureID : " << QString::fromStdString(featureID);
        auto featureAssFeatureIDs = helpEmptyTable(m_lua);
        return featureAssFeatureIDs;
    });

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
    m_lua.set_function("HostFeatureGetAssociatedInformationIDs"
                     , [&](const string &featureID, const string &associationCode, const sol::object &roleCode)
                       -> sol::table
    {
        PROFILING_TIME2("HostFeatureGetAssociatedInformationIDs")
        qDebug() << "call HostFeatureGetAssociatedInformationIDs";
        qWarning() << "Return empty string[] - to the featureID : " << QString::fromStdString(featureID);
        auto featureAssInfIDs = helpEmptyTable(m_lua);
        return featureAssInfIDs;
    });

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
    m_lua.set_function("HostGetSpatial"
                     , [&](const string &spatialID)
                       -> sol::object  //TODO: impl
    {
        PROFILING_TIME2("HostGetSpatial")
        qDebug() << "call HostGetSpatialID=" + QString::fromStdString(spatialID);

        if (!m_mapObjCtrl.hasSpatialObject(spatialID)){
            qCritical(("Ihe spatilalID=" + spatialID + " not on the map").c_str());
            return sol::nil;
        }
        auto spatialP = m_mapObjCtrl.spatialObjectByRefId(spatialID);

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
    });


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
    m_lua.set_function("HostSpatialGetAssociatedInformationIDs"
                     , [&](const string &spatialID, const string &associationCode, const sol::object &roleCode)
                       -> sol::object
    {
        PROFILING_TIME2("HostSpatialGetAssociatedInformationIDs")
        qDebug() << "call HostSpatialGetAssociatedInformationIDs";
        qWarning() << "Return Empty spatial[] identified by spatialID : " << QString::fromStdString(spatialID);
        sol::object spatialAssInfIDs = helpEmptyTable(m_lua);
        return spatialAssInfIDs;
    });

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
    m_lua.set_function("HostSpatialGetAssociatedFeatureIDs"
                     , [&](const string &spatialID)
                       -> sol::object
    {
        PROFILING_TIME2("HostSpatialGetAssociatedFeatureIDs")
        qDebug() << "call HostSpatialGetAssociatedFeatureIDs";
        qWarning() << "Return empty spatial[] identified by spatialID : " << QString::fromStdString(spatialID);
        sol::object spatialAssFeaturesIDs = helpEmptyTable(m_lua);
        return spatialAssFeaturesIDs;
    });

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
    m_lua.set_function("HostInformationTypeGetSimpleAttribute"
                     , [&](const string &informationTypeID, const string &path, const string &attributeCode)
                       -> sol::object
    {
        PROFILING_TIME2("HostInformationTypeGetSimpleAttribute")
        qDebug() << "call HostInformationTypeGetSimpleAttribute";
        sol::object informSimpleAttrValue;
        return informSimpleAttrValue;
    });

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
    m_lua.set_function("HostInformationTypeGetComplexAttributeCount"
                     , [&](const string &informationTypeID, const string &path, const string &attributeCode)
                       -> int
    {
        PROFILING_TIME2("HostInformationTypeGetComplexAttributeCount")
        qDebug() << "call HostInformationTypeGetComplexAttributeCount";
        qWarning() << "Return 0 - to the informationTypeID : " << QString::fromStdString(informationTypeID);
        int informCompleAttrCount = 0;
        return informCompleAttrCount;
    });

    //-----------------------------------------------------------------------------------------------

    /** 13-8.2.2 Type Information Access Functions
     *
     * These functions allow the scripting environment to query the type information for any entity
     * from any dataset. The type information provided by the host must match the information from
     * the relevant feature catalogue.
     * \link S100Scripting.lua
    */
    /*!
     * \brief HostGetFeatureTypeCodes
     * \return string[]
     *         > Array containing all feature type codes as defined in the Feature Catalogue.
     */
    m_lua.set_function("HostGetFeatureTypeCodes"
                     , [&]()
                       -> sol::table
    {
        PROFILING_TIME2("HostGetFeatureTypeCodes")
        qDebug() << "call HostGetFeatureTypeCodes";
        const auto& featureTypeCodes = m_dictObjCtrl.featureTypeCtrl().codes();
        auto luafeatureTypeCodes = helpLuaTable(m_lua, featureTypeCodes);
        return luafeatureTypeCodes;
    });
    /*!
     * \brief HostGetInformationTypeCodes()
     * \return string[]
     *         > Array containing all information type codes as defined in the Feature Catalogue.
     */
    m_lua.set_function("HostGetInformationTypeCodes"
                     , [&]()
                       -> sol::table
    {
        PROFILING_TIME2("HostGetInformationTypeCodes")
        qDebug() << "call HostGetInformationTypeCodes";
        const auto& informTypeCodes = m_dictObjCtrl.informationTypeCrtl().codes();
        auto luaInformTypeCodes = helpLuaTable(m_lua, informTypeCodes);
        return luaInformTypeCodes;
    });
    /*!
     * \brief HostGetSimpleAttributeTypeCodes
     * \return string[]
     *         > Array containing all simple attribute type codes as defined in the Feature Catalogue.
     */
    m_lua.set_function("HostGetSimpleAttributeTypeCodes"
                     , [&]()
                       -> sol::table
    {
        PROFILING_TIME2("HostGetSimpleAttributeTypeCodes")
        qDebug() << "call HostGetSimpleAttributeTypeCodes";
        const auto& simpleAtrTypeCodes = m_dictObjCtrl.simpleAttributeCtrl().codes();
        auto luaSimpleAtrTypeCodes = helpLuaTable(m_lua, simpleAtrTypeCodes);
        return luaSimpleAtrTypeCodes;
    });
    /*!
     * \brief HostGetComplexAttributeTypeCodes
     * \return string[]
     *         > Array containing all complex attribute type codes as defined in the Feature
     *           Catalogue.
     */
    m_lua.set_function("HostGetComplexAttributeTypeCodes"
                     , [&]()
                       -> sol::table
    {
        PROFILING_TIME2("HostGetComplexAttributeTypeCodes")
        qDebug() << "call HostGetComplexAttributeTypeCodes";
        const auto& complexAttrTypeCodes = m_dictObjCtrl.complexAttributeCtrl().codes();
        auto luaComplexAttrTypeCodes = helpLuaTable(m_lua, complexAttrTypeCodes);
        return luaComplexAttrTypeCodes;
    });
    /*!
     * \brief HostGetRoleTypeCodes
     * \return string[]
     *         > Array containing all role type codes as defined in the Feature Catalogue.
     */
    m_lua.set_function("HostGetRoleTypeCodes"
                     , [&]()
                       -> sol::table
    {
        PROFILING_TIME2("HostGetRoleTypeCodes")
        qDebug() << "call HostGetRoleTypeCodes";
        const auto& roleTypeCodes = m_dictObjCtrl.rolesCtrl().codes();
        auto luaRoleTypeCodes = helpLuaTable(m_lua, roleTypeCodes);
        return luaRoleTypeCodes;
    });
    /*!
     * \brief HostGetInformationAssociationTypeCodes
     * \return string[]
     *         > Array containing all information association type codes as defined in the Feature
     *           Catalogue.
     */
    m_lua.set_function("HostGetInformationAssociationTypeCodes"
                     , [&]()
                       -> sol::table
    {
        PROFILING_TIME2("HostGetInformationAssociationTypeCodes")
        qDebug() << "call HostGetInformationAssociationTypeCodes";
        const auto& infAssTypeCodes = m_dictObjCtrl.informationAssociationCtrl().codes();
        auto luaInfAssTypeCodes = helpLuaTable(m_lua, infAssTypeCodes);
        return luaInfAssTypeCodes;
    });
    /*!
     * \brief HostGetFeatureAssociationTypeCodes
     * \return string[]
     *         > Array containing all feature association type codes as defined in the Feature
     *           Catalogue.
     */
    m_lua.set_function("HostGetFeatureAssociationTypeCodes"
                     , [&]()
                       -> sol::table
    {
        PROFILING_TIME2("HostGetFeatureAssociationTypeCodes")
        qDebug() << "call HostGetFeatureAssociationTypeCodes";
        const auto& featureAssTypeCodes = m_dictObjCtrl.featureAssociationCtrl().codes();
        auto luaFeatureAssTypeCodes = helpLuaTable(m_lua, featureAssTypeCodes);
        return luaFeatureAssTypeCodes;
    });
    /*!
     * \brief HostGetFeatureTypeInfo
     * \param featureCode: string
     *          > Feature code matching an entry in the Feature Catalogue.
     * \return FeatureType
     *          > Lua data structure created by the CreateFeatureType() function.
     */
    m_lua.set_function("HostGetFeatureTypeInfo"
                     , [&](string featureCode)
                       -> sol::table
    {
        PROFILING_TIME2("HostGetFeatureTypeInfo")
        qDebug() << "call HostGetFeatureTypeInfo";
        FC_FeatureType featureType = m_dictObjCtrl.featureTypeCtrl().type(featureCode);


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
    });
    /*!
     * \brief HostGetInformationTypeInfo
     * \param informationCode: string
     *          > Information code matching an entry in the Feature Catalogue.
     * \return InformationType
     *          > Lua data structure created by the CreateInformationType() function.
     */
    m_lua.set_function("HostGetInformationTypeInfo"
                     , [&](const string &informationCode)
                       -> sol::object
    {
        //PROFILING_TIME
        PROFILING_TIME2("HostGetInformationTypeInfo")
        qDebug() << "call HostGetInformationTypeInfo";
        const auto &infType = m_dictObjCtrl.informationTypeCrtl().type(informationCode);

        auto luaAttributeBindings = helpCreateAttributeBindings(m_lua, infType.attributeBindings());

        auto luaItem = luaCreateItem(m_lua, &infType.header());
        auto luaNamedType = luaCreateNamedType(m_lua, luaItem, luaAttributeBindings);
        auto luaObjectType = luaCreateObjectType(m_lua, luaNamedType);

        auto luaInfType = luaCreateInformationType(m_lua, luaObjectType, sol::nil, sol::nil); //TODO: проверить аргументы, точно nil??
        return luaInfType;

    });
    /*!
     * \brief HostGetSimpleAttributeTypeInfo
     * \param attributeCode: string
     *          > Simple attribute code matching an entry in the Feature Catalogue.
     * \return SimpleAttribute
     *          > Lua data structure created by the CreateSimpleAttribute() function.
     */
    m_lua.set_function("HostGetSimpleAttributeTypeInfo"
                     , [&](const string &attributeCode)
                       -> sol::object
    {
        PROFILING_TIME2("HostGetSimpleAttributeTypeInfo")
        qDebug() << "call HostGetSimpleAttributeTypeInfo";
        const auto &simplAttrType = m_dictObjCtrl.simpleAttributeCtrl().type(attributeCode);
        auto simpleAttrs = luaCreateSimpleAttribute(m_lua, &simplAttrType);
        return simpleAttrs;
    });
    /*!
     * \brief HostGetComplexAttributeTypeInfo
     * \param attributeCode: string
     *          > Complex attribute code matching an entry in the Feature Catalogue.
     * \return ComplexAttribute
     *          > Lua data structure created by the CreateComplexAttribute() function.
     */
    m_lua.set_function("HostGetComplexAttributeTypeInfo"
                     , [&](const string &attributeCode)
                       -> sol::object   //WARNING: TODO: Not Emplementer
    {
        PROFILING_TIME2("HostGetComplexAttributeTypeInfo")
        qDebug() << "call HostGetComplexAttributeTypeInfo";
        const auto &complAttrType = m_dictObjCtrl.complexAttributeCtrl().type(attributeCode);
        auto complexAttrs = luaCreateComplexAttribute(m_lua, &complAttrType);
        qWarning() << "HostGetComplexAttributeTypeInfo not working well. attributeCode(" << QString::fromStdString(attributeCode) << ")";
        return complexAttrs;
    });

    ///----------------------------------------------------------------------------------------------
    /** 13-8.2.4 Debugger Support Functions
     *
     * These functions allow the scripting environment to interact with a debugger which may be
     * running on the host. A debugger may be desired as an aide in developing the required
     * standard host functions.
     *
     * \link S100Scripting.lua
     */

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
#ifdef NO_DEBUG_OUT
    m_lua.set_function("HostDebuggerEntry"
                     , [&](const string &debugAction, const sol::object &msg)
    {
        //qDebug() << "call HostDebuggerEntry";
        string message;
        if (msg.is<int>() ||msg.is<double>() ){
            message = std::to_string(msg.as<int>());
        } else if (msg.is<bool>()){
            message = msg.as<bool>() ? "True" : "False";
        } else if (msg == sol::nil){
            message = "nil";
        } else if (msg.is<string>()){
            message = msg.as<string>();
        }

        //static int level = 0;
        int level = 0;
        string str;

        if ("break" == debugAction){
            m_isActionState = false;
            throw "Break from LUA";
        } else if ("trace" == debugAction) {
            qCritical() << QString::fromStdString("currentFeatureId_processFeaturePortrayal: "
                                                  + std::to_string(m_currentFeatureId_processFeaturePortrayal)
                                                  + " "
                                                  + str
                                                  + " "
                                                  + debugAction
                                                  + " # "
                                                  + message);
            return;
        } else if ("start_performance" == debugAction) {
            str.assign(++level * 5, ' ');
            //return;
        } else if ("stop_performance" == debugAction) {
            str.assign(level-- * 5, ' ');
            //return;
        } else if ("reset_performance" == debugAction) {

        } else {
            qWarning() << "Undefined debugger action\n";
        }

        qDebug() << QString::fromStdString(str + " " + debugAction + " # " + message);
        //std::cerr << str << " " << debugAction << " # " << message << std::endl;
    });
#endif
}



