#pragma once

#include "../DataTypes/datatypes.h"
#include "fc_item.h"

class FC_Role : public FC_Item{
  public:
    FC_Role() = default;
    FC_Role(const FC_Item &header);

    const FC_Item& header() const;

private:
    FC_Item m_header;
};
