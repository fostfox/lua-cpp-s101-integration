#pragma once

#include "enumtype.h"


enum class FC_RoleTypes {
    Association,
    Aggregation,
    Composition
};


class FC_RoleType : public EnumType<FC_RoleTypes>
{
  public:
    FC_RoleType() = default;
    FC_RoleType(std::string type);
    FC_RoleType(FC_RoleTypes type);

  private:
    void initMaps();
};


