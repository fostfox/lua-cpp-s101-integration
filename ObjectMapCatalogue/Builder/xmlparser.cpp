#include "xmlparser.h"

#include <QXmlStreamReader>
#include <QFile>
#include <QTextStream>
#include <QMap>
#include <iostream>
#include <sstream>

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
    m_xmlSpatial = new QXmlStreamReader(inputFile);
}

FeatureMapXMLBuilder::~FeatureMapXMLBuilder()
{
    delete m_xmlReader;
    delete m_xmlSpatial;
}

FeatureMapController FeatureMapXMLBuilder::build(bool onlyFullFeatures)
{
    auto spatials = parseSpatials();

    m_inputFile->close();
    m_inputFile->open(QIODevice::ReadOnly);
    m_xmlReader->setDevice(m_inputFile);

    auto features = parse2();
    if (onlyFullFeatures) {
        std::vector<Feature> tmpFeatures;
        for (auto f : features){
            if (f.fe2spRef().refId() != -1){
                tmpFeatures.push_back(f);
            }
        }
        features.clear();
        features = tmpFeatures;
    }
    FeatureMapController fFontroller;
    fFontroller.setFeatures(features);
    fFontroller.setSpatials(spatials);
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
            do{

            // complex
            ComplexAttribute complexAttr;
            readNext2(m_xmlReader);
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

            } while (m_xmlReader->name() != "complex_attrs");
            readNext2(m_xmlReader);

            //if (typeOfAttrs == "code") goto fixComplex;

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

            fe2spRef.setSpatial(m_xmlReader->name().toString().toStdString());

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
        #ifdef DEBUG_OUT_ENABLE
            qDebug(("Some error: " + m_xmlReader->errorString()).toLocal8Bit().data());
        #endif
        throw m_inputFile->fileName();
    }
    return features;
}

enum ParserTags {isolated_point, edge, composite_edge, surface,
                lat, lon, ref_id, ref_type, orientation, interior, index, sp2sp_ref,
                geo_points, geo_point};

const static QMap<std::string, ParserTags> strTagToParserTags=  {
    { "isolated_point",         isolated_point },
    { "edge",                   edge },
    { "composite_edge",         composite_edge },
    { "surface",                surface },

    { "lat",                    lat },
    { "lon",                    lon },

    { "ref_id",                    ref_id },
    { "ref_type",                    ref_type },
    { "orientation",                    orientation },
    { "interior",                    interior },

    { "index",                    index },
    { "sp2sp_ref",                    sp2sp_ref },

    { "geo_points",                    geo_points },
    { "geo_point",                    geo_point }
};

bool FeatureMapXMLBuilder::isStartElementAndAllowed(std::string tag)
{
    return m_xmlSpatial->isStartElement() && strTagToParserTags.contains(tag);
}

std::shared_ptr<GM_Object> FeatureMapXMLBuilder::buildIsolatedPoint()
{
    // MUST BE
    int index = m_xmlSpatial->readElementText().toInt();
    readNext2(m_xmlSpatial);
    std::string lat = m_xmlSpatial->readElementText().toStdString();
    readNext2(m_xmlSpatial);
    std::string lon = m_xmlSpatial->readElementText().toStdString();
    m_SpId_to_SpatialObject[index] = std::make_shared<GM_Point>(GM_Point(lat, lon));
    return std::static_pointer_cast<GM_Object>(std::make_shared<GM_Point>(GM_Point(lat, lon)));
}

std::shared_ptr<GM_Object> FeatureMapXMLBuilder::buildSurface()
{
    int index = m_xmlSpatial->readElementText().toInt();
    readNext2(m_xmlSpatial);
    std::shared_ptr<GM_Surface> surf = std::make_shared<GM_Surface>();
    while(!(m_xmlSpatial->name().toString().toStdString() == "surface" && m_xmlSpatial->isEndElement())){
        if (m_xmlSpatial->name().toString().toStdString() == "sp2sp_ref" && m_xmlSpatial->isStartElement()){
            m_xmlSpatial->readNextStartElement();
            Fe2spRef ring = buildFe2Sp();
            int interior = m_xmlSpatial->readElementText().toInt();
            if (!surf->hasExteriorRing()){
                surf->setExteriorRing(ring);
            }
            else{
                surf->addInteriorRing(ring);
            }
            m_xmlSpatial->readNextStartElement();
            if (m_xmlSpatial->name().toString().toStdString() == "composite_edge" && m_xmlSpatial->isStartElement()){
                m_xmlSpatial->readNextStartElement();
                buildCompositeEdge();
            }
            else if (m_xmlSpatial->name().toString().toStdString() == "edge" && m_xmlSpatial->isStartElement()){
                m_xmlSpatial->readNextStartElement();
                buildEdge();
            }

        }
        readNext1(m_xmlSpatial);
    }
    m_SpId_to_SpatialObject[index] = surf;
    return surf;
}

