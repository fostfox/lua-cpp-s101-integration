#pragma comment(lib, "lualib/lua53.lib")

#include <vector>
#include <string>
#include <iostream>
#include <Windows.h>

#include "LuaRuleMashine.h"

using namespace std;

int main() {
	
	vector<string> datasetID = { "dataset_1", "dataset_2" };
	LuaRuleMashine lrm("main.lua");
	
	for (const string& datasetID : datasetID) {
		//-- Lua Portayal - begin
		lrm.getPortrayal(datasetID);
		//-- Lua Portayal - end
		vector<Object> objects = lrm.getCurrentObjects();
		ObjectController::printInformation(objects);
	}

	getchar();
	
	/*
	EXAMPLE WORK OF FIX_9
	Object obj;
	std::vector<std::string> subAttribute = { "categoryOfBridge", "colour", "2", "shape" };
	std::vector<std::string> Attribute = { "categoryOfBridge", "colour", "2", "shape", "2", "number" };
	if (obj.isAttributeExist(subAttribute)) {
		std::cout << obj.getAttributeValue(Attribute);
	}
	*/
	
}
