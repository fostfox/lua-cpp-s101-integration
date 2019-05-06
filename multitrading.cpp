#include "multitrading.h"
#include <omp.h>
#include <iostream>

Multitrading::Multitrading(const QString &fileNameEntryPoint, const FeatureCatalogueController &dictObjController, const FeatureMapController &mapObjController, const ContexParametrController &contParamController)
    :m_fileNameEntryPoint(fileNameEntryPoint)
    ,m_dictObjController(dictObjController)
    ,m_mapObjController(mapObjController)
    ,m_contParamController(contParamController)
{

}

DrawingInstructionsController Multitrading::doCool()
{
    auto featuresIDs = m_mapObjController.getFeaturesIDs();
    int nThreads = 8;
    int n = (featuresIDs.size() - 1) / (nThreads - 1);
    std::vector<std::vector<std::string> > vec(nThreads);

    for (int k = 0; k < nThreads; ++k){
        auto start_itr = std::next(featuresIDs.cbegin(), k*n);
        auto end_itr = std::next(featuresIDs.cbegin(), k*n + n);

        vec[k].resize(n);

        if (k*n + n > featuresIDs.size()){
            end_itr = featuresIDs.cend();
            vec[k].resize(featuresIDs.size() - k*n);
        }
        std::copy(start_itr, end_itr, vec[k].begin());
    }

    m_drawInstrContrs.resize(nThreads);

#   pragma omp parallel
    {
        assert(nThreads == omp_get_num_threads());
        int tid = omp_get_thread_num();
        printf("tid: %i/%i\n", tid, nThreads);

        LuaRuleMashine luaPortoyal(
                    m_fileNameEntryPoint, m_dictObjController, m_mapObjController, m_contParamController
                    );

        luaPortoyal.doPortrayal(vec[tid]);
        m_drawInstrContrs[tid] = luaPortoyal.drawController();
    }

    printf("m_drawInstrContrs[0] size: %i\n", m_drawInstrContrs[0].drawInstr().size());


    QMap<int, DrawingInstructions> totalDrawInstr;
    for (auto drawInstSet : m_drawInstrContrs){
        auto drawInstrMap = drawInstSet.drawInstr();
        totalDrawInstr.unite(std::move(drawInstrMap));
    }

    return DrawingInstructionsController(std::move(totalDrawInstr));
}
