#include "fc_attributebinding.h"

FC_AttributeBinding::FC_AttributeBinding(Multiplicity multiplicity
        , Boolean sequentional
        , const std::vector<ValueEnumAttrType> &permittedValues
        , const AttrCode &attribute)
    :m_multiplicity(multiplicity)
    ,m_sequentional(sequentional)
    ,m_permittedValues(permittedValues)
    ,m_attribute(attribute)
{

}

Multiplicity FC_AttributeBinding::multiplicity() const
{
    return m_multiplicity;
}

Boolean FC_AttributeBinding::sequentional() const
{
    return m_sequentional;
}

const std::vector<ValueEnumAttrType> &FC_AttributeBinding::permittedValues() const
{
    return m_permittedValues;
}

const AttrCode& FC_AttributeBinding::attributeCode() const
{
    return m_attribute;
}

void FC_AttributeBinding::setSequentional(const Boolean &sequentional)
{
    m_sequentional = sequentional;
}

void FC_AttributeBinding::setMultiplicity(const Multiplicity &multiplicity)
{
    m_multiplicity = multiplicity;
}

void FC_AttributeBinding::addPermittedValues(const ValueEnumAttrType &permittedValue)
{
    m_permittedValues.push_back(permittedValue);
}

void FC_AttributeBinding::setAttributeCode(const AttrCode &attribute)
{
    m_attribute = attribute;
}
