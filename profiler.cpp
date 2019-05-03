#include "profiler.h"

TimeUnit::TimeUnit(const std::string &functionName) : functionName_(functionName){
    this->start();
}

TimeUnit::~TimeUnit(){
    this->stop(functionName_);
    result = std::chrono::duration_cast<std::chrono::microseconds>(end - begin).count() / 1e6;
    m_funcName_to_times[functionName_].push_back(result);
}

void TimeUnit::start() {
    begin = std::chrono::steady_clock::now();
}

void TimeUnit::stop(std::string s) {
    end = std::chrono::steady_clock::now();
    //std::cout << s.c_str() << " Time elapsed = " << std::chrono::duration_cast<std::chrono::microseconds>(end - begin).count()/1e6 << std::endl;

    //logfile << s << "," << std::chrono::duration_cast<std::chrono::microseconds>(end - begin).count() / 1e6 << std::endl;
}

void TimeUnit::dump() {
//    std::ofstream myfile;
//    myfile.open("timer.txt");
//    myfile << logfile.rdbuf();
//    myfile.close();
}

Profiler &Profiler::Instance() {
    static Profiler theSingleInstance;
    return theSingleInstance;
}

TimeUnit Profiler::createTimeUnit(const std::string &functionName){
    return TimeUnit(functionName);
}

void Profiler::dump()
{
    std::ofstream myfile;
    myfile.open("timer.txt");
    //auto r = m_funcName_to_times;
    myfile << 1.3;
    myfile.close();
}

//void Profiler::setFunctionResultTime(std::string fileName, double timeResult){
//    m_funcName_to_times[fileName].push_back(timeResult);
//}
