#pragma once

#include "fc_attribute.h"
#include "fc_attributebinding.h"

#include <QVector>


class FC_ComplexAttribute
{
public:
    FC_ComplexAttribute() = default;
    FC_ComplexAttribute(
            FC_Attribute header
            ,QVector<FC_AttributeBinding> attributeBindings
    );

    const FC_Attribute& header() const;
    const QVector<FC_AttributeBinding>& attributeBindings() const;

    void setHeader(const FC_Attribute &header);

    void addAttributeBinding(const FC_AttributeBinding &attributeBinding);

private:
    FC_Attribute m_header;
    QVector<FC_AttributeBinding> m_attributeBindings;
};

