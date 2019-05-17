#pragma once

#include "fc_featureassociation.h"
#include "fc_roletype.h"

class FC_FeatureBinding
{
  public:
    FC_FeatureBinding() = default;
    FC_FeatureBinding(const Multiplicity& multiplicity
            , const FC_RoleType &roleType
            , const FeatureTypeCode &featureType
            , const FC_Role &roleRef
            , const FC_FeatureAssociation &associationRef
            );


    const Multiplicity &multiplicity() const;
    void setMultiplicity(const Multiplicity &multiplicity);

    const FC_RoleType &roleType() const;
    void setRoleType(const FC_RoleType &roleType);

    const FeatureTypeCode &featureType() const;
    void setFeatureType(const FeatureTypeCode &featureType);


    const RoleCode &role() const;
    const FC_Role& roleRef() const;
    void setRoleRef(FC_Role roleRef);

    const FeatureAssociationCode &association() const;
    const FC_FeatureAssociation &associationRef() const;
    void setAssociationRef(const FC_FeatureAssociation &associationRef);

private:
    Multiplicity m_multiplicity;
    FC_RoleType m_roleType;

    FeatureTypeCode m_featureType;
    RoleCode m_role;
    FC_Role m_roleRef;
    FeatureAssociationCode m_association;
    FC_FeatureAssociation m_associationRef;
};
