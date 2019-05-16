#include "help_init.h"


int main()
{
    qInstallMessageHandler(myMessageOutput);

    QTextStream errorStream(stderr);

    QFile mapFile(filenames::MAP);
    if (!isExistsEndOpen(errorStream, mapFile, QIODevice::ReadOnly)) { return -1; }
    QFile dictFile(filenames::DICT);
    if (!isExistsEndOpen(errorStream, dictFile, QIODevice::ReadOnly)) { return -1; }
    if (!isExists(errorStream, filenames::LUA_MAIN)) { return -1; }
    QFile portayalFile(filenames::PORTRAYAL);
    if (!isOpen(errorStream,portayalFile, QIODevice::WriteOnly | QIODevice::Text)) { return -1; }

    /// -----------------------------------------------------

    FeatureMapXMLBuilder mapBuilder(&mapFile);
    auto mapController = mapBuilder.build(true);
    mapFile.close();

    FeatureCatalogueXMLBuilder dictBuilder;
    auto dictController = dictBuilder.build(&dictFile);
    dictFile.close();

    ContexParametrController contextParamCtrl(contextparams::PARAMS);
    LuaRuleMashine luaPortoyal(filenames::LUA_MAIN, dictController, mapController, contextParamCtrl);
    auto status = luaPortoyal.doPortrayal();
    //auto msg = std::string(" \n\n--- DO PORTRAYAL STATUS: --- ") + (status ? "true" : "false");
    //qDebug(msg.c_str());

    auto drawInstCtrl = luaPortoyal.drawController();
    writeDrawInst(portayalFile, drawInstCtrl, dictController, mapController);
    portayalFile.close();

    /// -----------------------------------------------------

    Profiler::setLogFile(filenames::PROFILE);
    Profiler::instance().dumpLog();
}
