#pragma once

#include "fc_item.h"
#include "fc_role.h"

#include <QVector>

class FC_FeatureAssociation
{
  public:
    FC_FeatureAssociation() = default;
    FC_FeatureAssociation(FC_Item header
            , QVector<RoleCode> role
    );

    FC_Item header() const;
    QVector<RoleCode> role() const;

    void setHeader(const FC_Item &header);

    void addRoleCode(const RoleCode &role);

private:
    FC_Item m_header;
    QVector<RoleCode> m_role;
};
