#include "fc_featurebinding.h"

FC_FeatureBinding::FC_FeatureBinding(
        Multiplicity multiplicity
        , FC_RoleType roleType
        , FeatureTypeCode featureType
        , RoleCode role
        , FeatureAssociationCode association
        )
    :m_multiplicity(multiplicity)
    ,m_roleType(roleType)
    ,m_featureType(featureType)
    ,m_role(role)
    ,m_association(association)
{

}

Multiplicity FC_FeatureBinding::multiplicity() const
{
    return m_multiplicity;
}

void FC_FeatureBinding::setMultiplicity(const Multiplicity &multiplicity)
{
    m_multiplicity = multiplicity;
}

FC_RoleType FC_FeatureBinding::roleType() const
{
    return m_roleType;
}

void FC_FeatureBinding::setRoleType(const FC_RoleType &roleType)
{
    m_roleType = roleType;
}

FeatureTypeCode FC_FeatureBinding::featureType() const
{
    return m_featureType;
}

void FC_FeatureBinding::setFeatureType(const FeatureTypeCode &featureType)
{
    m_featureType = featureType;
}

RoleCode FC_FeatureBinding::role() const
{
    return m_role;
}

void FC_FeatureBinding::setRole(const RoleCode &role)
{
    m_role = role;
}

FeatureAssociationCode FC_FeatureBinding::association() const
{
    return m_association;
}

void FC_FeatureBinding::setAssociation(const FeatureAssociationCode &association)
{
    m_association = association;
}
