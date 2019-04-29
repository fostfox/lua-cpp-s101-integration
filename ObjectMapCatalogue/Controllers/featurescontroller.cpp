#include "featurescontroller.h"
#include <assert.h>

std::vector<std::pair<std::string, std::string> > getAttributeNames(std::string path){
    std::string s = path;
    std::string semicolon = ";";
    std::string colon = ":";
    std::vector<std::pair<std::string, std::string> > attrsFull;

    size_t pos = 0, pos2 = 0;
    std::string token, nameToken, valToken;
    while ((pos = s.find(semicolon)) != std::string::npos) {
        token = s.substr(0, pos);
        pos2 = token.find(colon);
        nameToken = token.substr(0, pos2);
        valToken = token.substr(pos2 + 1, token.size());
        attrsFull.push_back(std::make_pair(nameToken, valToken));
        s.erase(0, pos + semicolon.length());
    }
    pos2 = s.find(colon);
    nameToken = s.substr(0, pos2);
    valToken = s.substr(pos2 + 1, s.size());
    attrsFull.push_back(std::make_pair(nameToken, valToken));

    return attrsFull;
}

FeatureMapController::FeatureMapController()
{

}

void FeatureMapController::setFeatures(std::vector<Feature> fs)
{
    fs_ = fs;
    for (auto f : fs){
        id_to_f_.insert(std::make_pair(std::to_string(f.id()), f));
        if (f.fe2spRef().refId() != -1)
            refId_to_Fe2SpRef.insert(std::make_pair(std::to_string(f.fe2spRef().refId()), f.fe2spRef()));
    }
}

std::vector<std::string> FeatureMapController::getFeaturesIDs() const
{
    std::vector<std::string> ids;
    for (auto f : fs_){
        ids.push_back(std::to_string(f.id()));
    }
    return ids;
}

const std::string &FeatureMapController::getCodeById(std::string id) const
{
    return id_to_f_.at(id).classAlias();
}

Attribute FeatureMapController::getSimpleAttribute(std::string id, std::string path, std::string attrCode) const
{
    Feature f = id_to_f_.at(id);
    std::vector<std::pair<std::string, std::string> > attrsFull
            = getAttributeNames(path);

    ComplexAttribute cAttr;
    Attribute attr;
    // такая реализация пока что, так как у нас в xml complex содержит только simple
    if (attrsFull.size() == 2){
        cAttr = f.getComplexAttributeByCode(attrsFull[0].first);
        attr = cAttr.getAttributeByCode(attrCode);
    }
    else if (attrsFull.size() == 1){
        attr = f.getAttributeByCode(attrCode);
    }
    else{
        assert(false);
    }

    return attr;
}

Feature FeatureMapController::getFeatureById(std::string id) const
{
    return id_to_f_.at(id);
}

Fe2spRef FeatureMapController::getFe2spRefByRefId(std::string refId) const
{
    return refId_to_Fe2SpRef.at(refId);
}

bool FeatureMapController::hasSimpleAttribute(std::string id, std::string path, std::string attributeCode) const
{
    Feature f = id_to_f_.at(id);
    std::vector<std::pair<std::string, std::string> > attrsFull
            = getAttributeNames(path);

    ComplexAttribute cAttr;
    Attribute attr;
    // такая реализация пока что, так как у нас в xml complex содержит только simple
    if (attrsFull.size() == 2){
        if (!f.hasComplexAttribute(attrsFull[0].first)){
            return false;
        };        cAttr = f.getComplexAttributeByCode(attrsFull[0].first);
        if (!cAttr.hasAttribute(attributeCode)){
            return false;
        }
    }
    else if (attrsFull.size() == 1){
        if (!f.hasSimpleAttribute(attributeCode)){
            return false;
        }
    }
    else{
        assert(false);
    }

    return true;
}


