#include "xmlparser.h"

#include <QXmlStreamReader>
#include <QFile>
#include <QTextStream>
#include <QMap>
#include <QDebug>
#include <iostream>


inline bool isStartElement(QXmlStreamReader *reader)
{
    return reader->tokenType() == QXmlStreamReader::StartElement;
}

inline void readNext2(QXmlStreamReader *reader){
    reader->readNext();
    reader->readNext();
}
inline void readNext1(QXmlStreamReader *reader){
    reader->readNext();
}

FeatureMapXMLBuilder::FeatureMapXMLBuilder(QFile * const inputFile)
{
    m_inputFile = inputFile;
    m_xmlReader = new QXmlStreamReader(inputFile);
}

FeatureMapController FeatureMapXMLBuilder::build()
{
    auto v = parse2();
    FeatureMapController fFontroller;
    fFontroller.setFeatures(v);
    return fFontroller;
}


std::vector<Feature> FeatureMapXMLBuilder::parse2()
{
    std::string typeOfAttrs;

    while (!m_xmlReader->atEnd()){
        #ifdef QT_DEBUG
            //std::cout << "-";
        #endif

        typeOfAttrs = m_xmlReader->name().toString().toStdString();
        Feature feature;
        if (typeOfAttrs == "features" && isStartElement(m_xmlReader)){
            readNext2(m_xmlReader);

            // ID
            feature.setId(m_xmlReader->readElementText().toInt());
            readNext2(m_xmlReader);

            // Class
            feature.setClass(m_xmlReader->readElementText().toInt());
            readNext2(m_xmlReader);

            //  Class alias
            feature.setClassAlias(m_xmlReader->readElementText().toStdString());
            readNext2(m_xmlReader);

            // TAG NAME AFTER </ClassAlias>
            typeOfAttrs = m_xmlReader->name().toString().toStdString();
            readNext2(m_xmlReader);

            if (typeOfAttrs == "int_attrs"){
            do {
                Attribute attr;
                attr.setType(Attribute::AttrTypes::INT);
                readNext2(m_xmlReader);
                attr.setCode(m_xmlReader->readElementText().toInt());
                readNext2(m_xmlReader);
                attr.setAlias(m_xmlReader->readElementText().toStdString());
                readNext2(m_xmlReader);
                std::vector<std::string> val = {m_xmlReader->readElementText().toStdString()};
                attr.setValue(val);

                feature.addIntAttr(attr);

                readNext2(m_xmlReader);
                readNext2(m_xmlReader);
            } while (m_xmlReader->name() != "int_attrs");
            readNext2(m_xmlReader);

            // TAG NAME AFTER </int_attrs>
            typeOfAttrs = m_xmlReader->name().toString().toStdString();
            readNext2(m_xmlReader);
            }

            if (typeOfAttrs == "double_attrs"){
            do {
                Attribute attr;
                attr.setType(Attribute::AttrTypes::DOUBLE);
                readNext2(m_xmlReader);
                attr.setCode(m_xmlReader->readElementText().toInt());
                readNext2(m_xmlReader);
                attr.setAlias(m_xmlReader->readElementText().toStdString());
                readNext2(m_xmlReader);
                std::vector<std::string> val = {m_xmlReader->readElementText().toStdString()};
                attr.setValue(val);

                feature.addIntAttr(attr);

                readNext2(m_xmlReader);
                readNext2(m_xmlReader);
            } while (m_xmlReader->name() != "double_attrs");
            readNext2(m_xmlReader);

            // TAG NAME AFTER </double_attrs>
            typeOfAttrs = m_xmlReader->name().toString().toStdString();
            readNext2(m_xmlReader);
            }

            if (typeOfAttrs == "string_attrs"){
            do {
                Attribute attr;
                attr.setType(Attribute::AttrTypes::STRING);
                readNext2(m_xmlReader);
                attr.setCode(m_xmlReader->readElementText().toInt());
                readNext2(m_xmlReader);
                attr.setAlias(m_xmlReader->readElementText().toStdString());
                readNext2(m_xmlReader);
                std::vector<std::string> val = {m_xmlReader->readElementText().toStdString()};
                attr.setValue(val);

                feature.addIntAttr(attr);

                readNext2(m_xmlReader);
                readNext2(m_xmlReader);
            } while (m_xmlReader->name() != "string_attrs");
            readNext2(m_xmlReader);

            // TAG NAME AFTER </string_attrs>
            typeOfAttrs = m_xmlReader->name().toString().toStdString();
            readNext2(m_xmlReader);
            }


            if (typeOfAttrs == "list_attrs"){
            do {
                Attribute attr;
                attr.setType(Attribute::AttrTypes::LIST);
                readNext2(m_xmlReader);
                attr.setCode(m_xmlReader->readElementText().toInt());
                readNext2(m_xmlReader);
                attr.setAlias(m_xmlReader->readElementText().toStdString());
                readNext2(m_xmlReader);
                std::vector<std::string> vals = getListAttrByString(m_xmlReader->readElementText().toStdString());
                attr.setValue(vals);

                feature.addIntAttr(attr);

                readNext2(m_xmlReader);
                readNext2(m_xmlReader);
            } while (m_xmlReader->name() != "list_attrs");
            readNext2(m_xmlReader);

            // TAG NAME AFTER </list_attrs>
            typeOfAttrs = m_xmlReader->name().toString().toStdString();
            readNext2(m_xmlReader);
            }


            if (typeOfAttrs == "complex_attrs"){
            // complex
            ComplexAttribute complexAttr;

            // Code
            complexAttr.setCode(m_xmlReader->readElementText().toInt());
            readNext2(m_xmlReader);

            // Alias
            complexAttr.setAlias(m_xmlReader->readElementText().toStdString());
            readNext2(m_xmlReader);

            // TAG NAME AFTER </complex_attrs::Alias>
            typeOfAttrs = m_xmlReader->name().toString().toStdString();
            readNext2(m_xmlReader);

            if (typeOfAttrs == "int_attrs"){
            do {
                Attribute attr;
                attr.setType(Attribute::AttrTypes::INT);
                readNext2(m_xmlReader);
                attr.setCode(m_xmlReader->readElementText().toInt());
                readNext2(m_xmlReader);
                attr.setAlias(m_xmlReader->readElementText().toStdString());
                readNext2(m_xmlReader);
                std::vector<std::string> val = {m_xmlReader->readElementText().toStdString()};
                attr.setValue(val);

                complexAttr.addAttribute(attr);

                readNext2(m_xmlReader);
                readNext2(m_xmlReader);
            } while (m_xmlReader->name() != "int_attrs");
            readNext2(m_xmlReader);

            // TAG NAME AFTER </complex_attrs::int_attrs>
            typeOfAttrs = m_xmlReader->name().toString().toStdString();
            readNext2(m_xmlReader);
            }

            if (typeOfAttrs == "double_attrs"){
            do {
                Attribute attr;
                attr.setType(Attribute::AttrTypes::DOUBLE);
                readNext2(m_xmlReader);
                attr.setCode(m_xmlReader->readElementText().toInt());
                readNext2(m_xmlReader);
                attr.setAlias(m_xmlReader->readElementText().toStdString());
                readNext2(m_xmlReader);
                std::vector<std::string> val = {m_xmlReader->readElementText().toStdString()};
                attr.setValue(val);

                complexAttr.addAttribute(attr);

                readNext2(m_xmlReader);
                readNext2(m_xmlReader);
            } while (m_xmlReader->name() != "double_attrs");
            readNext2(m_xmlReader);

            // TAG NAME AFTER </complex_attrs::double_attrs>
            typeOfAttrs = m_xmlReader->name().toString().toStdString();
            readNext2(m_xmlReader);
            }

            if (typeOfAttrs == "string_attrs"){
            do {
                Attribute attr;
                attr.setType(Attribute::AttrTypes::STRING);
                readNext2(m_xmlReader);
                attr.setCode(m_xmlReader->readElementText().toInt());
                readNext2(m_xmlReader);
                attr.setAlias(m_xmlReader->readElementText().toStdString());
                readNext2(m_xmlReader);
                std::vector<std::string> val = {m_xmlReader->readElementText().toStdString()};
                attr.setValue(val);

                complexAttr.addAttribute(attr);

                readNext2(m_xmlReader);
                readNext2(m_xmlReader);
            } while (m_xmlReader->name() != "string_attrs");
            readNext2(m_xmlReader);

            // TAG NAME AFTER </complex_attrs::string_attrs>
            typeOfAttrs = m_xmlReader->name().toString().toStdString();
            readNext2(m_xmlReader);
            }


            if (typeOfAttrs == "list_attrs"){
            do {
                Attribute attr;
                attr.setType(Attribute::AttrTypes::LIST);
                readNext2(m_xmlReader);
                attr.setCode(m_xmlReader->readElementText().toInt());
                readNext2(m_xmlReader);
                attr.setAlias(m_xmlReader->readElementText().toStdString());
                readNext2(m_xmlReader);
                std::vector<std::string> val = getListAttrByString(m_xmlReader->readElementText().toStdString());
                attr.setValue(val);

                complexAttr.addAttribute(attr);

                readNext2(m_xmlReader);
                readNext2(m_xmlReader);
            } while (m_xmlReader->name() != "list_attrs");
            readNext2(m_xmlReader);

            // TAG NAME AFTER </complex_attrs::list_attrs>
            typeOfAttrs = m_xmlReader->name().toString().toStdString();
            readNext2(m_xmlReader);
            }


            feature.addComplexAttr(complexAttr);

            // TAG NAME AFTER </complex_attrs>
            typeOfAttrs = m_xmlReader->name().toString().toStdString();
            readNext2(m_xmlReader);
            }

            if (typeOfAttrs == "fe2sp_ref"){
            // fe2sp_ref
            Fe2spRef fe2spRef;

            // ref_id
            fe2spRef.setRefId(m_xmlReader->readElementText().toInt());
            readNext2(m_xmlReader);

            // ref_type
            fe2spRef.setRefType(m_xmlReader->readElementText().toInt());
            readNext2(m_xmlReader);

            // orientation
            fe2spRef.setOrientation(m_xmlReader->readElementText().toInt());
            readNext2(m_xmlReader);

            // scamin
            fe2spRef.setScamin(m_xmlReader->readElementText().toInt());
            readNext2(m_xmlReader);

            // scamax
            fe2spRef.setScamax(m_xmlReader->readElementText().toInt());
            readNext2(m_xmlReader);

            feature.setFe2spRef(fe2spRef);

            // SKIP EXTRA INFORMATION OF fe2sp_ref
            while(m_xmlReader->name() != "fe2sp_ref"){
                readNext1(m_xmlReader);
            }

            }

            // SKIP fe2fe_association
            if (typeOfAttrs == "fe2fe_association"){
                readNext2(m_xmlReader);
                while(m_xmlReader->name() != "fe2fe_association"){
                    readNext1(m_xmlReader);
                }
                //m_xmlReader->skipCurrentElement();

                readNext2(m_xmlReader);
                typeOfAttrs = m_xmlReader->name().toString().toStdString();
                readNext2(m_xmlReader);
            }
            features.push_back(feature);
        }
         readNext1(m_xmlReader);
    }
    if (m_xmlReader->error()){  
        #ifdef QT_DEBUG
            qDebug() << "Some error: " + m_xmlReader->errorString();
        #endif
        throw "Some error";
    }
    return features;
}

std::vector<std::string> FeatureMapXMLBuilder::getListAttrByString(std::string strVal)
{
    std::vector<std::string> words;
    std::istringstream ist(strVal);
    std::string tmp;
    while ( ist >> tmp ) {
        words.push_back(tmp);
    }
    for (unsigned int i = 0; i < words.size() - 1; ++i){
        words[i][words[i].size() - 1] = '\0';
    }
    return words;
}