std::shared_ptr<GM_Object> FeatureMapXMLBuilder::buildCompositeEdge()
{
    // MUST BE
    int index = m_xmlSpatial->readElementText().toInt();
    readNext2(m_xmlSpatial);
    std::shared_ptr<GM_CompositeCurve> curv = std::make_shared<GM_CompositeCurve>();
    while(!(m_xmlSpatial->name().toString().toStdString() == "composite_edge" && m_xmlSpatial->isEndElement())){
        if (m_xmlSpatial->name().toString().toStdString() == "sp2sp_ref" && m_xmlSpatial->isStartElement()){
            m_xmlSpatial->readNextStartElement();
            Fe2spRef ring = buildFe2Sp();
            int interior = m_xmlSpatial->readElementText().toInt();
            curv->addCurveAssotiation(ring);
            m_xmlSpatial->readNextStartElement();
            if (m_xmlSpatial->name().toString().toStdString() == "composite_edge" && m_xmlSpatial->isStartElement()){
                m_xmlSpatial->readNextStartElement();
                buildCompositeEdge();
            }
            else if (m_xmlSpatial->name().toString().toStdString() == "edge" && m_xmlSpatial->isStartElement()){
                m_xmlSpatial->readNextStartElement();
                buildEdge();
            }

        }
        readNext1(m_xmlSpatial);
    }
    m_SpId_to_SpatialObject[index] = curv;
//    if (index == 331){
//        std::cout << "!";
//    }
    return std::static_pointer_cast<GM_Object>(curv);
}

std::shared_ptr<GM_Object> FeatureMapXMLBuilder::buildEdge()
{
    int index = m_xmlSpatial->readElementText().toInt();
    readNext2(m_xmlSpatial);
    std::shared_ptr<GM_Curve> curv = std::make_shared<GM_Curve>();
    GM_CurveSegment seg;
    while(!(m_xmlSpatial->name().toString().toStdString() == "edge" && m_xmlSpatial->isEndElement())){
        if (m_xmlSpatial->name().toString().toStdString() == "geo_point" && m_xmlSpatial->isStartElement()){
            m_xmlSpatial->readNextStartElement();
            std::string lat = m_xmlSpatial->readElementText().toStdString();
            readNext2(m_xmlSpatial);
            std::string lon = m_xmlSpatial->readElementText().toStdString();
            GM_Point p(lat, lon);
            seg.addControlPoint(p);
        }
        readNext1(m_xmlSpatial);
    }
    curv->setStartPoint(seg.controlPoints()[0]);
    curv->setEndPoint(seg.controlPoints()[seg.controlPoints().size() - 1]);
    curv->setSegments(QVector<GM_CurveSegment>{ seg });

    m_SpId_to_SpatialObject[index] = curv;
    return std::static_pointer_cast<GM_Object>(curv);
}

Fe2spRef FeatureMapXMLBuilder::buildFe2Sp()
{
    Fe2spRef fe2spRef;
    // ref_id
    fe2spRef.setRefId(m_xmlSpatial->readElementText().toInt());
    readNext2(m_xmlSpatial);

    // ref_type
    fe2spRef.setRefType(m_xmlSpatial->readElementText().toInt());
    readNext2(m_xmlSpatial);

    // orientation
    fe2spRef.setOrientation(m_xmlSpatial->readElementText().toInt());
    readNext2(m_xmlSpatial);

    return fe2spRef;
}

Fe2spRef FeatureMapXMLBuilder::buildExteriorRing()
{
    return Fe2spRef();
}

//GM_Object *FeatureMapXMLBuilder::buildIsolatedPoint()
//{
//    int lat = m_xmlSpatial->readElementText().toInt();
//    int lon = m_xmlSpatial->readElementText().toInt();
//    return new GM_Point(lat, lon);
//}



const std::map<int, std::shared_ptr<GM_Object> > &FeatureMapXMLBuilder::parseSpatials()
{
    while (!m_xmlSpatial->atEnd()){
        const std::string &tag = m_xmlSpatial->name().toString().toStdString();
        if (isStartElementAndAllowed(tag)){
            switch (strTagToParserTags[tag]) {
                case isolated_point : {
                    m_xmlSpatial->readNextStartElement(); // readNext1
                    auto obj = buildIsolatedPoint();
                } break;
                case surface : {
                    m_xmlSpatial->readNextStartElement(); // readNext1
                    auto obj = buildSurface();
                } break;
            case edge : {
                m_xmlSpatial->readNextStartElement(); // readNext1
                auto obj = buildEdge();
            } break;
            case composite_edge : {
                m_xmlSpatial->readNextStartElement(); // readNext1
                auto obj = buildCompositeEdge();
            } break;
            default:
                readNext1(m_xmlSpatial);
            }
        }
        else{
            readNext1(m_xmlSpatial);
        }
    }
    if (m_xmlSpatial->error()){
#ifdef DEBUG_OUT_ENABLE
        qDebug(("Some error: " + m_xmlSpatial->errorString()).toLocal8Bit().data());
#endif
    }
    return m_SpId_to_SpatialObject;
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

