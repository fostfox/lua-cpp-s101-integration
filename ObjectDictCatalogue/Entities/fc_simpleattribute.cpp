#include "fc_simpleattribute.h"

FC_SimpleAttribute::FC_SimpleAttribute(const FC_Attribute &header
        , const CD_AttributeValueType &valueType
        , const QVector<FC_ListedValue> &listedValues)
    :m_header(header)
    ,m_valueType(valueType)
    ,m_listedValues(listedValues)
{

}

const FC_Attribute& FC_SimpleAttribute::header() const
{
    return m_header;
}

const CD_AttributeValueType& FC_SimpleAttribute::valueType() const
{
    return m_valueType;
}

const QVector<FC_ListedValue>& FC_SimpleAttribute::listedValues() const
{
    return m_listedValues;
}

void FC_SimpleAttribute::setHeader(const FC_Attribute &header)
{
    m_header = header;
}

void FC_SimpleAttribute::setValueType(const CD_AttributeValueType &valueType)
{
    m_valueType = valueType;
}

void FC_SimpleAttribute::addListedValue(const FC_ListedValue &listedValue)
{
    m_listedValues.push_back(listedValue);
}
