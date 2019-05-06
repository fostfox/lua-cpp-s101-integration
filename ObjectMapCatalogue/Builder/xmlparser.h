#pragma once
#include <vector>

#include "../Entries/feature.h"
#include "../Controllers/featurescontroller.h"
#include "../../Geometry/gm_object.h"
#include "../../Geometry/gm_point.h"
#include "../../Geometry/gm_compositecurve.h"
#include "../../Geometry/gm_curve.h"
#include "../../Geometry/gm_multipoint.h"
#include "../../Geometry/gm_curvesegment.h"
#include "../../Geometry/gm_surface.h"


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

    FeatureMapController build(bool onlyFullFeatures = false);
    std::vector<Feature> parse2();
    std::map<std::string, GM_Object *> parseSpatials();
    bool isStartElementAndAllowed(std::string tag);

    GM_Object *buildIsolatedPoint();
    GM_Object *buildSurface();
    GM_Object *buildCompositeEdge();
    GM_Object *buildEdge();
    Fe2spRef buildFe2Sp();
    Fe2spRef buildExteriorRing();

private:
    QXmlStreamReader* m_xmlReader;
    QXmlStreamReader* m_xmlSpatial;
    QFile* m_inputFile;
    std::vector<Attribute> m_atr;
    std::vector<Feature> features;

private:
    std::vector<std::string> getListAttrByString(std::string strVal);
    std::map<std::string, GM_Object *> m_SpId_to_SpatialObject;
};
