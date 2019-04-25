#include "fc_featuretype.h"

FC_FeatureType::FC_FeatureType(
        const FC_Item &header
        , CD_FeatureUseType featureUseType
        , QVector<FC_SpatialPrimitiveType> permittedPrimitives
        , QVector<FC_AttributeBinding> attributeBindings
        , QVector<FC_FeatureBinding> featureBindings
        , QVector<FC_InformationBinding> informationBindings
        )
    :m_header(header)
    ,m_featureUseType(featureUseType)
    ,m_permittedPrimitives(permittedPrimitives)
    ,m_attributeBindings(attributeBindings)
    ,m_featureBindings(featureBindings)
    ,m_informationBindings(informationBindings)
{

}

const FC_Item& FC_FeatureType::header() const
{
    return m_header;
}

const CD_FeatureUseType& FC_FeatureType::featureUseType() const
{
    return m_featureUseType;
}

const QVector<FC_SpatialPrimitiveType>& FC_FeatureType::permittedPrimitives() const
{
    return m_permittedPrimitives;
}

const QVector<FC_AttributeBinding>& FC_FeatureType::attributeBindings() const
{
    return m_attributeBindings;
}

const QVector<FC_FeatureBinding>& FC_FeatureType::featureBindings() const
{
    return m_featureBindings;
}

const QVector<FC_InformationBinding>& FC_FeatureType::informationBindings() const
{
    return m_informationBindings;
}

void FC_FeatureType::setHeader(const FC_Item &header)
{
    m_header = header;
}

void FC_FeatureType::setFeatureUseType(const CD_FeatureUseType &featureUseType)
{
    m_featureUseType = featureUseType;
}

void FC_FeatureType::addPermittedPrimitives(const FC_SpatialPrimitiveType &permittedPrimitive)
{
    m_permittedPrimitives.push_back(permittedPrimitive);
}

void FC_FeatureType::addAttributeBinding(const FC_AttributeBinding &attributeBinding)
{
    m_attributeBindings.push_back(attributeBinding);
}

void FC_FeatureType::addFeatureBinding(const FC_FeatureBinding &featureBinding)
{
    m_featureBindings.push_back(featureBinding);
}

void FC_FeatureType::addInformationBinding(const FC_InformationBinding &informationBinding)
{
    m_informationBindings.push_back(informationBinding);
}
