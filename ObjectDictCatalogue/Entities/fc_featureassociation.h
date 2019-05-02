#pragma once

#include "fc_role.h"

#include <QVector>

class FC_FeatureAssociation
{
  public:
    FC_FeatureAssociation() = default;
    FC_FeatureAssociation(FC_Item header
            , QVector<FC_Role> roles
    );

    FC_Item header() const;
    void setHeader(const FC_Item &header);

    QVector<RoleCode> role() const;

    QVector<FC_Role> roleRefs() const;
    void addRoleRef(FC_Role roleRefs);

private:
    FC_Item m_header;
    QVector<RoleCode> m_role;
    QVector<FC_Role> m_roleRefs;
};
