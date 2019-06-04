#pragma once
#include <QDateTime>
#include <QIODevice>
#include <QTextStream>
#include <QFile>

#include "config.h"

#include "profiler.h"
#include "ObjectDictCatalogue/Builder/xmlbuilder.h"
#include "ObjectMapCatalogue/Builder/xmlparser.h"
#include "ObjectMapCatalogue/contextparameter.h"
#include "ObjectDrawCatalogue/Builder/drawinstructionparser.h"
#include "ObjectDrawCatalogue/Controller/drawing_instructions_controller.h"
#include "LuaPortroyal/LuaRuleMashine.h"
#include "ObjectSymbolsCatalogue/Builder/builder.h"

#include "drawengine.h"


char* getLine(const uint N, char D){
    char* line = new char[N];
    for (uint i = 0; i < N-1; ++i)
        line[i] = D;
    line[N-1] = 0;
    return line;
}

#ifdef DEBUG_TO_LOG_FILE
    FILE* out = fopen(filenames::LOG.toStdString().c_str(), "w");
#else
    FILE* out = stderr;
#endif

void myMessageOutput(QtMsgType type, const QMessageLogContext &context, const QString &msg)
{
#ifdef DEBUG_OUT_ENABLE
    static const char *line1 = getLine(120, '_');
    static const char *line2 = getLine(120, '=');
    static const char *line3 = getLine(120, ':');
    static const char *line4 = getLine(120, '#');

    QByteArray localMsg = msg.toLocal8Bit();
    const char *file = context.file ? context.file : "";
    const char *function = context.function ? context.function : "";
    switch (type) {
    case QtDebugMsg: // is used for writing custom debug output.";
        fprintf(out, "Debug: %s (%s:%u, %s)\n", localMsg.constData(), file, context.line, function);
        break;
    case QtInfoMsg:  // "is used for informational messages.";
        //fprintf(stderr, "%s\nInfo: %s\n\n", line1, localMsg.constData());
        fprintf(out, "%s\nInfo: %s\n\n", line1, localMsg.constData());
        break;
    case QtWarningMsg:  // "is used to report warnings and recoverable errors in your application.";
        fprintf(out, "\n%s\nWarning: %s (%s:%u, %s)\n%s\n", line2, localMsg.constData(), file, context.line, function, line2);
        break;
    case QtCriticalMsg:  // "is used for writing critical error messages and reporting system errors.";
        fprintf(out, "\n\n%s\nCritical: %s (%s:%u, %s)\n%s\n\n", line3, localMsg.constData(), file, context.line, function, line3);
        break;
    case QtFatalMsg:  // is used for writing fatal error messages shortly before exiting."
        fprintf(out, "\n\n%s\nFatal: %s (%s:%u, %s)\n%s\n\n", line4, localMsg.constData(), file, context.line, function, line4);
        fprintf(stderr, "\n\n%s\nFatal: %s (%s:%u, %s)\n%s\n\n", line4, localMsg.constData(), file, context.line, function, line4);
        abort();
        break;
    }
    #endif
}

///----------------------------------------------------------------------------

bool isOpen(QTextStream &errorStream, QFile &file, const QIODevice::OpenMode &flags)
{
    if (!file.open(flags)){
        errorStream << QString(
                           "Filed to open file %1.\n"
                           ).arg(file.fileName());
        return false;
    }
    return true;
}

bool isExists(QTextStream &errorStream, const QString fileName)
{
    if (!QFile::exists(fileName)) {
        errorStream << QString(
                           "File %1 does not exist.\n"
                           ).arg(fileName);
        return false;
    }
    return true;
}

bool isExistsEndOpen(QTextStream &errorStream, QFile &file, const QIODevice::OpenMode &flags)
{
    if (!isExists(errorStream, file.fileName())){
        return false;
    } else if (!isOpen(errorStream, file, flags)){
        return false;
    }
    return true;
}

///----------------------------------------------------------------------------

bool writeDrawInst(QFile & portayalFile, const DrawingInstructionsController& drawCtrl, const FeatureCatalogueController& fcCtrl, const FeatureMapController &fmCtrl)
{
    QTextStream out(&portayalFile);
    for (const auto& featureID : fmCtrl.getFeaturesIDs()){
        std::string featureCode = fmCtrl.getFeatureById(featureID).classAlias();
        auto drawInstr = drawCtrl.drawInstrStr()[QString::fromStdString(featureID)];

        out << "Feature : [" << QString::fromStdString(featureID) << "] " << QString::fromStdString(featureCode)
                 << "\n " << drawInstr
                 << "\n---------------------------------------\n";
    }
    return true;
}
