#pragma once

#include "QVector"

#include "fc_item.h"
#include "cd_featureusetype.h"
#include "fc_spatialprimitivetype.h"
#include "fc_attributebinding.h"
#include "fc_featurebinding.h"
#include "fc_informationbinding.h"


class FC_FeatureType
{
public:
    FC_FeatureType() = default;
    FC_FeatureType(
            const FC_Item &header
            ,CD_FeatureUseType featureUseType
            ,QVector<FC_SpatialPrimitiveType> permittedPrimitives
            ,QVector<FC_AttributeBinding> attributeBindings
            ,QVector<FC_FeatureBinding> featureBindings
            ,QVector<FC_InformationBinding> informationBindings
            );

    const FC_Item& header() const;
    const CD_FeatureUseType& featureUseType() const;
    const QVector<FC_SpatialPrimitiveType>& permittedPrimitives() const;
    const QVector<FC_AttributeBinding>& attributeBindings() const;
    const QVector<FC_FeatureBinding>& featureBindings() const;
    const QVector<FC_InformationBinding>& informationBindings() const;

    void setHeader(const FC_Item &header);
    void setFeatureUseType(const CD_FeatureUseType &featureUseType);
    void addPermittedPrimitives(const FC_SpatialPrimitiveType &permittedPrimitive);
    void addAttributeBinding(const FC_AttributeBinding &attributeBinding);
    void addFeatureBinding(const FC_FeatureBinding &featureBinding);
    void addInformationBinding(const FC_InformationBinding &informationBinding);

private:
    FC_Item m_header;
    CD_FeatureUseType m_featureUseType;
    QVector<FC_SpatialPrimitiveType> m_permittedPrimitives;
    QVector<FC_AttributeBinding> m_attributeBindings;
    QVector<FC_FeatureBinding> m_featureBindings;
    QVector<FC_InformationBinding> m_informationBindings;
};
