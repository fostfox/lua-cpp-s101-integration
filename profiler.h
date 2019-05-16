#pragma once


#include "config.h"

#include <chrono>
#include <QMap>
#include <QTextStream>

#ifdef PROFILING_TIME_ENABLE
#   define PROFILING_TIME2(functionName) [[maybe_unused]] const auto& ___p = Profiler::instance().createTimeUnit(functionName);
#   define PROFILING_TIME PROFILING_TIME2(__FUNCTION__)
#else
#   define PROFILING_TIME2(functionName)
#   define PROFILING_TIME
#endif



class QFile;
class Profiler;


class TimeUnit {
public:
    TimeUnit(const QString &functionName);
    ~TimeUnit();

private:
    void start();
    void stop();
    void writeElapsed();

private:
    QString m_functionName;
    std::chrono::steady_clock::time_point m_begin;
    std::chrono::steady_clock::time_point m_end;
};


class Profiler {
    friend class TimeUnit;
public:
    static Profiler& instance();
    static void setLogFile(const QString &fileName);

    [[nodiscard]]
    TimeUnit createTimeUnit(const QString &functionName);
    void dumpLog();
    void dumpLogMultiMap(QTextStream& stream, const QString& mapSetName, const std::string& funcName = "PortrayalMain");
    void clear();

private:
    Profiler() = default;
    Profiler(const Profiler& root) = delete;
    Profiler& operator=(const Profiler&) = delete;

    void addElapsedTime(const QString &functionName, double time);

    class FunctionTimeInfo {
    public:
        FunctionTimeInfo() = default;
        FunctionTimeInfo(const QString &name);
        void addElapsedTime(double time);
        const QString &name() const;
        double totalElapsed() const;
        double averageElapsed() const;
        long runCount() const;
    private:
        QString m_name = "undef_function_name";
        long m_runCount = 0;
        double m_totalElapsed = 0;
    };

private:
    static QString m_fileName;
    QMap<QString, FunctionTimeInfo> m_funcTimeInfoMap;
};
