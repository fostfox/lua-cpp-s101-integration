#include "fc_informationbinding.h"

FC_InformationBinding::FC_InformationBinding(const Multiplicity &multiplicity
        , const FC_RoleType &roleType
        , const FC_InformationAssociation &associationRef
        , const InformationTypeCode &informationType, const FC_Role &roleRef)
    :m_multiplicity(multiplicity)
    ,m_roleType(roleType)
    ,m_associationRef(associationRef)
    ,m_informationType(informationType)
    ,m_roleRef(roleRef)
{
    m_association = associationRef.header().code();
}

const Multiplicity &FC_InformationBinding::multiplicity() const
{
    return m_multiplicity;
}

void FC_InformationBinding::setMultiplicity(const Multiplicity &multiplicity)
{
    m_multiplicity = multiplicity;
}

const FC_RoleType &FC_InformationBinding::roleType() const
{
    return m_roleType;
}

void FC_InformationBinding::setRoleType(const FC_RoleType &roleType)
{
    m_roleType = roleType;
}

const InformationAssociationCode &FC_InformationBinding::association() const
{
    return m_association;
}

void FC_InformationBinding::setAssociationRef(const FC_InformationAssociation &associationRef)
{
    m_association = associationRef.header().code();
    m_associationRef = associationRef;
}

const InformationTypeCode &FC_InformationBinding::informationType() const
{
    return m_informationType;
}

void FC_InformationBinding::setInformationType(const InformationTypeCode &informationType)
{
    m_informationType = informationType;
}

const FC_Role &FC_InformationBinding::roleRef() const
{
    return m_roleRef;
}

void FC_InformationBinding::setRoleRef(const FC_Role &roleRef)
{
    m_roleRef = roleRef;
}

const FC_InformationAssociation &FC_InformationBinding::associationRef() const
{
    return m_associationRef;
}
