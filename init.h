#pragma once


//#define NO_DEBUG_OUT

///----------------------------------------------------------------------------


#include <QString>

namespace filenames {
const static QString MAP =          "../XMLData/test_dataset_map.xml";
const static QString DICT =         "../XMLData/S-101_FC_0_8_8.xml";
const static QString LUA_MAIN =     "../LuaPortroyal/Rules/main.lua";
const static QString PORTRAYAL =    "OUTPUT.txt";
}


#ifndef NO_DEBUG_OUT

char* getLine(const uint N, char D){
    char* line = new char[N];
    for (uint i = 0; i < N-1; ++i)
        line[i] = D;
    line[N-1] = 0;
    return line;
}

void myMessageOutput(QtMsgType type, const QMessageLogContext &context, const QString &msg)
{
    static const char *line1 = getLine(120, '_');
    static const char *line2 = getLine(120, '=');
    static const char *line3 = getLine(120, ':');
    static const char *line4 = getLine(120, '#');

    QByteArray localMsg = msg.toLocal8Bit();
    const char *file = context.file ? context.file : "";
    const char *function = context.function ? context.function : "";
    switch (type) {
    case QtDebugMsg: // is used for writing custom debug output.";
        fprintf(stderr, "Debug: %s (%s:%u, %s)\n", localMsg.constData(), file, context.line, function);
        break;
    case QtInfoMsg:  // "is used for informational messages.";
        //fprintf(stderr, "Info: %s (%s:%u, %s)\n", localMsg.constData(), file, context.line, function);
        fprintf(stderr, "%s\nInfo: %s\n\n", line1, localMsg.constData());
        break;
    case QtWarningMsg:  // "is used to report warnings and recoverable errors in your application.";
        fprintf(stderr, "\n%s\nWarning: %s (%s:%u, %s)\n%s\n", line2, localMsg.constData(), file, context.line, function, line2);
        break;
    case QtCriticalMsg:  // "is used for writing critical error messages and reporting system errors.";
        fprintf(stderr, "\n\n%s\nCritical: %s (%s:%u, %s)\n%s\n\n", line3, localMsg.constData(), file, context.line, function, line3);
        break;
    case QtFatalMsg:  // is used for writing fatal error messages shortly before exiting."
        fprintf(stderr, "\n\n%s\nFatal: %s (%s:%u, %s)\n%s\n\n", line4, localMsg.constData(), file, context.line, function, line4);
        abort();
        break;
    }
}
#endif
