#pragma once

#include "../Controllers/featurecataloguecontroller.h"

#include <QFile>
#include <QXmlStreamReader>


class FeatureCatalogueXMLBuilder
{
  public:
    FeatureCatalogueXMLBuilder();

    FeatureCatalogueController build(QFile* xmlPath);

  private:
    bool isStartElementAndAllowed(std::string tag);
    void printErrorIfHapend();
    std::string readAttrValue(QString tag); //возвращает value

    inline void readNext1(QXmlStreamReader *reader);
    inline void readNext2(QXmlStreamReader *reader);

     FC_SimpleAttribute         buildSimpleAttribute();
     FC_ComplexAttribute        buildComplexAttribute();
     FC_FeatureType             buildFeatureType();
     FC_Role                    buildRole();
     FC_InformationType         buildInformationType();
     FC_FeatureAssociation      buildFeatureAssociation();
     FC_InformationAssociation  buildInformationAssociation();

     FC_Item                    buildItem();
     CD_AttributeValueType      buildAttributeValueType();
     FC_ListedValue             buildListedValue();
     FC_AttributeBinding        buildAttributeBinding();
     FC_FeatureBinding          buildFeatureBinding();
     FC_InformationBinding      buildInformationBinding();

     Multiplicity               buildMultiplicity();
  private:
    QFile m_xmlFile;
    QXmlStreamReader reader;
    FeatureCatalogueController fc_controller;
};
