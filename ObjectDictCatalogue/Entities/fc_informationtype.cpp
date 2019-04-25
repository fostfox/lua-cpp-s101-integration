#include "fc_informationtype.h"

FC_InformationType::FC_InformationType(
        const FC_Item &item
        , const QVector<FC_AttributeBinding> &attributeBindings)
    :m_header(item)
    , m_attributeBindings(attributeBindings)
{

}

const FC_Item& FC_InformationType::header() const
{
    return m_header;
}

const QVector<FC_AttributeBinding>& FC_InformationType::attributeBindings() const
{
    return m_attributeBindings;
}

void FC_InformationType::setHeader(const FC_Item &header)
{
    m_header = header;
}

void FC_InformationType::addAttributeBinding(const FC_AttributeBinding &attributeBinding)
{
    m_attributeBindings.push_back(attributeBinding);
}
