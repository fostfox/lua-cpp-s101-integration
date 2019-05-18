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
    ~FeatureMapXMLBuilder();


    FeatureMapController build(bool onlyFullFeatures = false);
    const std::list<Feature>& parse2();
    const std::map<int, std::shared_ptr<GM_Object> >& parseSpatials();
    bool isStartElementAndAllowed(std::string tag);

    std::shared_ptr<GM_Object> buildIsolatedPoint();
    std::shared_ptr<GM_Object> buildSurface();
    std::shared_ptr<GM_Object> buildCompositeEdge();
    std::shared_ptr<GM_Object> buildEdge();
    Fe2spRef buildFe2Sp();
    Fe2spRef buildExteriorRing();

private:
    QXmlStreamReader* m_xmlReader;
    QXmlStreamReader* m_xmlSpatial;
    QFile* m_inputFile;
    std::vector<Attribute> m_atr;
    std::list<Feature> features;

private:
    std::vector<std::string> getListAttrByString(std::string strVal);
    std::map<int, std::shared_ptr<GM_Object>> m_SpId_to_SpatialObject;
};
