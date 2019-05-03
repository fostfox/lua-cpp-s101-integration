#pragma once


// timer.h
#include <iostream>
#include <sstream>
#include <chrono>
#include <fstream>
#include <map>
#include <vector>
#include <string>

class TimeUnit{
public:
    TimeUnit(const std::string &functionName);
    ~TimeUnit();

private:
    std::string functionName_;
    std::chrono::steady_clock::time_point begin;
    std::chrono::steady_clock::time_point end;
    double result;

    std::stringstream logfile;
    void start();
    void stop(std::string s);
    void dump();
};

class Profiler {
public:
    Profiler() = default;
    Profiler(const Profiler& root) = delete;
    Profiler& operator=(const Profiler&) = delete;

    static Profiler& Instance();
    static TimeUnit createTimeUnit(const std::string &functionName);

    static void dump();

private:
    friend class TimeUnit;
    //void setFunctionResultTime(std::string fileName, double timeResult);

    std::string funcName_;
    std::map<std::string, std::vector<double>> m_funcName_to_times;
};

