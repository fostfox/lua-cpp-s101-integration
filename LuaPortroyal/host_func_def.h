#pragma once

namespace sol {
class state;
}

class FeatureMapController;
class FeatureCatalogueController;
class ContexParametrController;
class DrawingInstructionsController;


class LuaHostFunc {
private:
    sol::state& m_lua;

    const FeatureMapController& m_mapObjCtrl;
    const FeatureCatalogueController& m_dictObjCtrl;
    const ContexParametrController & m_contParamCtrl;
    DrawingInstructionsController& m_drawInstrCtrl;

    bool m_isActionState;
    int m_currentFeatureId_processFeaturePortrayal = -1;

public:
    LuaHostFunc(sol::state &lua
            , const FeatureCatalogueController &dictObjCtrl
            , const FeatureMapController &mapObjCtrl
            , const ContexParametrController &contParamController
            , DrawingInstructionsController &drawInstrCtrl
            );
    ~LuaHostFunc();
    bool doPortrayal();

    void loadFunctions();
};
