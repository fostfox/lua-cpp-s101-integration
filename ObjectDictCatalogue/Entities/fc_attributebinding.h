#pragma once

#include "../DataTypes/datatypes.h"
#include "fc_listedvalue.h"
#include "fc_attribute.h"

class FC_AttributeBinding
{
  public:
    FC_AttributeBinding() = default;
    FC_AttributeBinding(Multiplicity multiplicity
                        ,Boolean sequentional
                        ,const QVector<ValueEnumAttrType> &permittedValues
                        ,const QVector<AttrCode> &attribute);

    Multiplicity multiplicity() const;
    Boolean sequentional() const;
    QVector<ValueEnumAttrType> permittedValues() const;
    QVector<AttrCode> attributeCode() const;

    void setSequentional(const Boolean &sequentional);
    void setMultiplicity(const Multiplicity &multiplicity);
    void addPermittedValues(const ValueEnumAttrType &permittedValue);
    void addAttributeCode(const AttrCode &attribute);

private:
    Multiplicity m_multiplicity;
    Boolean m_sequentional;
    QVector<ValueEnumAttrType> m_permittedValues; //permitter values of FC_Attribute code's
    QVector<AttrCode> m_attribute;
};

