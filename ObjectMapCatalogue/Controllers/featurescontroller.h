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
    const std::string& getCodeById(const std::string &id) const;
    const Attribute &getSimpleAttribute(const std::string &id, const std::string &path, const std::string &attributeCode) const;
    const Feature &getFeatureById(const std::string &id) const;
    const Fe2spRef &getFe2spRefByRefId(const std::string &refId) const;

    bool hasSimpleAttribute(const std::string &id, const std::string &path, const std::string &attributeCode) const;
    bool hasSpatialAssotiation(const std::string &featureId) const;

    size_t getComplexAttributeSize(const std::string &featureId, const std::string &path, const std::string &attributeCode) const;

    void setSpatials(std::map<std::string, GM_Object *> SpId_to_SpatialObject);
    bool hasSpatialObject(const std::string &spatialId) const;
    GM_Object* spatialObjectByRefId(const std::string &refId) const;

private:
    std::vector<Feature> fs_;
    std::map<std::string, Feature> id_to_f_;
    std::map<std::string, Fe2spRef> refId_to_Fe2SpRef;
    std::map<std::string, GM_Object *> spId_to_SpatialObject;
};

