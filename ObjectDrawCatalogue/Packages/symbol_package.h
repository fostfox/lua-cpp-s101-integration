#ifndef SYMBOL_PACKAGE_H
#define SYMBOL_PACKAGE_H

#include "graphicbase_package.h"
#include <QString>
#include <optional>

namespace Symbol {

enum class LinePlacementMode
{
    RELATIVE,
    ABSOLUTE
};
const static QMap<QString, LinePlacementMode> toLinePlacementModeMap = {
    { "Relative", LinePlacementMode::RELATIVE },
    { "Absolute", LinePlacementMode::ABSOLUTE },
};
LinePlacementMode toLinePlacementMode(const QString &type);

enum class AreaPlacementMode {
    VISIBLE_PARTS,
    GEOGRAPHIC
};
const static QMap<QString, AreaPlacementMode> toAreaPlacementModeMap = {
    { "VisibleParts", AreaPlacementMode::VISIBLE_PARTS },
    { "Geographic", AreaPlacementMode::GEOGRAPHIC },
};
AreaPlacementMode toAreaPlacementMode(const QString &type);


class LineSymbolPlacement
{
public:
    LineSymbolPlacement(double offset, LinePlacementMode placementMode);

private:
    double m_offset;
    LinePlacementMode m_placementMode;
};

class AreaSymbolPlacement
{
public:
    AreaSymbolPlacement(AreaPlacementMode m_placementMode);
    AreaPlacementMode placementMode;
};


class Symbol
{
public:
    Symbol(QString reference, double m_rotation, GraphicBase::CRSType m_rotationCRS, GraphicBase::Vector m_offset);

    std::optional<LineSymbolPlacement> linePlacement() const;
    void setLinePlacement(const LineSymbolPlacement &linePlacement);

    std::optional<AreaSymbolPlacement> areaPlacement() const;
    void setAreaPlacement(const AreaSymbolPlacement &areaPlacement);

private:
    QString m_reference;
    double m_rotation;
    GraphicBase::CRSType m_rotationCRS;
    GraphicBase::Vector m_offset;
    std::optional<LineSymbolPlacement> m_linePlacement;
    std::optional<AreaSymbolPlacement> m_areaPlacement;
};

}
#endif // SYMBOL_PACKAGE_H
