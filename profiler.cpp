#include "profiler.h"

#include <QFile>
#include <QTextStream>

QString Profiler::m_fileName;

TimeUnit::TimeUnit(const QString &functionName)
    : m_functionName(functionName)
{
    this->start();
}

TimeUnit::~TimeUnit()
{
    this->stop();
    this->writeElapsed();
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
    for (const auto &funcInf : m_funcTimeInfoMap) {
        out << QString("Function: '%1', total: %2, run count: %3, average: %4")
               .arg(funcInf.name())
               .arg(funcInf.totalElapsed())
               .arg(funcInf.runCount())
               .arg(funcInf.averageElapsed());
    }
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
    ++m_runCount;
    m_totalElapsed += time;
}

const QString &Profiler::FunctionTimeInfo::name() const
{
    return m_name;
}

double Profiler::FunctionTimeInfo::averageElapsed() const
{
    return m_totalElapsed / m_runCount;
}

long Profiler::FunctionTimeInfo::runCount() const
{
    return m_runCount;
}

double Profiler::FunctionTimeInfo::totalElapsed() const
{
    return m_totalElapsed;
}
