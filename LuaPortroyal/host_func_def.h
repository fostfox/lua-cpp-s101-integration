#pragma once

#include <string>

namespace std {
//class string;
}

namespace sol {
class state;
template <typename base_type>class basic_object;
template <bool b> class basic_reference;
using reference = basic_reference<false>;
using object = basic_object<reference>;

template <bool, typename> class basic_table_core;
template <bool b> using table_core = basic_table_core<b, reference>;
using table = table_core<false>;
}

class FeatureMapController;
class FeatureCatalogueController;
class ContexParametrController;
class DrawingInstructionsController;


class LuaHostFunc {
private:
    sol::state& m_lua;

    const FeatureMapController& m_mapObjCtrl;
    const FeatureCatalogueController& m_dictObjCtrl;
    const ContexParametrController & m_contParamCtrl;
    DrawingInstructionsController& m_drawInstrCtrl;

    bool m_isActionState;
    int m_currentFeatureId_processFeaturePortrayal = -1;

public:
    LuaHostFunc(sol::state &lua
            , const FeatureCatalogueController &dictObjCtrl
            , const FeatureMapController &mapObjCtrl
            , const ContexParametrController &contParamController
            , DrawingInstructionsController &drawInstrCtrl
            );
    bool doPortrayal();

    void loadFunctions();

public:
    //-----------------------------------------------------------------------------
    // 9a-14.2 Portrayal Domain Specific Host Functions
    /** The host must implement the function described in the following clause in order to support
     * portrayal. This function is called from the portrayal domain specific catalogue functions, and
     * augments the standard host functions described in Part 13.
     */
    bool HostPortrayalEmit(const std::string &featureID, const std::string &drawingInstructions, const std::string &observedParameters);
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
    const sol::table HostGetFeatureIDs();
    const std::string HostFeatureGetCode(const std::string &featureID);
    const std::string HostInformationTypeGetCode(const std::string &informationTypeID);
    const sol::table HostFeatureGetSimpleAttribute(const std::string &featureID, const std::string &path, const std::string &attributeCode);
    int HostFeatureGetComplexAttributeCount(const std::string &featureID, const std::string &path, const std::string &attributeCode);
    const sol::table HostFeatureGetSpatialAssociations(const std::string &featureID);
    const sol::table HostFeatureGetAssociatedFeatureIDs(const std::string &featureID, const std::string &associationCode, const sol::object &roleCode);
    const sol::table HostFeatureGetAssociatedInformationIDs(const std::string &featureID, const std::string &associationCode, const sol::object &roleCode);
    const sol::table HostGetSpatial(const std::string &spatialID);
    const sol::object HostSpatialGetAssociatedInformationIDs(const std::string &spatialID, const std::string &associationCode, const sol::object &roleCode);
    const sol::object HostSpatialGetAssociatedFeatureIDs(const std::string &spatialID);
    const sol::object HostInformationTypeGetSimpleAttribute(const std::string &informationTypeID, const std::string &path, const std::string &attributeCode);
    int HostInformationTypeGetComplexAttributeCount(const std::string &informationTypeID, const std::string &path, const std::string &attributeCode);
    //-----------------------------------------------------------------------------------------------

    /** 13-8.2.2 Type Information Access Functions
     *
     * These functions allow the scripting environment to query the type information for any entity
     * from any dataset. The type information provided by the host must match the information from
     * the relevant feature catalogue.
     * \link S100Scripting.lua
    */
    const sol::table HostGetFeatureTypeCodes();
    const sol::table HostGetInformationTypeCodes();
    const sol::table HostGetSimpleAttributeTypeCodes();
    const sol::table HostGetComplexAttributeTypeCodes();
    const sol::table HostGetRoleTypeCodes();
    const sol::table HostGetInformationAssociationTypeCodes();
    const sol::table HostGetFeatureAssociationTypeCodes();
    const sol::table HostGetFeatureTypeInfo(std::string featureCode);
    const sol::object HostGetInformationTypeInfo(const std::string &informationCode);
    const sol::object HostGetSimpleAttributeTypeInfo(const std::string &attributeCode);
    const sol::object HostGetComplexAttributeTypeInfo(const std::string &attributeCode);
    ///----------------------------------------------------------------------------------------------
    /** 13-8.2.4 Debugger Support Functions
     *
     * These functions allow the scripting environment to interact with a debugger which may be
     * running on the host. A debugger may be desired as an aide in developing the required
     * standard host functions.
     *
     * \link S100Scripting.lua
     */
    void HostDebuggerEntry(const std::string &debugAction, const sol::object &msg);
};
