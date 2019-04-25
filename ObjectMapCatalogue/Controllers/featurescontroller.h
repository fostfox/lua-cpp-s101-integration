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
    std::vector<std::string> getFeaturesIDs();
    std::string getCodeById(std::string id);
    Attribute getSimpleAttribute(std::string id, std::string path);

private:
    std::vector<Feature> fs_;
    std::map<std::string, Feature> id_to_f_;

};

