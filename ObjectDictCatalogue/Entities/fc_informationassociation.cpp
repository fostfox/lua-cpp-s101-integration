#include "fc_informationassociation.h"


FC_InformationAssociation::FC_InformationAssociation(const FC_Item& item
        , const QVector<FC_Role> &rolesRef)
    : m_header(item)
    , m_rolesRef(rolesRef)

{
    for (int i = 0; i < rolesRef.size(); ++i){
        m_roles.push_back(rolesRef[i].header().code());
    }
}

const FC_Item& FC_InformationAssociation::header() const
{
    return m_header;
}

const QVector<RoleCode> &FC_InformationAssociation::roles() const
{
    return m_roles;
}

void FC_InformationAssociation::setHeader(const FC_Item &header)
{
    m_header = header;
}

void FC_InformationAssociation::addRoleRef(const FC_Role &role)
{
    m_roles.push_back(role.header().code());
    m_rolesRef.push_back(role);
}

const QVector<FC_Role>& FC_InformationAssociation::rolesRef() const
{
    return m_rolesRef;
}
