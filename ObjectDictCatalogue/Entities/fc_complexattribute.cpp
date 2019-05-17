#include "fc_complexattribute.h"

FC_ComplexAttribute::FC_ComplexAttribute(const FC_Attribute &header
        , const QVector<FC_AttributeBinding> &attributeBindings)
    :m_header(header)
     ,m_attributeBindings(attributeBindings)
{

}

const FC_Attribute &FC_ComplexAttribute::header() const
{
    return m_header;
}

const QVector<FC_AttributeBinding> &FC_ComplexAttribute::attributeBindings() const
{
    return m_attributeBindings;
}

void FC_ComplexAttribute::setHeader(const FC_Attribute &header)
{
    m_header = header;
}

void FC_ComplexAttribute::addAttributeBinding(const FC_AttributeBinding &attributeBinding)
{
    m_attributeBindings.push_back(attributeBinding);
}
