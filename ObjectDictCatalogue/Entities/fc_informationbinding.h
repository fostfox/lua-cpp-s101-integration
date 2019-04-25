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
            ,InformationAssociationCode association
            ,InformationTypeCode informationType
            );


    Multiplicity multiplicity() const;
    void setMultiplicity(const Multiplicity &multiplicity);

    FC_RoleType roleType() const;
    void setRoleType(const FC_RoleType &roleType);

    InformationAssociationCode association() const;
    void setAssociation(const InformationAssociationCode &association);

    InformationTypeCode informationType() const;
    void setInformationType(const InformationTypeCode &informationType);

private:
    Multiplicity m_multiplicity;
    FC_RoleType m_roleType;
    InformationAssociationCode m_association;
    InformationTypeCode m_informationType;
};
