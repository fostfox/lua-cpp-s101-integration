#pragma once

#include "fc_role.h"

#include <QVector>


class FC_InformationAssociation
{
  public:
    FC_InformationAssociation() = default;
    FC_InformationAssociation(
            FC_Item header
            , const QVector<FC_Role>& rolesRef
    );

    void setHeader(const FC_Item &header);
    const FC_Item &header() const;

    const QVector<RoleCode>& roles() const;
    const QVector<FC_Role>& rolesRef() const;
    void addRoleRef(const FC_Role &role);

private:
    FC_Item m_header;
    QVector<RoleCode> m_roles;
    QVector<FC_Role> m_rolesRef;
};
