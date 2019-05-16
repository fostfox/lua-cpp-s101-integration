#pragma once
#include <vector>
#include <string>
#include "../Entries/feature.h"
#include <map>
#include <Geometry/gm_object.h>

std::vector<std::pair<std::string, std::string> > getAttributeNames(std::string path);
class FeatureMapController
{
public:
    FeatureMapController();
    void setFeatures(std::vector<Feature> fs);

    std::vector<std::string> getFeaturesIDs() const;
    const std::string& getCodeById(int id) const;
    Attribute getSimpleAttribute(int id, std::string path, std::string attributeCode) const;
    Feature getFeatureById(int id) const;
    Fe2spRef getFe2spRefByRefId(int refId) const;

    bool hasSimpleAttribute(int id, std::string path, std::string attributeCode) const;
    bool hasSpatialAssotiation(int featureId) const;

    size_t getComplexAttributeSize(int featureId, std::string path, std::string attributeCode) const;

    void setSpatials(std::map<int, GM_Object *> SpId_to_SpatialObject);
    bool hasSpatialObject(int spatialId) const;
    GM_Object* spatialObjectByRefId(int refId) const;

private:
    std::vector<Feature> fs_;
    std::map<int, Feature> id_to_f_;
    std::map<int, Fe2spRef> refId_to_Fe2SpRef;
    std::map<int, GM_Object *> spId_to_SpatialObject;
};

