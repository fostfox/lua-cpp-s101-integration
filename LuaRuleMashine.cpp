#include "LuaRuleMashine.h"
#include <string>
#include <iostream>

ObjectController LuaRuleMashine::objectController_ = ObjectController();

LuaRuleMashine::LuaRuleMashine(std::string fileName)
{
	auto hostFunctions = initializeHostFunctions();

	L_ = luaL_newstate();
	luaL_openlibs(L_);

	for (const auto & f : hostFunctions) {
		lua_pushcfunction(L_, f.second);
		lua_setglobal(L_, f.first.c_str());
	}

	if(luaL_dofile(L_, fileName.c_str())) {
		std::cout << "Error: in 'dofile': " << lua_tostring(L_, L_STACK_TOP_);
	}
}

LuaRuleMashine::~LuaRuleMashine() {
	lua_close(L_);
}

void LuaRuleMashine::getPortrayal(std::string datasetID)
{
	if(lua_getglobal(L_, "PortrayalInitializeContextParameters") != LUA_TFUNCTION) {								//stack: PortrayalInitializeContextParameters()
		std::cout << "Error: 'PortrayalInitializeContextParameter()' function is not found!" << std::endl;
	}
	lua_pushstring(L_, datasetID.c_str());																			//stack: datasetID, PortrayalInitializeContextParameters()
	lua_pushnil(L_);																								//stack: nil, datasetID, PortrayalInitializeContextParameters()
	if(lua_pcall(L_, 2, 0, 0) != LUA_OK) {																			//stack: 
		std::string message = luaStackGetString(L_);
		std::cout << "Error: lua_pcall is not caled in 'PortrayalInitializeContextParameters() function" << message << std::endl;
	}

	if(lua_getglobal(L_, "PortrayalMain") != LUA_TFUNCTION) {														//stack: PortrayalMain()
		std::cout << "Error: 'PortrayalMain()' function is not found!" << std::endl;
	}
	lua_pushstring(L_, datasetID.c_str());																			//stack: datasetID, PortrayalMain()
	lua_pushstring(L_, datasetID.c_str());																			//stack: datasetID, datasetID, PortrayalMain()
	l_DatasetGetFeatureIDs(L_);																						//stack: featureIDs[], datasetID, PortrayalMain()
	if(lua_pcall(L_, 2, 1, 0) != LUA_OK) {																			//stack: 
		std::string message = luaStackGetString(L_);
		std::cout << "Error: lua_pcall is not caled in 'PortrayalMain() function" << message << std::endl;
	}
}

std::vector<Object> LuaRuleMashine::getCurrentObjects() const
{
	return objectController_.getObjects();
}

int LuaRuleMashine::l_DebuggerEntry(lua_State* L) {
	static std::map<std::string, std::function<void(lua_State *)> > debugActions =
	{
		{ "break", [&](lua_State* L) {
			std::cout << "Break: Pause execution of the script." << std::endl;
			//lua_close(L_);
		}},
		{ "trace", [&](lua_State* L) {
			std::string message = luaStackGetString(L);
			std::cout << "Trace: " << message << std::endl;
		}},
		{ "start_profiler", [&](lua_State* L) {
			std::string message = luaStackGetString(L);
			std::cout << "Start Profiler: " << message << std::endl;
		}},
		{ "stop_profiler", [&](lua_State* L) {
			std::string message = luaStackGetString(L);
			std::cout << "Stop profiler: " << message << std::endl;
		}},
		{ "start_performance", [&](lua_State* L) {
			std::string name = luaStackGetString(L);
			std::cout << "Start performance: " << name << std::endl;
		}},
		{ "stop_performance", [&](lua_State* L) {
			std::string name = luaStackGetString(L);
			std::cout << "Stop performance: " << name << std::endl;
		}},
		{ "reset_performance", [&](lua_State* L) {
			std::string name = luaStackGetString(L);
			std::cout << "Reset performance: " << name << std::endl;
		}},
	};
	std::string debugAction = luaStackGetString(L, L_STACK_TOP_-1);
	if(!debugActions.count(debugAction)) {
		std::cout << "Error: Host debug function not found " << debugAction << std::endl;
	} else {
		debugActions[debugAction](L); // emit debug action
	}
	return 0;
}

int LuaRuleMashine::l_DatasetGetFeatureIDs(lua_State * L)
{
	std::string datasetID = luaStackGetString(L);
	objectController_.setObjects(datasetID);
	std::vector<Object> objects = objectController_.getObjects();
	lua_createtable(L, 0, objects.size());								//stack: table[]

	for (int i = 0; i < objects.size(); i++) {
		//lua_pushstring(L, objects[i].getID().c_str());					//stack: featureID, table[]
		//lua_setfield(L, L_STACK_TOP_-1, std::to_string(i + 1).c_str());	//stack: table[]
		lua_pushinteger(L, i+1);
		lua_pushstring(L, objects[i].getID().c_str());
		lua_settable(L, L_STACK_TOP_ - 2);
	}

	return 1;
}

