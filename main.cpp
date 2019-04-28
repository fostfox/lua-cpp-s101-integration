//#include <QCoreApplication>

#include <QDebug>
#include <QFile>

#include "ObjectDictCatalogue/Builder/xmlbuilder.h"
#include "ObjectMapCatalogue/Builder/xmlparser.h"
#include "LuaPortroyal/LuaRuleMashine.h"
#include "contextparameter.h"

int main(int argc, char *argv[])
{
    QTextStream errorStream(stderr);
    //QCoreApplication a(argc, argv);

    QString mapFileName = "../XMLData/test_dataset_map.xml";
    QFile mapFile(mapFileName);
    if (!QFile::exists(mapFileName)) {
        errorStream << QString(
                           "File %1 does not exist.\n"
                           ).arg(mapFileName);
        return -1;
    } else if (!mapFile.open(QIODevice::ReadOnly)){
        errorStream << QString(
                           "Filed to open file %1.\n"
                           ).arg(mapFileName);
        return -1;
    }

    QString dictFileName = "../XMLData/S-101_FC_0_8_8.xml";
    QFile dictFile(dictFileName);
    if (!QFile::exists(dictFileName)) {
        errorStream << QString(
                           "File %1 does not exist.\n"
                           ).arg(dictFileName);
        return -1;
    } else if (!dictFile.open(QIODevice::ReadOnly)){
        errorStream << QString(
                           "Filed to open file %1.\n"
                           ).arg(dictFileName);
        return -1;
    }


    FeatureMapXMLBuilder mapBuilder(&mapFile);
    auto mapController = mapBuilder.build();
    mapFile.close();

    FeatureCatalogueXMLBuilder dictBuilder;
    auto dictController = dictBuilder.build(&dictFile);
    dictFile.close();

    ContexParametrController contextParamCtrl;

    QString luaMainEntry("../LuaPortroyal/Rules/main.lua");
    if (!QFile::exists(luaMainEntry)) {
        errorStream << QString(
                           "File %1 does not exist.\n"
                           ).arg(luaMainEntry);
        return -1;
    }
    LuaRuleMashine luaPortoyal(luaMainEntry, dictController, mapController, contextParamCtrl);
    qDebug() << luaPortoyal.doPortrayal();

    //return a.exec();
}
