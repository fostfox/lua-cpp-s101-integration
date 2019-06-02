#pragma once

#include "../../ObjectDrawCatalogue/Packages/linestyles_package.h"
#include "../../ObjectDrawCatalogue/Packages/areafills_package.h"
#include "../Entities/color.h"
#include "../Entities/symbol.h"

#include <QMap>
#include <QXmlStreamReader>
#include <QFile>
#include <optional>


namespace fc_tags {
enum Main {
    COLORS_PROFILE,
    SYMBOL,
    LINE_STYLE,
    AREA_FILL,
};
const static QMap<QString, Main> main =  {
    { "colorProfile", COLORS_PROFILE },
    { "symbol", SYMBOL },
    { "lineStyle", LINE_STYLE },
    { "areaFill", AREA_FILL },
};

enum class LineStyle {
    INTERVAL_LENGTH,
    PEN,
    DASH,
    SYMBOL
};
const static QMap<QString, LineStyle> lineStyle = {
    { "intervalLength", LineStyle::INTERVAL_LENGTH },
    { "pen", LineStyle::PEN },
    { "dash", LineStyle::DASH },
    { "symbol", LineStyle::SYMBOL},
};

enum class AreaFills {
    AREA_CRS,
    SYMBOL,
    V1,
    V2
};
const static QMap<QString, AreaFills> areaFills = {
    { "areaCRS", AreaFills::AREA_CRS},
    { "symbol", AreaFills::SYMBOL },
    { "v1", AreaFills::V1 },
    { "v2", AreaFills::V2 },
};

enum class ColorProfiles {
    PALETTE,
    ITEM,
};
const static QMap<QString, ColorProfiles> colorProfiles = {
    { "palette", ColorProfiles::PALETTE},
    { "item", ColorProfiles::ITEM },
};
}




template<typename T>
bool isAllowed(const QXmlStreamReader& reader, const QMap<QString, T>& map, const QString& tagName)
{
    return reader.isStartElement() && map.contains(tagName);
}
