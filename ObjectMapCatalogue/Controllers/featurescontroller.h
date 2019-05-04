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
    const std::string& getCodeById(std::string id) const;
    Attribute getSimpleAttribute(std::string id, std::string path, std::string attributeCode) const;
    Feature getFeatureById(std::string id) const;
    Fe2spRef getFe2spRefByRefId(std::string refId) const;

    bool hasSimpleAttribute(std::string id, std::string path, std::string attributeCode) const;
    bool hasSpatialAssotiation(std::string id) const;

    size_t getComplexAttributeSize(std::string featureId, std::string path, std::string attributeCode) const;

    void setSpatials(std::map<int, GM_Object *> SpId_to_SpatialObject);
    bool hasSpatialObject(int refId);
    GM_Object* spatialObjectByRefId(int refId);

private:
    std::vector<Feature> fs_;
    std::map<std::string, Feature> id_to_f_;
    std::map<std::string, Fe2spRef> refId_to_Fe2SpRef;
    std::map<int, GM_Object *> spId_to_SpatialObject;
};

