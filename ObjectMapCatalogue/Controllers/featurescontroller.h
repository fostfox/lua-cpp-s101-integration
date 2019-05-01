#pragma once
#include <vector>
#include <string>
#include "../Entries/feature.h"
#include <map>

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

private:
    std::vector<Feature> fs_;
    std::map<std::string, Feature> id_to_f_;
    std::map<std::string, Fe2spRef> refId_to_Fe2SpRef;
};

