#include "LuaRuleMashine.h"
#include <string>
#include <iostream>

#include "lua_portrayal_api.h"


LuaRuleMashine::LuaRuleMashine(
        const QString &fileNameEntryPoint
        , const FeatureCatalogueController &dictObjController
        , const FeatureMapController &mapObjController
        )
    :m_dictObjCtrl(dictObjController)
    ,m_mapObjCtrl(mapObjController)
{


}

//LuaRuleMashine::~LuaRuleMashine() {
//	lua_close(L_);
//}

//void LuaRuleMashine::getPortrayal(std::string datasetID)
//{
//	if(lua_getglobal(L_, "PortrayalInitializeContextParameters") != LUA_TFUNCTION) {								//stack: PortrayalInitializeContextParameters()
//		std::cout << "Error: 'PortrayalInitializeContextParameter()' function is not found!" << std::endl;
//	}
//	lua_pushstring(L_, datasetID.c_str());																			//stack: datasetID, PortrayalInitializeContextParameters()
//	lua_pushnil(L_);																								//stack: nil, datasetID, PortrayalInitializeContextParameters()
//	if(lua_pcall(L_, 2, 0, 0) != LUA_OK) {																			//stack:
//		std::string message = luaStackGetString(L_);
//		std::cout << "Error: lua_pcall is not caled in 'PortrayalInitializeContextParameters() function" << message << std::endl;
//	}

//	if(lua_getglobal(L_, "PortrayalMain") != LUA_TFUNCTION) {														//stack: PortrayalMain()
//		std::cout << "Error: 'PortrayalMain()' function is not found!" << std::endl;
//	}
//	lua_pushstring(L_, datasetID.c_str());																			//stack: datasetID, PortrayalMain()
//	lua_pushstring(L_, datasetID.c_str());																			//stack: datasetID, datasetID, PortrayalMain()
//	l_DatasetGetFeatureIDs(L_);																						//stack: featureIDs[], datasetID, PortrayalMain()
//	if(lua_pcall(L_, 2, 1, 0) != LUA_OK) {																			//stack:
//		std::string message = luaStackGetString(L_);
//		std::cout << "Error: lua_pcall is not caled in 'PortrayalMain() function" << message << std::endl;
//	}
//}

//std::vector<Object> LuaRuleMashine::getCurrentObjects() const
//{
//	return objectController_.getObjects();
//}


//bool LuaRuleMashine::isContinueScriptProcess()
//{
//	bool continueProcess = true; // Continue script processing. The portrayal engine will continue to process feature instances.
//								 // = false; // Terminate script processing. No additional feature instances will be processed by the portrayal engine.
//	return continueProcess;
//}
