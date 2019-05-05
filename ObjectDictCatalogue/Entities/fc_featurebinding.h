#pragma once

#include "fc_featureassociation.h"
#include "fc_roletype.h"

class FC_FeatureBinding
{
  public:
    FC_FeatureBinding() = default;
    FC_FeatureBinding(Multiplicity multiplicity
            , FC_RoleType roleType
            , FeatureTypeCode featureType
            , FC_Role roleRef
            , FC_FeatureAssociation associationRef
            );


    Multiplicity multiplicity() const;
    void setMultiplicity(const Multiplicity &multiplicity);

    FC_RoleType roleType() const;
    void setRoleType(const FC_RoleType &roleType);

    FeatureTypeCode featureType() const;
    void setFeatureType(const FeatureTypeCode &featureType);


    RoleCode role() const;
    const FC_Role& roleRef() const;
    void setRoleRef(FC_Role roleRef);

    FeatureAssociationCode association() const;
    const FC_FeatureAssociation &associationRef() const;
    void setAssociationRef(FC_FeatureAssociation associationRef);

private:
    Multiplicity m_multiplicity;
    FC_RoleType m_roleType;

    FeatureTypeCode m_featureType;
    RoleCode m_role;
    FC_Role m_roleRef;
    FeatureAssociationCode m_association;
    FC_FeatureAssociation m_associationRef;
};
