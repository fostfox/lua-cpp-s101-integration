
#pragma once

#include "ObjectDrawCatalogue/drawing_instructions_controller.h"
#include <memory>

class FeatureMapController;
class FeatureCatalogueController;
class ContexParametrController;
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
            );

	~LuaRuleMashine();

    bool doPortrayal();

    void PortrayalInitialize(const ContexParametrController &contParamController, std::shared_ptr<FeatureMapController> mapObjCtrl);

    const DrawingInstructionsController &drawController() const;


    //void getPortrayal(std::string);

    //std::vector<Object> getCurrentObjects() const;

    //static void initializeObjectController();


private:
    const FeatureCatalogueController & m_dictObjCtrl;
    DrawingInstructionsController m_drawController;

    LuaHostFunc* m_luaHostFunc;

    sol::state* m_lua;
};

