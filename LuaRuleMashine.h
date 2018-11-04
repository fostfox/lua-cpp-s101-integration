#pragma once


#include "lualib/lua.hpp"
#include "ObjectController.h"
#include <string>
#include <vector>
#include <functional>
#include <map>


class LuaRuleMashine {
public:
	LuaRuleMashine(std::string fileName);
	~LuaRuleMashine();

	void getPortrayal(std::string);
	std::vector<Object> getCurrentObjects() const;

	static void initializeObjectController();

private:
	static bool isContinueScriptProcess();
	static std::string luaStackGetString(lua_State *L, int pos = L_STACK_TOP_);
	//static void initializeDebugActions();
	static std::vector<std::pair<std::string, lua_CFunction> > initializeHostFunctions();
	static std::map<std::string, std::function<void()> >  initializeCreateSpatialFunctions(lua_State * L);

	static int l_DebuggerEntry(lua_State* L);
	static int l_DatasetGetFeatureIDs(lua_State* L);
	static int l_FeatureGetType(lua_State* L);
	static int l_FeatureGetSpatialAssociations(lua_State* L);
	static int l_GetSpatial(lua_State* L);
	static int l_PortrayalEmit(lua_State* L);
  static int l_GetSimpleAttribute(lua_State* L);

private:
	lua_State *L_;

	static const int L_STACK_TOP_ = -1;
	static const int L_STACK_DOWN_ = 1;

	static ObjectController objectController_;

	//static std::map<std::string, std::function<void(lua_State *)> > debugActions_;
};

