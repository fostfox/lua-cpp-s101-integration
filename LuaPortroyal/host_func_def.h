#pragma once

#include <memory>
#include <string>
#include <vector>

namespace sol {
class state;
}

class FeatureMapController;
class FeatureCatalogueController;
class DrawingInstructionsController;


class LuaHostFunc {
private:
    sol::state& m_lua;

    const FeatureMapController& m_mapObjCtrl;
    const FeatureCatalogueController& m_dictObjCtrl;
    DrawingInstructionsController& m_drawInstrCtrl;

    bool m_isActionState;

public:
    LuaHostFunc(sol::state &lua
            , const FeatureCatalogueController &dictObjCtrl
            , const FeatureMapController &mapObjCtrl
            , DrawingInstructionsController &drawInstrCtrl
            );

    bool doPortrayal();

    void loadFunctions();
    
    ///----------------------------------------------------------------------------------------------
    
    //???
    //LUA_RET GetSimpleAttribute(lua_State* );
    //LUA_RET GetComplexAttributeCount(lua_State* );
    //LUA_RET FeatureTypeGetCode(lua_State* );
    
    
    
    
    //LUA_RET DatasetGetFeatureIDs(lua_State* L);
    //LUA_RET FeatureGetType(lua_State* L);
    
    
};
