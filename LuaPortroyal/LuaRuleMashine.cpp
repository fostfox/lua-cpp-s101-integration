#include "LuaRuleMashine.h"

#include <string>
#include <iostream>
#include <QString>
#include <sol/sol.hpp>

#include "ObjectDictCatalogue/Controllers/featurecataloguecontroller.h"
#include "ObjectMapCatalogue/Controllers/featurescontroller.h"
#include "drawing_instructions_controller.h"

#include "host_func_def.h"

LuaRuleMashine::LuaRuleMashine(
        const QString &fileNameEntryPoint
        , const FeatureCatalogueController & dictObjController
        , const FeatureMapController & mapObjController
        )
    :m_dictObjCtrl(dictObjController)
    ,m_mapObjCtrl(mapObjController)
{

    m_drawController = new DrawingInstructionsController();

    m_lua = new sol::state();
    std::cout << "=== opening a state ===" << std::endl;

    m_lua->open_libraries(sol::lib::base, sol::lib::package, sol::lib::string, sol::lib::table);
    m_lua->script_file(fileNameEntryPoint.toStdString());

    m_luaHostFunc = new LuaHostFunc(*m_lua, m_dictObjCtrl, m_mapObjCtrl, *m_drawController);
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
