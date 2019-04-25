#pragma once

#include "fc_item.h"
#include "fc_role.h"

#include <QVector>


class FC_InformationAssociation
{
  public:
    FC_InformationAssociation() = default;
    FC_InformationAssociation(
            FC_Item header
            , QVector<RoleCode> roles
    );

    FC_Item header() const;
    QVector<RoleCode> roles() const;

    void setHeader(const FC_Item &header);

    void addRoleCode(const RoleCode &role);

private:
    FC_Item m_header;
    QVector<RoleCode> m_roles;
};
