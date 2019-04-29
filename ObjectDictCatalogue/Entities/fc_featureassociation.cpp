#include "fc_featureassociation.h"

FC_FeatureAssociation::FC_FeatureAssociation(FC_Item header
        , QVector<FC_Role> roles)
    :m_header(header)
{
    for (int i = 0; i < roles.size(); ++i){
        m_roleRefs.push_back(roles[i]);
        m_role.push_back(roles[i].header().code());
    }
}

QVector<RoleCode> FC_FeatureAssociation::role() const
{
    return m_role;
}

void FC_FeatureAssociation::setHeader(const FC_Item &header)
{
    m_header = header;
}

QVector<FC_Role> FC_FeatureAssociation::roleRefs() const
{
    return m_roleRefs;
}

void FC_FeatureAssociation::addRoleRef(FC_Role roleRef)
{
    m_roleRefs.push_back(roleRef);
    m_role.push_back(roleRef.header().code());
}

FC_Item FC_FeatureAssociation::header() const
{
    return m_header;
}
