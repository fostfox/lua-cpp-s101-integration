#include "fc_featureassociation.h"

FC_FeatureAssociation::FC_FeatureAssociation(const FC_Item &header
        , const QVector<FC_Role> &roles)
    :m_header(header)
{
    for (int i = 0; i < roles.size(); ++i){
        m_roleRefs.push_back(roles[i]);
        m_role.push_back(roles[i].header().code());
    }
}

const QVector<RoleCode>& FC_FeatureAssociation::role() const
{
    return m_role;
}

void FC_FeatureAssociation::setHeader(const FC_Item &header)
{
    m_header = header;
}

const QVector<FC_Role>& FC_FeatureAssociation::roleRefs() const
{
    return m_roleRefs;
}

void FC_FeatureAssociation::addRoleRef(const FC_Role &roleRef)
{
    m_roleRefs.push_back(roleRef);
    m_role.push_back(roleRef.header().code());
}

const FC_Item &FC_FeatureAssociation::header() const
{
    return m_header;
}
