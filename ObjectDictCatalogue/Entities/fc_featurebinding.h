#pragma once

#include "../DataTypes/datatypes.h"
#include "fc_role.h"
//#include "fc_featuretype.h"
#include "fc_role.h"
#include "fc_featureassociation.h"
#include "fc_roletype.h"

class FC_FeatureBinding
{
  public:
    FC_FeatureBinding() = default;
    FC_FeatureBinding(
            Multiplicity m_multiplicity
            ,FC_RoleType m_roleType
            ,FeatureTypeCode m_featureType
            ,RoleCode m_role
            ,FeatureAssociationCode m_association
            );


    Multiplicity multiplicity() const;
    void setMultiplicity(const Multiplicity &multiplicity);

    FC_RoleType roleType() const;
    void setRoleType(const FC_RoleType &roleType);

    FeatureTypeCode featureType() const;
    void setFeatureType(const FeatureTypeCode &featureType);

    RoleCode role() const;
    void setRole(const RoleCode &role);

    FeatureAssociationCode association() const;
    void setAssociation(const FeatureAssociationCode &association);

private:
    Multiplicity m_multiplicity;
    FC_RoleType m_roleType;

    FeatureTypeCode m_featureType;
    RoleCode m_role;
    FeatureAssociationCode m_association;
};
