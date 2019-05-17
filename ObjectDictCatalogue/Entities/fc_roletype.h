#pragma once

#include "enumtype.h"


enum class FC_RoleTypes {
    Association,
    Aggregation,
    Composition,

    /*
     * Undefined object type. Perhaps the default constructor
     * created a Type Object, so the type was set by default.
    */
    UNDEFINED
};


class FC_RoleType : public EnumType<FC_RoleTypes>
{
  public:
    FC_RoleType();
    FC_RoleType(const std::string& type);
    FC_RoleType(FC_RoleTypes type);

  private:
    void initMaps();
};


