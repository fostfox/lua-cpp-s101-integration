#pragma once


// timer.h
#include <iostream>
#include <sstream>
#include <chrono>
#include <fstream>
#include <map>
#include <vector>
#include <string>
#include <QString>
#include <QMap>
#include <QString>
#include <QVector>

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
    Profiler() = default;
    Profiler(const Profiler& root) = delete;
    Profiler& operator=(const Profiler&) = delete;

    static Profiler& instance();
    static TimeUnit createTimeUnit(const QString &functionName);

    static void setLogFile(const QString &fileName);
    static void dumpLog();

private:
    class FunctionTimeInfo {
    public:
        FunctionTimeInfo(const QString &name);
        void addElapsedTime(double time);
        const QString &name() const;
        const QVector<double>& elapsedTimes() const;
    private:
        QString m_name;
        QVector<double> m_elapsedTimes;
    };

    void addElapsedTime(const QString &functionName, double time);

private:
    static QString m_fileName;
    static QMap<QString, FunctionTimeInfo> m_funcTimeInfoMap;
};

