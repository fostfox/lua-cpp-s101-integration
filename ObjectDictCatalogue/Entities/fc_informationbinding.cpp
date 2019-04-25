#include "fc_informationbinding.h"

FC_InformationBinding::FC_InformationBinding(
        Multiplicity multiplicity
        , FC_RoleType roleType
        , InformationAssociationCode association
        , InformationTypeCode informationType)
    :m_multiplicity(multiplicity)
    ,m_roleType(roleType)
    ,m_association(association)
    ,m_informationType(informationType)
{

}

Multiplicity FC_InformationBinding::multiplicity() const
{
    return m_multiplicity;
}

void FC_InformationBinding::setMultiplicity(const Multiplicity &multiplicity)
{
    m_multiplicity = multiplicity;
}

FC_RoleType FC_InformationBinding::roleType() const
{
    return m_roleType;
}

void FC_InformationBinding::setRoleType(const FC_RoleType &roleType)
{
    m_roleType = roleType;
}

InformationAssociationCode FC_InformationBinding::association() const
{
    return m_association;
}

void FC_InformationBinding::setAssociation(const InformationAssociationCode &association)
{
    m_association = association;
}

InformationTypeCode FC_InformationBinding::informationType() const
{
    return m_informationType;
}

void FC_InformationBinding::setInformationType(const InformationTypeCode &informationType)
{
    m_informationType = informationType;
}
