#include "fc_featurebinding.h"

FC_FeatureBinding::FC_FeatureBinding(Multiplicity multiplicity
        , FC_RoleType roleType
        , FeatureTypeCode featureType
        , FC_Role roleRef
        , FC_FeatureAssociation associationRef
        )
    :m_multiplicity(multiplicity)
    ,m_roleType(roleType)
    ,m_featureType(featureType)
    ,m_role(roleRef.header().code())
    ,m_roleRef(roleRef)
    ,m_association(associationRef.header().code())
    ,m_associationRef(associationRef)
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

FeatureAssociationCode FC_FeatureBinding::association() const
{
    return m_association;
}

const FC_Role &FC_FeatureBinding::roleRef() const
{
    return m_roleRef;
}

void FC_FeatureBinding::setRoleRef(FC_Role roleRef)
{
    m_role = roleRef.header().code();
    m_roleRef = roleRef;
}

const FC_FeatureAssociation &FC_FeatureBinding::associationRef() const
{
    return m_associationRef;
}

void FC_FeatureBinding::setAssociationRef(FC_FeatureAssociation associationRef)
{
    m_associationRef = associationRef;
}
