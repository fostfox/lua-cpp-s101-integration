#pragma once

#include "enumtype.h"


enum class CD_FeatureUseTypes {
    /*
     * Carries the descriptive characteristics of a real world entity
    */
    GEOGRAPHIC,

    /*
     * Delineates geographic location where meta information is
     * applicable” distinct from an Information Type which carries
     * information related to features which are related.
    */
    META,

    /*
     * carries information about the cartographic representation
     * (including text) of a real world entity
    */
    CARTOGRAPHIC,

    /*
     * Grouping features thematically
    */
    THEME,
};

class CD_FeatureUseType : public EnumType<CD_FeatureUseTypes>
{
  public:
    CD_FeatureUseType() = default;
    CD_FeatureUseType(CD_FeatureUseTypes type);
    CD_FeatureUseType(std::string type);

  private:
    void initMaps();
};
