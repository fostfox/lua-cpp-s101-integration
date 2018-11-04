#include "ObjectController.h"
#include <fstream>
#include <iostream>
#include <algorithm>
#include <utility>

std::map<std::string, std::string> Object::spatials = {
  { "SPATIAL_0", "None" },
{ "SPATIAL_1", "Point" },
{ "SPATIAL_2", "MultiPoint" },
{ "SPATIAL_3", "Curve" },
{ "SPATIAL_4", "CompositeCurve" },
{ "SPATIAL_5", "Surface" },
};
const char* Object::NO_SPATIAL = "NO_SPATIAL";
const char* Object::NO_SIMPLE_ATTRIBUTE = "NO_SIMPLE_ATTRIBUTE";


size_t split(const std::string &txt, std::vector<std::string> &strs, char ch = ' ')
{
	size_t pos = txt.find(ch);
	size_t initialPos = 0;
	strs.clear();
	// Decompose statement
	while(pos != std::string::npos) {
		strs.push_back(txt.substr(initialPos, pos - initialPos));
		initialPos = pos + 1;
		pos = txt.find(ch, initialPos);
	}
	// Add the last one
	strs.push_back(txt.substr(initialPos, std::min(pos, txt.size()) - initialPos + 1));
	return strs.size();
}

Object::Object(std::string ID, std::string code, std::string datasetID, std::string spatialID, std::map<std::string, int> simpleAttributes)
	: ID_(std::move(ID))
  , code_(std::move(code))
  , datasetID_(std::move(datasetID))
  , spatialID_(std::move(spatialID))
  , simpleAttributes_(std::move(std::move(simpleAttributes)))
{
}

std::string Object::getID() const 
{
	return ID_;
}

std::string Object::getCode() const 
{
	return code_;
}

std::string Object::getDatasetID() const 
{
	return datasetID_;
}

std::string Object::getSpatialID() const {
	return spatialID_;
}

int Object::getSimpleAttributeValue(std::string code) const
{
  return simpleAttributes_.at(code);
}

void ObjectController::setObjects(std::string datasetID) {
	objects_.clear();
	std::ifstream in(path + datasetID);
	if(!in.is_open()) {
		std::cout << "Error - host: file '" << path + datasetID << "' doesn't opened" << std::endl;
	}
  std::string objectID, objectCode, spatialID;
  std::map<std::string, int> simpleAttributes;
  std::string simpleAttributeCode;
  int simpleAttributeValue;
	while (!in.eof()) {
		in >> objectID >> objectCode >> spatialID >> simpleAttributeCode;
    if (spatialID == Object::NO_SPATIAL) {
      spatialID.clear();
    }
    if (simpleAttributeCode != Object::NO_SIMPLE_ATTRIBUTE) {
      in >> simpleAttributeValue;
      simpleAttributes[simpleAttributeCode] = simpleAttributeValue;
    }
    
		//std::getline(in, tmp);
		//split(tmp, simpleAttributes);
    //simpleAttributes.erase(simpleAttributes.begin());
		objectIndexByID_[objectID] = objects_.size();
		objects_.push_back(
      Object(objectID, objectCode, 
             datasetID, spatialID, 
             simpleAttributes
      ));
	}

	in.close();
}

std::vector<Object> ObjectController::getObjects() const {
	return objects_;
}

void ObjectController::printInformation(const std::vector<Object>& objects)
{
	using namespace std;
	auto it = objects.begin();

	if(it == objects.end()) {
		cout << "Warning: attempt to print empty vector<Objects>" << endl;
		return;
	}

	cout << "Dataset ID : " << (*it).getDatasetID()
		<< endl << "Features:" << endl;

	for(const Object& object : objects) {
    cout << "ID: " << object.getID()
      << " CODE: " << object.getCode();
		//for(const string& spatialID : object.getSpatialID()) {
		//	cout << spatialID << " ";
		//}
    auto special = object.getSpatialID();
    if (!special.empty()) {
      cout << " SPECIAL: " << special << ":" << Object::toSpatialType(special) << endl;
    }
   
		cout << "DRAW_INSTRUCTIONS: " << endl;
		for(const auto& drawInstuction : object.getDrawInstructions()) {
			cout << "\t" << drawInstuction << endl;
		}
	}
	cout << endl;
}

const Object& ObjectController::getObject(std::string objectID) const {
	return objects_[objectIndexByID_.at(objectID)];
}

void Object::setDrawInstructions(std::string drawInstructions) 
{
	split(drawInstructions, drawInstructions_, ';');
}

std::vector<std::string> Object::getDrawInstructions() const
{
	return drawInstructions_;
}

void ObjectController::setDrawInstructions(std::string objectID, std::string drawInstructions) {
	objects_[objectIndexByID_[objectID]].setDrawInstructions(drawInstructions);
}

std::string Object::toSpatialType(const std::string & spatialID)
{
	return spatials.at(spatialID);
}
