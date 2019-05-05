#include <QDebug>
#include <QFile>
#include <QTextStream>

#include "init.h"

#include "ObjectDictCatalogue/Builder/xmlbuilder.h"
#include "ObjectMapCatalogue/Builder/xmlparser.h"
#include "LuaPortroyal/LuaRuleMashine.h"
#include "drawing_instructions_controller.h"
#include "contextparameter.h"
#include <iostream>

int main(int argc, char *argv[])
{
    qInstallMessageHandler(myMessageOutput);

    QTextStream errorStream(stderr);

    QFile mapFile(filenames::MAP);
    if (!QFile::exists(filenames::MAP)) {
        errorStream << QString(
                           "File %1 does not exist.\n"
                           ).arg(filenames::MAP);
        return -1;
    } else if (!mapFile.open(QIODevice::ReadOnly)){
        errorStream << QString(
                           "Filed to open file %1.\n"
                           ).arg(filenames::MAP);
        return -1;
    }
    QFile dictFile(filenames::DICT);
    if (!QFile::exists(filenames::DICT)) {
        errorStream << QString(
                           "File %1 does not exist.\n"
                           ).arg(filenames::DICT);
        return -1;
    } else if (!dictFile.open(QIODevice::ReadOnly)){
        errorStream << QString(
                           "Filed to open file %1.\n"
                           ).arg(filenames::DICT);
        return -1;
    }
    if (!QFile::exists(filenames::LUA_MAIN)) {
        errorStream << QString(
                           "File %1 does not exist.\n"
                           ).arg(filenames::LUA_MAIN);
        return -1;
    }
    QFile portayalFile(filenames::PORTRAYAL);
    if(!portayalFile.open(QIODevice::WriteOnly | QIODevice::Text)){
            errorStream << QString(
                               "Filed to open file %1.\n"
                               ).arg(filenames::PORTRAYAL);
            return -1;
        }
    /// -----------------------------------------------------

    qInfo() << "START: Map parsing";
    FeatureMapXMLBuilder mapBuilder(&mapFile);
    auto mapController = mapBuilder.build(true);
    mapFile.close();
    qInfo() << "END: Map parsing";

    qInfo() << "START: Feature Catalog parsing";
    FeatureCatalogueXMLBuilder dictBuilder;
    auto dictController = dictBuilder.build(&dictFile);
    dictFile.close();
    qInfo() << "END: Feature Catalog parsing";

    ContexParametrController contextParamCtrl;

    LuaRuleMashine luaPortoyal(filenames::LUA_MAIN, dictController, mapController, contextParamCtrl);

    for (int i = 0; i < 30; ++i){
        qDebug() << " \n\n--- DO PORTRAYAL STATUS: ---"<< luaPortoyal.doPortrayal();
    }


    QTextStream out(&portayalFile);
    auto drawInstCtrl = luaPortoyal.drawController();
    for (const auto& featureID : mapController.getFeaturesIDs()){
        std::string featureCode = mapController.getFeatureById(featureID).classAlias();
        std::string drawInstr = drawInstCtrl.drawInstr(stoi(featureID)).drawingInstruction();
        out << "Feature : [" << QString::fromStdString(featureID) << "] " << QString::fromStdString(featureCode)
                 << "\n " << QString::fromStdString(drawInstr)
                 << "\n---------------------------------------\n";
    }
    portayalFile.close();

    /// -----------------------------------------------------
    ///
    Profiler::setLogFile(filenames::PROFILE);
    Profiler::instance().dumpLog();

    std::cout << Profiler::instance().functionTimeInfo(QString::fromStdString("PortrayalMain")).totalElapsed() << std::endl;
    std::cout << Profiler::instance().allTime() - Profiler::instance().functionTimeInfo(QString::fromStdString("PortrayalMain")).totalElapsed();
}
