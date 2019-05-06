#pragma once

class FeatureMapController;
class FeatureCatalogueController;
class ContexParametrController;
class DrawingInstructionsController;


class LuaHostFunc;
class QString;

#include <string>
#include <vector>


namespace sol {
class state;
}


class LuaRuleMashine {
public:
    LuaRuleMashine(
            const QString& fileNameEntryPoint
            , const FeatureCatalogueController &dictObjController
            , const FeatureMapController &mapObjController
            , const ContexParametrController &contParamController
            );

	~LuaRuleMashine();

    bool doPortrayal(const std::vector<std::string> &featuresId);

    const DrawingInstructionsController &drawController() const;


    //void getPortrayal(std::string);

    //std::vector<Object> getCurrentObjects() const;

    //static void initializeObjectController();



private:
    const FeatureCatalogueController & m_dictObjCtrl;
    const FeatureMapController & m_mapObjCtrl;
    const ContexParametrController & m_contParamCtrl;
    DrawingInstructionsController* m_drawController;

    LuaHostFunc* m_luaHostFunc;

    sol::state* m_lua;
};

