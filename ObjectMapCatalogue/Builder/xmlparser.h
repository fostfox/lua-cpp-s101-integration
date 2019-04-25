#pragma once
#include <vector>
#include <QDataStream>

#include "../Entries/feature.h"

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

    std::vector<Feature> parse2();

private:
    QXmlStreamReader* m_xmlReader;
    QFile* m_inputFile;
    std::vector<Attribute> m_atr;
    std::vector<Feature> features;
};
