#include "fc_informationbinding.h"

FC_InformationBinding::FC_InformationBinding(Multiplicity multiplicity
        , FC_RoleType roleType
        , FC_InformationAssociation associationRef
        , InformationTypeCode informationType)
    :m_multiplicity(multiplicity)
    ,m_roleType(roleType)
    ,m_associationRef(associationRef)
    ,m_informationType(informationType)
{
    m_association = associationRef.header().code();
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

void FC_InformationBinding::setAssociationRef(const FC_InformationAssociation &associationRef)
{
    m_association = associationRef.header().code();
    m_associationRef = associationRef;
}

InformationTypeCode FC_InformationBinding::informationType() const
{
    return m_informationType;
}

void FC_InformationBinding::setInformationType(const InformationTypeCode &informationType)
{
    m_informationType = informationType;
}

const FC_InformationAssociation &FC_InformationBinding::associationRef() const
{
    return m_associationRef;
}
