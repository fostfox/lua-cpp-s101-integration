#include "LuaRuleMashine.h"

#include <string>
#include <iostream>
#include <QString>
#include <sol/sol.hpp>

#include "ObjectDictCatalogue/Controllers/featurecataloguecontroller.h"
#include "ObjectMapCatalogue/Controllers/featurescontroller.h"
#include "ObjectDrawCatalogue/drawing_instructions_controller.h"

#include "host_func_def.h"

LuaRuleMashine::LuaRuleMashine(
        const QString &fileNameEntryPoint
        , const FeatureCatalogueController & dictObjController
        , const FeatureMapController & mapObjController
        , const ContexParametrController &contParamController
        )
    :m_dictObjCtrl(dictObjController)
    ,m_mapObjCtrl(mapObjController)
    ,m_contParamCtrl(contParamController)
{
    m_drawController = new DrawingInstructionsController();

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

    m_lua->script_file(fileNameEntryPoint.toStdString());
    m_luaHostFunc = new LuaHostFunc(*m_lua, m_dictObjCtrl, m_mapObjCtrl, m_contParamCtrl, *m_drawController);
}

bool LuaRuleMashine::doPortrayal()
{
    bool isSuccess = m_luaHostFunc->doPortrayal();
    return isSuccess;
}

const DrawingInstructionsController &LuaRuleMashine::drawController() const
{
    return *m_drawController;
}

LuaRuleMashine::~LuaRuleMashine()
{
    delete m_drawController;
    delete m_luaHostFunc;
    delete m_lua;
}
