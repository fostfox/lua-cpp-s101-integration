#pragma once

#include "../DataTypes/datatypes.h"
#include "fc_roletype.h"
#include "fc_informationassociation.h"
#include "fc_informationtype.h"


class FC_InformationBinding
{
  public:
    FC_InformationBinding() = default;
    FC_InformationBinding(
            Multiplicity multiplicity
            ,FC_RoleType roleType
            ,FC_InformationAssociation associationRef
            ,InformationTypeCode informationType
            );


    Multiplicity multiplicity() const;
    void setMultiplicity(const Multiplicity &multiplicity);

    FC_RoleType roleType() const;
    void setRoleType(const FC_RoleType &roleType);

    InformationAssociationCode association() const;
    const FC_InformationAssociation& associationRef() const;
    void setAssociationRef(const FC_InformationAssociation &associationRef);

    InformationTypeCode informationType() const;
    void setInformationType(const InformationTypeCode &informationType);


private:
    Multiplicity m_multiplicity;
    FC_RoleType m_roleType;
    InformationAssociationCode m_association;
    FC_InformationAssociation m_associationRef;
    InformationTypeCode m_informationType;
};
