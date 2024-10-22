#pragma once

#include "fc_item.h"

class FC_Role{
  public:
    FC_Role();
    FC_Role(const FC_Item &header);

    const FC_Item& header() const;

private:
    FC_Item m_header;
};
