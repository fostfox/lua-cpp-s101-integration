#ifndef MULTITRADING_H
#define MULTITRADING_H

#include "ObjectDictCatalogue/Controllers/featurecataloguecontroller.h"
#include "ObjectMapCatalogue/Controllers/featurescontroller.h"
#include "drawing_instructions_controller.h"
#include "contextparameter.h"

#include "LuaPortroyal/LuaRuleMashine.h"
#include <QString>



class Multitrading
{
public:
    Multitrading(
            const QString& fileNameEntryPoint
            , const FeatureCatalogueController &dictObjController
            , const FeatureMapController &mapObjController
            , const ContexParametrController &contParamController);
    DrawingInstructionsController doCool();
private:
    QVector<DrawingInstructionsController> m_drawInstrContrs;
    const QString m_fileNameEntryPoint;
    const FeatureCatalogueController m_dictObjController;
    const FeatureMapController m_mapObjController;
    const ContexParametrController m_contParamController;
};

#endif // MULTITRADING_H
