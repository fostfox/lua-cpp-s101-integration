#pragma once

#include "fc_attribute.h"
#include "cd_attributevaluetype.h"
#include "fc_listedvalue.h"
#include <QVector>

class FC_SimpleAttribute
{
  public:
    FC_SimpleAttribute() = default;
    FC_SimpleAttribute(
            FC_Attribute header
            ,CD_AttributeValueType valueType
            ,QVector<FC_ListedValue> listedValues
            );

    const FC_Attribute& header() const;
    const CD_AttributeValueType& valueType() const;
    const QVector<FC_ListedValue>& listedValues() const;

    void setHeader(const FC_Attribute &header);
    void setValueType(const CD_AttributeValueType &valueType);
    void addListedValue(const FC_ListedValue &listedValue);

private:
    FC_Attribute m_header;
    CD_AttributeValueType m_valueType;
    QVector<FC_ListedValue> m_listedValues;
};
