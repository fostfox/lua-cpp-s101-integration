#pragma once

#include "../ObjectDictCatalogue/Controllers/featurecataloguecontroller.h"
#include "../ObjectMapCatalogue/Controllers/featurescontroller.h"


class lua_State;


class LuaRuleMashine {
public:
    LuaRuleMashine(
            const QString &fileNameEntryPoint
            , const FeatureCatalogueController &dictObjController
            , const FeatureMapController &mapObjController
            );

	~LuaRuleMashine();

    //void getPortrayal(std::string);

    //std::vector<Object> getCurrentObjects() const;

    //static void initializeObjectController();

private:
    FeatureCatalogueController m_dictObjCtrl;
    FeatureMapController m_mapObjCtrl;
};

