#pragma once



// ----------------------------

#define DEBUG_OUT_ENABLE
#define DEBUG_TO_LOG_FILE
#define PROFILING_TIME_ENABLE

// ----------------------------

#include <QDateTime>
#include <QVariant>
#include "ObjectMapCatalogue/contextparameter.h"

static const auto dateTime = QString::number(QDateTime::currentSecsSinceEpoch());
namespace filenames {
const static QString MAP          = "XMLData/dataset_map.xml";
const static QString DICT         = "XMLData/S-101FC_1.0.0_20190409.xml";
const static QString LUA_MAIN     = "lua/main.lua";
const static QString PORTRAYAL    = dateTime + "-OUTPUT.txt";
const static QString PROFILE      = dateTime + "-elapsed_time.txt";
const static QString LOG          = dateTime + "-log.txt";
}


namespace contextparams {
using namespace contextparamstype;
const static QVector<ContextParameter> PARAMS = {
    { IGNORE_SCAMIN, false },
    { RADAR_OVERLAY, false },
    { SAFETY_DEPTH, 10.5 },
    { PLAIN_BOUNDARIES, false },
    { SIMPLIFIED_POINTS, true },
    { SAFETY_CONTOUR, 10.5 },
    { SHALLOW_CONTOUR, 10.3 },
    { DEEP_CONTOUR, 10 },
    { SHALLOW_PATTERN, true },
    { TWO_SHADES, false },
    { NATIONAL_LANGUAGE, "eng" },
    { SHOW_ISOLATED_DANGERS_IN_SHALLOW_WATERS, true }
};
}
