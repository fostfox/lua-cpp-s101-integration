#pragma once

#include "fc_roletype.h"
#include "fc_informationassociation.h"
#include "fc_informationtype.h"


class FC_InformationBinding
{
  public:
    FC_InformationBinding() = default;
    FC_InformationBinding(
            const Multiplicity& multiplicity
            ,const FC_RoleType& roleType
            ,const FC_InformationAssociation& associationRef
            ,const InformationTypeCode& informationType
            ,const FC_Role& roleRef
            );


    const Multiplicity& multiplicity() const;
    void setMultiplicity(const Multiplicity &multiplicity);

    const FC_RoleType& roleType() const;
    void setRoleType(const FC_RoleType &roleType);

    const InformationAssociationCode& association() const;
    const FC_InformationAssociation& associationRef() const;
    void setAssociationRef(const FC_InformationAssociation &associationRef);

    const InformationTypeCode& informationType() const;
    void setInformationType(const InformationTypeCode &informationType);

    const FC_Role& roleRef() const;
    void setRoleRef(const FC_Role &roleRef);

private:
    Multiplicity m_multiplicity;
    FC_RoleType m_roleType;
    InformationAssociationCode m_association;
    FC_InformationAssociation m_associationRef;
    InformationTypeCode m_informationType;
    FC_Role m_roleRef;
};