int LuaRuleMashine::l_FeatureGetType(lua_State * L)
{
	std::string featureID = luaStackGetString(L);
	std::string featureCode = objectController_.getObject(featureID).getCode();

	lua_pushstring(L, featureCode.c_str());

	return 1;
}

int LuaRuleMashine::l_FeatureGetSpatialAssociations(lua_State* L)
{
	std::string featureID = luaStackGetString(L);
  std::vector<std::string> spatialIDs;
  auto spatialID = objectController_.getObject(featureID).getSpatialID();
  if (!spatialID.empty()) {
    spatialIDs.push_back(spatialID);
  }

	lua_createtable(L, spatialIDs.size(), 0);																		 //stack: table[] <- spatialAssociations[]

	for(int i = 0; i < spatialIDs.size(); i++) {
		lua_pushinteger(L, i + 1);																						                    //stack: key, table[]
		if(lua_getglobal(L, "CreateSpatialAssociation") != LUA_TFUNCTION) {												//stack: CreateSpatialAssociation(), key, table[]
			std::cout << 
        "Error: 'CreateSpatialAssociation()' function is not found!" << 
        std::endl;
		}
		lua_pushstring(L, Object::toSpatialType(spatialIDs[i]).c_str());												//stack: spatialType, CreateSpatialAssociation(), key, table[]
		lua_pushstring(L, spatialIDs[i].c_str());																		//stack: spatialID, spatialType, CreateSpatialAssociation(), key, table[]
		if(lua_pcall(L, 2, 1, 0) != LUA_OK) {																			//stack: spatialAssociation, key, table[]
			std::cout << 
        "Error: lua_pcall is not caled in "
		    "'CreateSpatialAssociation()' function" << 
        std::endl;
		}
		lua_settable(L, L_STACK_TOP_-2);																				//stack: table[]
	}
	return 1;
}

int LuaRuleMashine::l_GetSpatial(lua_State * L)
{
	std::string spatialID = luaStackGetString(L);
	auto spatialType = Object::toSpatialType(spatialID);

	static std::map<std::string, std::function<void()> > func = initializeCreateSpatialFunctions(L);
	func[spatialType]();		 //stack: spatialType

	return 1;
}

int LuaRuleMashine::l_PortrayalEmit(lua_State* L)
{
	std::string drawInstractionsXML = luaStackGetString(L);
	std::string featureID = luaStackGetString(L);

	objectController_.setDrawInstructions(featureID, drawInstractionsXML);

	bool continueProcess = isContinueScriptProcess();
	lua_pushboolean(L, continueProcess);

	return 1;
}

int LuaRuleMashine::l_GetSimpleAttribute(lua_State* L)
{                                                           //stack: fitureID, attributePath, attributeCode
  auto fitureID = luaStackGetString(L);                     //stack: attributePath, attributeCode
  lua_pop(L, 1);                                            //stack: attributeCode
  auto attributeCode = luaStackGetString(L);                //stack:
  auto attributeValue = objectController_
                          .getObject(fitureID)
                          .getSimpleAttributeValue(attributeCode);
  lua_pushnumber(L, attributeValue);                        //stack: attributeValue
  return 1;
}

bool LuaRuleMashine::isContinueScriptProcess()
{
	bool continueProcess = true; // Continue script processing. The portrayal engine will continue to process feature instances.
								 // = false; // Terminate script processing. No additional feature instances will be processed by the portrayal engine.  
	return continueProcess;
}

/*void LuaRuleMashine::initializeDebugActions()
{
	debugActions_["break"] = [&](lua_State* L) {
		std::cout << "Break: Pause execution of the script." << std::endl;
		//lua_close(L_);
	};
	debugActions_["trace"] = [&](lua_State* L) {
		std::string message = luaStackGetString(L);
		std::cout << "Trace: " << message << std::endl;
	};
	debugActions_["start_profiler"] = [&](lua_State* L) {
		std::string message = luaStackGetString(L);
		std::cout << "Start Profiler: " << message << std::endl;
	};
	debugActions_["stop_profiler"] = [&](lua_State* L) {
		std::string message = luaStackGetString(L);
		std::cout << "Stop profiler: " << message << std::endl;
	};
	debugActions_["start_performance"] = [&](lua_State* L) {
		std::string name = luaStackGetString(L);
		std::cout << "Start performance: " << name << std::endl;
	};
	debugActions_["stop_performance"] = [&](lua_State* L) {
		std::string name = luaStackGetString(L);
		std::cout << "Stop performance: " << name << std::endl;
	};
	debugActions_["reset_performance"] = [&](lua_State* L) {
		std::string name = luaStackGetString(L);
		std::cout << "Reset performance: " << name << std::endl;
	};
}*/

