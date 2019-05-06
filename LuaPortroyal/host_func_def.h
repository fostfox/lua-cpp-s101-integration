#pragma once

//namespace std {
//template<typename _Signature> class function;
//class string;
//}

namespace sol {
class state;
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
    ~LuaHostFunc();
    bool doPortrayal();

    void loadFunctions();

//    template<typename R, typename ...Args>
//    void setHostFunc(const std::string& funcName, const std::function<R(Args...)>& f);


    ///----------------------------------------------------------------------------------------------
    
    //???
    //LUA_RET GetSimpleAttribute(lua_State* );
    //LUA_RET GetComplexAttributeCount(lua_State* );
    //LUA_RET FeatureTypeGetCode(lua_State* );
    
    
    
    
    //LUA_RET DatasetGetFeatureIDs(lua_State* L);
    //LUA_RET FeatureGetType(lua_State* L);
    
    
};
