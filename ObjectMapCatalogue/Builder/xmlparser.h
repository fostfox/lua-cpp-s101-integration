#pragma once
#include <vector>

#include "../Entries/feature.h"
#include "../Controllers/featurescontroller.h"

class Feature;
class QXmlStreamReader;
class QFile;

class XmlParser
{
public:
    XmlParser();
};

class FeatureMapXMLBuilder
{
public:
    FeatureMapXMLBuilder(QFile * const inputFile);

    FeatureMapController build();
    std::vector<Feature> parse2();

private:
    QXmlStreamReader* m_xmlReader;
    QFile* m_inputFile;
    std::vector<Attribute> m_atr;
    std::vector<Feature> features;

private:
    std::vector<std::string> getListAttrByString(std::string strVal);
};
