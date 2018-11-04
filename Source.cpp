#pragma comment(lib, "lualib/lua53.lib")

#include <vector>
#include <string>

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
}
