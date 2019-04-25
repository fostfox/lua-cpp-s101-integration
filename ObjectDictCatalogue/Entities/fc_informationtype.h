#pragma once

#include "fc_item.h"
#include "fc_attributebinding.h"

#include <QVector>

class FC_InformationType
{
  public:
    FC_InformationType() = default;
    FC_InformationType(
            const FC_Item& header
            , const QVector<FC_AttributeBinding>& attributeBindings);

    const FC_Item &header() const;
    const QVector<FC_AttributeBinding> &attributeBindings() const;

    void setHeader(const FC_Item &header);

    void addAttributeBinding(const FC_AttributeBinding &attributeBinding);

private:
    FC_Item m_header;
    QVector<FC_AttributeBinding> m_attributeBindings;
};
