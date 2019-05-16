#include "help_init.h"

int main()
{
    qInstallMessageHandler(myMessageOutput);

    QTextStream errorStream(stderr);

    if (!isExists(errorStream, filenames::LUA_MAIN)) { return -1; }
//    QFile portayalFile(filenames::PORTRAYAL);
//    if (!isOpen(errorStream,portayalFile, QIODevice::WriteOnly | QIODevice::Text)) { return -1; }

    /// -----------------------------------------------------

    qInfo("START: Map parsing");

    QFile elapsedTimesFile("MapSetResults.csv");
    if (!elapsedTimesFile.open(QFile::WriteOnly)) {
        qFatal("The file did not open");
    }
    QTextStream outElapsedTimes(&elapsedTimesFile);

    //--------
    QDir directory(filenames::MAP_SET);
    QStringList fileNames = directory.entryList();
    for (int i = 2; i < fileNames.size(); ++i){
        QFile mapFile(filenames::MAP_SET + fileNames[i]);
        if (!isExistsEndOpen(errorStream, mapFile, QIODevice::ReadOnly)) { return -1; }
        FeatureMapXMLBuilder mapBuilder(&mapFile);
        auto mapController = mapBuilder.build(true);
        mapFile.close();

        qInfo("END: Map parsing");

        qInfo("START: Feature Catalog parsing");
        FeatureCatalogueXMLBuilder dictBuilder;

        QFile dictFile(filenames::DICT);
        if (!isExistsEndOpen(errorStream, dictFile, QIODevice::ReadOnly)) { return -1; }
        auto dictController = dictBuilder.build(&dictFile);
        dictFile.close();
        qInfo("END: Feature Catalog parsing");

        ContexParametrController contextParamCtrl(contextparams::PARAMS);
        LuaRuleMashine luaPortoyal(filenames::LUA_MAIN, dictController, mapController, contextParamCtrl);
        auto status = luaPortoyal.doPortrayal();
        auto msg = std::string(" \n\n--- DO PORTRAYAL STATUS: --- ") + (status ? "true" : "false");
        qDebug(msg.c_str());

        QFile instractionFile(fileNames[i] + "-OUTPUT.txt");
        if (!isOpen(errorStream, instractionFile, QIODevice::WriteOnly | QIODevice::Text)) { return -1; }

        auto drawInstCtrl = luaPortoyal.drawController();
        writeDrawInst(instractionFile, drawInstCtrl, dictController, mapController);

        Profiler::instance().dumpLogMultiMap(outElapsedTimes, fileNames[i]);
        Profiler::instance().clear();

        instractionFile.close();
    }

    /// -----------------------------------------------------

    //Profiler::setLogFile(filenames::PROFILE);
    //Profiler::instance().dumpLog();

    elapsedTimesFile.close();
}
