#include "symbol_package.h"

Symbol::LinePlacementMode Symbol::toLinePlacementMode(const QString &type)
{
    if (!toLinePlacementModeMap.contains(type)){
        qFatal("has no LinePlacementMode type in map");
    }
    return toLinePlacementModeMap[type];
}

Symbol::AreaPlacementMode Symbol::toAreaPlacementMode(const QString &type)
{
    if (!toAreaPlacementModeMap.contains(type)){
        qFatal("has no AreaPlacementMode type in map");
    }
    return toAreaPlacementModeMap[type];
}

std::optional<LineSymbolPlacement> Symbol::linePlacement() const
{
    return m_linePlacement;
}

void Symbol::setLinePlacement(const std::optional<LineSymbolPlacement> &linePlacement)
{
    m_linePlacement = linePlacement;
}

std::optional<AreaSymbolPlacement> Symbol::areaPlacement() const
{
    return m_areaPlacement;
}

void Symbol::setAreaPlacement(const std::optional<AreaSymbolPlacement> &areaPlacement)
{
    m_areaPlacement = areaPlacement;
}
