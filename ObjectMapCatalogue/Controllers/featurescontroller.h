#pragma once
#include <vector>
#include <list>
#include <string>
#include "../Entries/feature.h"
#include <map>
#include <Geometry/gm_object.h>

#include <memory>

std::vector<std::pair<std::string, std::string> > getAttributeNames(const std::string &path);
class FeatureMapController
{
public:
    FeatureMapController();
    void setFeatures(const std::list<Feature>& fs);

    const std::vector<std::string> &getFeaturesIDs() const;
    const std::string& getCodeById(int id) const;
    const Attribute& getSimpleAttribute(int id, const std::string &path, const std::string &attributeCode) const;
    const Feature& getFeatureById(int id) const;
    const Fe2spRef& getFe2spRefByRefId(int refId) const;

    bool hasSimpleAttribute(int id, const std::string &path, const std::string &attributeCode) const;
    bool hasSpatialAssotiation(int featureId) const;

    size_t getComplexAttributeSize(int featureId, const std::string &path, const std::string &attributeCode) const;

    void setSpatials(const std::map<int, std::shared_ptr<GM_Object>>& SpId_to_SpatialObject);
    bool hasSpatialObject(int spatialId) const;
    std::shared_ptr<GM_Object> spatialObjectByRefId(int refId) const;

private:
    std::vector<std::string> fsIDs_;
    std::list<Feature> fs_;
    std::map<int, Feature> id_to_f_;
    std::map<int, Fe2spRef> refId_to_Fe2SpRef;
    std::map<int, std::shared_ptr<GM_Object>> spId_to_SpatialObject;
};

