#include "profiler.h"

#include <QFile>
#include <QTextStream>


TimeUnit::TimeUnit(const QString &functionName)
    : m_functionName(functionName)
{
    this->start();
}

TimeUnit::~TimeUnit()
{
    this->stop();
}

void TimeUnit::start()
{
    m_begin = std::chrono::steady_clock::now();
}

void TimeUnit::stop()
{
    m_end = std::chrono::steady_clock::now();
}

void TimeUnit::writeElapsed()
{
    double elapsedTime = std::chrono::duration_cast<std::chrono::microseconds>(m_end - m_begin).count() / 1e6;

    Profiler &profiler = Profiler::instance();
    profiler.addElapsedTime(m_functionName, elapsedTime);
}


Profiler &Profiler::instance()
{
    static Profiler theSingleInstance;
    return theSingleInstance;
}

TimeUnit Profiler::createTimeUnit(const QString &functionName)
{
    return TimeUnit(functionName);
}

void Profiler::setLogFile(const QString &fileName)
{
    m_fileName = fileName;
}

void Profiler::dumpLog()
{
    if (m_fileName.isEmpty()){
        qFatal("File name not specified");
    }
    QFile logFile(m_fileName);
    if (!logFile.open(QFile::WriteOnly)) {
        qFatal("The file did not open");
    }

    QTextStream out(&logFile);
    for (const auto &funcInfo : m_funcTimeInfoMap){
        const auto &elapsedTimes = funcInfo.elapsedTimes();
        int runFunctCount = elapsedTimes.size();

        out << QString("Function: %1, times[%2]: ")
               .arg(funcInfo.name())
               .arg(runFunctCount);

        double elapsedTimeTotal(0);
        for (const auto &elapsedTime : elapsedTimes){
            out << elapsedTime << " ";
            elapsedTimeTotal += elapsedTime;
        }

        out << QString("total: %1, average: %2")
               .arg(elapsedTimeTotal)
               .arg(elapsedTimeTotal / runFunctCount);
    }
    out << "\n";

    logFile.close();
}

void Profiler::addElapsedTime(const QString &functionName, double time)
{
    if (!m_funcTimeInfoMap.contains(functionName)){
        m_funcTimeInfoMap[functionName] = FunctionTimeInfo(functionName);
    }
    m_funcTimeInfoMap[functionName].addElapsedTime(time);
}

Profiler::FunctionTimeInfo::FunctionTimeInfo(const QString &name)
    :m_name(name)
{
}

void Profiler::FunctionTimeInfo::addElapsedTime(double time)
{
    m_elapsedTimes.push_back(time);
}

const QString &Profiler::FunctionTimeInfo::name() const
{
    return m_name;
}

const QVector<double> &Profiler::FunctionTimeInfo::elapsedTimes() const
{
    return m_elapsedTimes;
}
