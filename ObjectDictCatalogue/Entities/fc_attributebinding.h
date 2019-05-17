#pragma once

#include "fc_attribute.h"

class FC_AttributeBinding
{
  public:
    FC_AttributeBinding() = default;
    FC_AttributeBinding(Multiplicity multiplicity
                        ,Boolean sequentional
                        ,const std::vector<ValueEnumAttrType> &permittedValues
                        ,const AttrCode &attribute);

    Multiplicity multiplicity() const;
    Boolean sequentional() const;
    const std::vector<ValueEnumAttrType>& permittedValues() const;
    const AttrCode& attributeCode() const;

    void setSequentional(const Boolean &sequentional);
    void setMultiplicity(const Multiplicity &multiplicity);
    void setAttributeCode(const AttrCode &attribute);
    void addPermittedValues(const ValueEnumAttrType &permittedValue);

private:
    Multiplicity m_multiplicity;
    Boolean m_sequentional;
    std::vector<ValueEnumAttrType> m_permittedValues; //permitter values of FC_Attribute code's
    AttrCode m_attribute;
};

