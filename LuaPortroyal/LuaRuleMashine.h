#pragma once

class FeatureMapController;
class FeatureCatalogueController;
class DrawingInstructionsController;

class LuaHostFunc;
class QString;

namespace sol {
class state;
}


class LuaRuleMashine {
public:
    LuaRuleMashine(
            const QString& fileNameEntryPoint
            , const FeatureCatalogueController &dictObjController
            , const FeatureMapController &mapObjController
            );

	~LuaRuleMashine();

    bool doPortrayal();

    const DrawingInstructionsController &drawController() const;


    //void getPortrayal(std::string);

    //std::vector<Object> getCurrentObjects() const;

    //static void initializeObjectController();



private:
    const FeatureCatalogueController & m_dictObjCtrl;
    const FeatureMapController & m_mapObjCtrl;
    DrawingInstructionsController* m_drawController;

    LuaHostFunc* m_luaHostFunc;

    sol::state* m_lua;
};

