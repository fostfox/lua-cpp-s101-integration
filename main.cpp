#include "help_init.h"
#include <iostream>

int main()
{
    qInstallMessageHandler(myMessageOutput);
    //qInfo("test");

    QTextStream errorStream(stderr);

    if (!isExists(errorStream, filenames::LUA_MAIN)) { return -1; }
//    QFile portayalFile(filenames::PORTRAYAL);
//    if (!isOpen(errorStream,portayalFile, QIODevice::WriteOnly | QIODevice::Text)) { return -1; }

    /// -----------------------------------------------------

    //qInfo("START: Map parsing");

    QFile elapsedTimesFile("MapSetResults.csv");
    if (!elapsedTimesFile.open(QFile::WriteOnly)) {
        qFatal("The file did not open");
    }
    QTextStream outElapsedTimes(&elapsedTimesFile);

    QFile dictFile(filenames::DICT);
    if (!isExistsEndOpen(errorStream, dictFile, QIODevice::ReadOnly)) { return -1; }
    FeatureCatalogueXMLBuilder dictBuilder;
    auto dictController = dictBuilder.build(&dictFile);
    dictFile.close();

    ContexParametrController contextParamCtrl(contextparams::PARAMS);

    //--------
    QDir directory(filenames::MAP_SET);
    QStringList fileNames = directory.entryList();
    
    for (int i = 2; i < fileNames.size(); ++i){
        QFile mapFile(filenames::MAP_SET + fileNames[i]);
        if (!isExistsEndOpen(errorStream, mapFile, QIODevice::ReadOnly)) { return -1; }
        FeatureMapXMLBuilder mapBuilder(&mapFile);
        FeatureMapController mapController;
        try {
            mapController = mapBuilder.build(true);
            std::cout << fileNames[i].toStdString() << " " << mapController.getFeaturesIDs().size() << std::endl;
        }
        catch (QString mapName){
            std::cerr << mapName.toStdString();
            outElapsedTimes << mapName << ";" << "error";
            elapsedTimesFile.close();
        }
        mapFile.close();
        
        LuaRuleMashine luaPortoyal(filenames::LUA_MAIN, dictController, mapController, contextParamCtrl);
        auto status = luaPortoyal.doPortrayal();
        //auto msg = std::string(" \n\n--- DO PORTRAYAL STATUS: --- ") + (status ? "true" : "false");
        //qDebug(msg.c_str());

        QFile instractionFile(fileNames[i] + "-OUTPUT.txt");
        if (!isOpen(errorStream, instractionFile, QIODevice::WriteOnly | QIODevice::Text)) { return -1; }

        auto drawInstCtrl = luaPortoyal.drawController();
        writeDrawInst(instractionFile, drawInstCtrl, dictController, mapController);
        instractionFile.close();
        
        Profiler::instance().dumpLogMultiMap(outElapsedTimes, fileNames[i]);
        Profiler::instance().clear();
    }

    /// -----------------------------------------------------
    elapsedTimesFile.close();
}
