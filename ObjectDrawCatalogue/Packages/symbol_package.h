#pragma once

#include "graphicbase_package.h"
#include <optional>

namespace symbol {

enum class LinePlacementMode
{
    RELATIVE,
    ABSOLUTE
};
LinePlacementMode toLinePlacementMode(const QString &type);

enum class AreaPlacementMode {
    VISIBLE_PARTS,
    GEOGRAPHIC
};
AreaPlacementMode toAreaPlacementMode(const QString &type);


class LineSymbolPlacement
{
public:
    LineSymbolPlacement(double offset, LinePlacementMode placementMode);
    double offset() const;
    LinePlacementMode placementMode() const;

private:
    double m_offset;
    LinePlacementMode m_placementMode;
};


class AreaSymbolPlacement
{
public:
    AreaSymbolPlacement(AreaPlacementMode placementMode);
    AreaPlacementMode getPlacementMode() const;

private:
    AreaPlacementMode m_placementMode;
};


class Symbol
{
public:
    Symbol(QString reference, double rotation, graphic_base::CRSType rotationCRS, graphic_base::Vector offset);

    std::optional<LineSymbolPlacement> linePlacement() const;
    void setLinePlacement(const LineSymbolPlacement &linePlacement);

    std::optional<AreaSymbolPlacement> areaPlacement() const;
    void setAreaPlacement(const AreaSymbolPlacement &areaPlacement);

private:
    QString m_reference;
    double m_rotation;
    graphic_base::CRSType m_rotationCRS;
    graphic_base::Vector m_offset;
    std::optional<LineSymbolPlacement> m_linePlacement;
    std::optional<AreaSymbolPlacement> m_areaPlacement;
};

};
