#include <QString>
#include "featurescontroller.h"


std::vector<std::pair<std::string, std::string> > getAttributeNames(const std::string &path){
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
        id_to_f_.insert(std::make_pair(f.id(), f));
        if (f.fe2spRef().refId() != -1)
            refId_to_Fe2SpRef.insert(std::make_pair(f.fe2spRef().refId(), f.fe2spRef()));
    }
}

void FeatureMapController::setSpatials(const std::map<int, std::shared_ptr<GM_Object> > &SpId_to_SpatialObject)
{
    spId_to_SpatialObject = SpId_to_SpatialObject;
}

bool FeatureMapController::hasSpatialObject(int spatialId) const
{
    return spId_to_SpatialObject.count(spatialId) != 0;
}

std::shared_ptr<GM_Object> FeatureMapController::spatialObjectByRefId(int refId) const
{
    return spId_to_SpatialObject.at(refId);
}

std::vector<std::string> FeatureMapController::getFeaturesIDs() const
{
    std::vector<std::string> ids;
    ids.reserve(fs_.size());
    for (const auto &f : fs_){
        ids.push_back(std::to_string(f.id()));
    }
    return ids;
}

const std::string &FeatureMapController::getCodeById(int id) const
{
    if(!id_to_f_.count(id)){
        //qFatal(QString("'id_to_f_' has no key '%1'").arg(QString::fromStdString(id)).toUtf8());
    }
    return id_to_f_.at(id).classAlias();
}

const Attribute& FeatureMapController::getSimpleAttribute(int id, const std::string& path, const std::string& attrCode) const
{
    const Feature& f = id_to_f_.at(id);
    std::vector<std::pair<std::string, std::string> > attrsFull
            = getAttributeNames(path);

    if (attrsFull.size() == 1){
        if (attrsFull[0].first == ""){
            attrsFull.clear();
        }
    }
    // такая реализация пока что, так как у нас в xml complex содержит только simple
    if (attrsFull.size() == 1){
        const ComplexAttribute& cAttr = f.getComplexAttributeByCode(attrsFull[0].first);
        return cAttr.getAttributeByCode(attrCode);
    }
    return f.getAttributeByCode(attrCode);
}

const Feature& FeatureMapController::getFeatureById(int id) const
{
    return id_to_f_.at(id);
}

const Fe2spRef &FeatureMapController::getFe2spRefByRefId(int refId) const
{
    if(!refId_to_Fe2SpRef.count(refId)){
        //qFatal(QString("'refId_to_Fe2SpRef' has no key '%1'").arg(QString::fromStdString(refId)).toUtf8());
    }
    return refId_to_Fe2SpRef.at(refId);
}

bool FeatureMapController::hasSimpleAttribute(int id, const std::string& path, const std::string& attributeCode) const
{
    const Feature &f = id_to_f_.at(id);
    std::vector<std::pair<std::string, std::string> > attrsFull
            = getAttributeNames(path);

    if (attrsFull.size() == 1){
        if (attrsFull[0].first == ""){
            attrsFull.clear();
        }
    }
    // такая реализация пока что, так как у нас в xml complex содержит только simple
    if (attrsFull.size() == 1){
        if (!f.hasComplexAttribute(attrsFull[0].first)){
            return false;
        };
        const ComplexAttribute &cAttr = f.getComplexAttributeByCode(attrsFull[0].first);
        if (!cAttr.hasAttribute(attributeCode)){
            return false;
        }
    }
    else if (!f.hasSimpleAttribute(attributeCode)){
        return false;
    }

    return true;
}

bool FeatureMapController::hasSpatialAssotiation(int featureId) const
{
    const Feature &f = id_to_f_.at(featureId);
    return (f.fe2spRef().refId() != -1) ? true : false;
}

size_t FeatureMapController::getComplexAttributeSize(int featureId, const std::string &path, const std::string &attributeCode) const
{
    if (!path.empty()) {
        //qWarning("In FeatureMapController::getComplexAttributeSize path is not processing");
    }
    size_t complexAttrSize = 0;

    const Feature &f = id_to_f_.at(featureId);
    if (!f.hasComplexAttribute(attributeCode)){
        return complexAttrSize;
    }
    const ComplexAttribute &cAttr = f.getComplexAttributeByCode(attributeCode);

    complexAttrSize = cAttr.attibutes().size();
    if (!complexAttrSize){
        //qWarning("In FeatureMapController::getComplexAttributeSize ComplexAttribute:",
          //       attributeCode.c_str(), " hasn't SimpleAttributes");
    }

    return complexAttrSize;
}


