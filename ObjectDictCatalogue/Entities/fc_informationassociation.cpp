#include "fc_informationassociation.h"


FC_InformationAssociation::FC_InformationAssociation(
        FC_Item item
        , QVector<RoleCode> roles)
    : m_header(item)
    , m_roles(roles)

{

}

FC_Item FC_InformationAssociation::header() const
{
    return m_header;
}

QVector<RoleCode> FC_InformationAssociation::roles() const
{
    return m_roles;
}

void FC_InformationAssociation::setHeader(const FC_Item &header)
{
    m_header = header;
}

void FC_InformationAssociation::addRoleCode(const RoleCode &role)
{
    m_roles.push_back(role);
}
