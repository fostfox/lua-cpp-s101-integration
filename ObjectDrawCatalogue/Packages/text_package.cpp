#include "text_package.h"

Text::Text::Text(HorizontalAlignment ha, VerticalAlignment va, const QVector<TextElement> &elements)
    :m_horizontalAlignment(ha)
    ,m_verticalAlignment(va)
    ,m_elements(elements)
{

}

Text::TextPoint::TextPoint(HorizontalAlignment ha, VerticalAlignment va, const QVector<TextElement> &elements, double rotation)
    :Text(ha, va, elements)
    ,m_rotation(rotation)
{

}

std::optional<Symbol::AreaSymbolPlacement> TextPoint::areaPlacement() const
{
    return m_areaPlacement;
}

void TextPoint::setAreaPlacement(const Symbol::AreaSymbolPlacement &areaPlacement)
{
    m_areaPlacement = areaPlacement;
}

Text::TextLine::TextLine(HorizontalAlignment ha, VerticalAlignment va, const QVector<TextElement> &elements, double startOffset, Symbol::LinePlacementMode placementMode)
    :Text (ha, va, elements)
    ,m_startOffset(startOffset)
    ,m_placementMode(placementMode)
{

}

Text::VerticalAlignment Text::toVerticalAlignment(const QString &type)
{
    if (!toVerticalAlignmentMap.contains(type)){
        qFatal("has no VerticalAlignment type in map");
    }
    return toVerticalAlignmentMap[type];
}

Text::HorizontalAlignment Text::toHorizontalAlignment(const QString &type)
{
    if (!toHorizontalAlignmentMap.contains(type)){
        qFatal("has no HorizontalAlignment type in map");
    }
    return toHorizontalAlignmentMap[type];
}

Text::FontSlant Text::toFontSlant(const QString &type)
{
    if (!toFontSlantMap.contains(type)){
        qFatal("has no FontSlant type in map");
    }
    return toFontSlantMap[type];
}

Text::FontWeight Text::toFontWeight(const QString &type)
{
    if (!toFontWeightMap.contains(type)){
        qFatal("has no FontWeight type in map");
    }
    return toFontWeightMap[type];
}

Text::FontProportion Text::toFontProportion(const QString &type)
{
    if (!toFontProportionMap.contains(type)){
        qFatal("has no FontProportion type in map");
    }
    return toFontProportionMap[type];
}
