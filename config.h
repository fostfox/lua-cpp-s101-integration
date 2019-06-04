#pragma once


#include <QDateTime>
#include <QVariant>
#include "ObjectMapCatalogue/contextparameter.h"

static const double MM_PER_INCH = 25.4;

static const auto dateTime = QString::number(QDateTime::currentSecsSinceEpoch());
namespace filenames {
const static QString MAP_SET      = "XMLData/MAP_SET/";
//const static QString MAP          = "XMLData/dataset_map.xml";
const static QString MAP          = "XMLData/MAP_SET/101CA00276311.usf.xml";
//const static QString MAP          = "XMLData/MAP_SET/101CA00276312.usf.xml";
//const static QString MAP          = "XMLData/MAP_SET/101CA00273097.usf.xml";
//const static QString MAP          = "XMLData/101CA00573247.usf.xml";
const static QString DICT         = "XMLData/S-101FC_1.0.0_20190409.xml";
const static QString LUA_MAIN     = "lua/main.lua";
const static QString PORTRAYAL    = dateTime + "-OUTPUT.txt";
const static QString PROFILE      = dateTime + "-elapsed_time.txt";
const static QString LOG          = dateTime + "-log.txt";

const static QString IMG_MAP     = "mapimg.png";

const static QString PORTRAYAL_CATALOGUE = "XMLData/PC_PACK/portrayal_catalogue.xml";

    namespace catalogues {
    const static QString COLORS      = "XMLData/PC_PACK/ColorProfiles";
    const static QString AREA_FILLS  = "XMLData/PC_PACK/AreaFills";
    const static QString LINE_STILES = "XMLData/PC_PACK/LineStyles";
    const static QString SYMBOLS     = "XMLData/PC_PACK/Symbols";
    } // namespace catalogues
} // namespace filenames

namespace map_params {
static double WEIGHT = 1920*0.6;
static double HEIGHT = 1080*0.6;
}

namespace contextparams {
using namespace contextparamstype;
const static QVector<ContextParameter> PARAMS = {
    /// selected safety depth (meters)
    { SAFETY_DEPTH, 30.0 },
    /// selected shallow water contour (meters) (optional)
    { SHALLOW_CONTOUR, 2.0 },
    ///selected safety contour (meters)
    { SAFETY_CONTOUR, 30.0 },
    ///show two depth shades only, safe vs unsafe
    { TWO_SHADES, true },
    ///selected deep water contour (meters) (optional)
    { DEEP_CONTOUR, 30.0 },
    ///show the shallow diamond pattern in shallow water
    { SHALLOW_PATTERN, false },
    ///show isolated dangers in shallow waters
    { SHOW_ISOLATED_DANGERS_IN_SHALLOW_WATERS, false },
    ///simplify portrayal of lines
    { PLAIN_BOUNDARIES, false },
    ///simplify portrayal of point symbols
    { SIMPLIFIED_POINTS, false },
    ///Tells the portrayal whether a RADAR sweep is displayed or not
    { RADAR_OVERLAY, true },
    ///Ignore the scaleMinimum attribute
    { IGNORE_SCAMIN, false },
    ///Selects which language to use for text (ISO 639-3)
    { NATIONAL_LANGUAGE, "eng" },
};
} // namespace contextparams
