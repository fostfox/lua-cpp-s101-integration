#pragma once

#include <memory>
#include <string>
#include <vector>

#include "../ObjectDictCatalogue/Controllers/featurecataloguecontroller.h"
#include "../ObjectMapCatalogue/Controllers/featurescontroller.h"
#include "drawing_instructions_controller.h"


namespace sol {
class state;
}


class LuaHostFunc {
private:
    std::shared_ptr<FeatureMapController> m_mapObjCtrl;
    std::shared_ptr<FeatureCatalogueController> m_dictObjCtrl;
    std::shared_ptr<DrawingInstructionsController> m_drawInstrCtrl;

    bool m_isActionState;
    sol::state* m_lua;

public:
    LuaHostFunc(FeatureMapController *mapObjCtrl
                ,FeatureCatalogueController *dictObjCtrl
                ,DrawingInstructionsController *drawInstrCtrl
                );

    void doPortrayal();

    void loadFunctions();
    
    ///----------------------------------------------------------------------------------------------
    
    //???
    //LUA_RET GetSimpleAttribute(lua_State* );
    //LUA_RET GetComplexAttributeCount(lua_State* );
    //LUA_RET FeatureTypeGetCode(lua_State* );
    
    
    
    
    //LUA_RET DatasetGetFeatureIDs(lua_State* L);
    //LUA_RET FeatureGetType(lua_State* L);
    
    
};
