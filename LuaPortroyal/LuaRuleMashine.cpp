#include "LuaRuleMashine.h"

#include <string>
#include <iostream>
#include <QString>
#include <sol/sol.hpp>

#include "ObjectDictCatalogue/Controllers/featurecataloguecontroller.h"
#include "ObjectMapCatalogue/Controllers/featurescontroller.h"


#include "host_func_def.h"
//#include "luajit.h"
LuaRuleMashine::LuaRuleMashine(
        const QString &fileNameEntryPoint
        , const FeatureCatalogueController & dictObjController
        )
    :m_dictObjCtrl(dictObjController)
{

    m_lua = new sol::state();

    m_lua->open_libraries(
                sol::lib::base,
                sol::lib::package,
                sol::lib::coroutine,
                sol::lib::string,
                sol::lib::os,
                sol::lib::io,
                sol::lib::table,
                sol::lib::debug);
#   ifdef JIT_COMPILE_ENABLED
        m_lua->open_libraries(sol::lib::jit);
#   endif

    //luaJIT_setmode(m_lua->lua_state(), 0, LUAJIT_MODE_ON | LUAJIT_MODE_DEBUG);

    m_lua->script_file(fileNameEntryPoint.toStdString());
    m_luaHostFunc = new LuaHostFunc(*m_lua, m_dictObjCtrl, m_drawController);
}

bool LuaRuleMashine::doPortrayal()
{
    bool isSuccess = m_luaHostFunc->doPortrayal();
    return isSuccess;
}

void LuaRuleMashine::PortrayalInitialize(const ContexParametrController &contParamController, std::shared_ptr<FeatureMapController> mapObjCtrl)
{
    m_luaHostFunc->PortrayalInitialize(contParamController, mapObjCtrl);
}

const DrawingInstructionsController &LuaRuleMashine::drawController() const
{
    return m_drawController;
}

LuaRuleMashine::~LuaRuleMashine()
{
    delete m_luaHostFunc;
    delete m_lua;
}
