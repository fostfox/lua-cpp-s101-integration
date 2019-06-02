#include "help_init.h"
#include <QGuiApplication>

#include <QScreen>

int main(int argc, char *argv[])
{
    QGuiApplication a(argc, argv);


    qInstallMessageHandler(myMessageOutput);

    QTextStream errorStream(stderr);

    QFile mapFile(filenames::MAP);
    if (!isExistsEndOpen(errorStream, mapFile, QIODevice::ReadOnly)) { return -1; }
    QFile dictFile(filenames::DICT);
    if (!isExistsEndOpen(errorStream, dictFile, QIODevice::ReadOnly)) { return -1; }
    QFile symbolFile(filenames::PORTRAYAL_CATALOGUE);
    if (!isExistsEndOpen(errorStream, symbolFile, QIODevice::ReadOnly)) { return -1; }
    if (!isExists(errorStream, filenames::LUA_MAIN)) { return -1; }
    ///QFile portayalFile(filenames::PORTRAYAL);
    ///if (!isOpen(errorStream,portayalFile, QIODevice::WriteOnly | QIODevice::Text)) { return -1; }

    /// -----------------------------------------------------

    qInfo("START: Map parsing");
    FeatureMapXMLBuilder mapBuilder(&mapFile);
    auto mapController = mapBuilder.build(true);
    mapFile.close();
    qInfo("END: Map parsing");

    qInfo("START: Feature Catalog parsing");
    FeatureCatalogueXMLBuilder dictBuilder;
    auto dictController = dictBuilder.build(&dictFile);
    dictFile.close();
    qInfo("END: Feature Catalog parsing");

    ContexParametrController contextParamCtrl(contextparams::PARAMS);
    LuaRuleMashine luaPortoyal(filenames::LUA_MAIN, dictController, mapController, contextParamCtrl);

    auto status = luaPortoyal.doPortrayal();
    auto msg = std::string(" \n\n--- DO PORTRAYAL STATUS: --- ") + (status ? "true" : "false");
    qDebug(msg.c_str());
    auto drawInstCtrl = luaPortoyal.drawController();

    PortrayalCatalogueBuilder pcBuilder;
     auto symbolCtrl = pcBuilder.build(&symbolFile);

    DrawEngine drawEngine(
                &mapController,
                &drawInstCtrl,
                &symbolCtrl
                );
    auto dpi = a.primaryScreen()->physicalDotsPerInch();
    drawEngine.draw(dpi);
    const auto& img = drawEngine.img();
    img.save(filenames::IMG_MAP);



    ///writeDrawInst(portayalFile, drawInstCtrl, dictController, mapController);

    //portayalFile.close();

    /// -----------------------------------------------------

    ///Profiler::setLogFile(filenames::PROFILE);
    ///Profiler::instance().dumpLog();
    //return a.exec();
}