std::vector<std::pair<std::string, lua_CFunction> > LuaRuleMashine::initializeHostFunctions()
{
  std::vector<std::pair<std::string, lua_CFunction> > hostFunctions = {
    std::make_pair("Host_DebuggerEntry", l_DebuggerEntry),
    std::make_pair("HostDatasetGetFeatureIDs", l_DatasetGetFeatureIDs),
    std::make_pair("HostFeatureGetType", l_FeatureGetType),
    std::make_pair("Host_Feature_GetSpatialAssociations", l_FeatureGetSpatialAssociations),
    std::make_pair("Host_GetSpatial", l_GetSpatial),
    std::make_pair("HostPortrayalEmit", l_PortrayalEmit),
    std::make_pair("HostGetSimpleAttribute", l_GetSimpleAttribute),
	};
	return hostFunctions;
}

std::map<std::string, std::function<void()> > LuaRuleMashine::initializeCreateSpatialFunctions(lua_State * L)
{
	std::map<std::string, std::function<void()> > func;
	func["CreatePoint"] = [L]() {
		if(lua_getglobal(L, "CreatePoint") != LUA_TFUNCTION) {												//stack: CreatePoint()
			std::cout << "Error: 'CreatePoint()' function is not found!" << std::endl;
		}
		lua_pushnil(L);  // TODO: 																			//stack: nil, CreatePoint() 
		lua_pushnil(L);  // TODO: 																			//stack: nil, nil, CreatePoint()
		lua_pushnil(L);  // TODO: 																			//stack: nil, nil, nil, CreatePoint()
		if(lua_pcall(L, 3, 1, 0) != LUA_OK) {																//stack: point
			std::cout << "Error: lua_pcall is not caled in 'func[\"CreatePoint\"]()' " << std::endl;
		}
	};
	func["CreateMultiPoint"] = [L]() {
		if(lua_getglobal(L, "CreateMultiPoint") != LUA_TFUNCTION) {											//stack: CreateMultiPoint()
			std::cout << "Error: 'CreateMultiPoint()' function is not found!" << std::endl;
		}
		lua_pushnil(L);  // TODO: 																			//stack: nil, CreateMultiPoint() 
		lua_pushnil(L);  // TODO: 																			//stack: nil, nil, CreateMultiPoint()
		lua_pushnil(L);  // TODO: 																			//stack: nil, nil, nil, CreateMultiPoint()
		lua_pushnil(L);  // TODO: 																			//stack: nil, nil, nil, nil, CreateMultiPoint()
		if(lua_pcall(L, 4, 1, 0) != LUA_OK) {																//stack: point
			std::cout << "Error: lua_pcall is not caled in 'func[\"CreateMultiPoint\"]()' " << std::endl;
		}
	};
	func["CreateCurve"] = [L]() {
		if(lua_getglobal(L, "CreateCurve") != LUA_TFUNCTION) {												//stack: CreateCurve()
			std::cout << "Error: 'CreateCurve()' function is not found!" << std::endl;
		}
		lua_pushnil(L);  // TODO: 																			//stack: nil, CreateCurve() 
		lua_pushnil(L);  // TODO: 																			//stack: nil, nil, CreateCurve()
		lua_pushnil(L);  // TODO: 																			//stack: nil, nil, nil, CreateCurve()
		if(lua_pcall(L, 3, 1, 0) != LUA_OK) {																//stack: point
			std::cout << "Error: lua_pcall is not caled in 'func[\"CreateCurve\"]()' " << std::endl;
		}
	};
	func["CreateCompositeCurve"] = [L]() {
		if(lua_getglobal(L, "CreateCompositeCurve") != LUA_TFUNCTION) {										//stack: CreateCompositeCurve()
			std::cout << "Error: 'CreateCompositeCurve()' function is not found!" << std::endl;
		}
		lua_pushnil(L);  // TODO: 																			//stack: nil, CreateCompositeCurve() 
		if(lua_pcall(L, 1, 1, 0) != LUA_OK) {																//stack: point
			std::cout << "Error: lua_pcall is not caled in 'func[\"CreateCompositeCurve\"]()' " << std::endl;
		}
	};
	func["CreateSurface"] = [L]() {
		if(lua_getglobal(L, "CreateSurface") != LUA_TFUNCTION) {											//stack: CreateSurface()
			std::cout << "Error: 'CreateSurface()' function is not found!" << std::endl;
		}
		lua_pushnil(L);  // TODO: 																			//stack: nil, CreateSurface() 
		lua_pushnil(L);  // TODO: 																			//stack: nil, nil, CreateSurface()
		if(lua_pcall(L, 3, 1, 0) != LUA_OK) {																//stack: point
			std::cout << "Error: lua_pcall is not caled in 'func[\"CreateSurface\"]()' " << std::endl;
		}
	};

	return func;
}

std::string LuaRuleMashine::luaStackGetString(lua_State * L, int pos)
{
	//if(lua_type(L, pos) != LUA_TSTRING) {
	//	std::cout << "Error: can't take string from Lua stack" << std::endl;
	//	return std::string();
	//}
	std::string message = lua_tostring(L, pos);
	lua_remove(L, pos);
	return std::move(message);
}