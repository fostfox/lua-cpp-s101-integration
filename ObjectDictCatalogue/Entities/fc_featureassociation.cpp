#include "fc_featureassociation.h"

FC_FeatureAssociation::FC_FeatureAssociation(FC_Item header
        , QVector<RoleCode> role)
    :m_header(header)
    ,m_role(role)
{

}

QVector<RoleCode> FC_FeatureAssociation::role() const
{
    return m_role;
}

void FC_FeatureAssociation::setHeader(const FC_Item &header)
{
    m_header = header;
}

void FC_FeatureAssociation::addRoleCode(const RoleCode &role)
{
    m_role.push_back(role);
}

FC_Item FC_FeatureAssociation::header() const
{
    return m_header;
}
