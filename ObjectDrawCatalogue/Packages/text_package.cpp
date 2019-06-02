#include "text_package.h"

#include <QFont>

text_package::Text::Text(HorizontalAlignment ha, VerticalAlignment va, const QVector<TextElement> &elements)
    :m_horizontalAlignment(ha)
    ,m_verticalAlignment(va)
    ,m_elements(elements)
{

}

QVector<text_package::TextElement> text_package::Text::elements() const
{
    return m_elements;
}

text_package::TextPoint::TextPoint(HorizontalAlignment ha, VerticalAlignment va, const QVector<TextElement> &elements, double rotation)
    :Text(ha, va, elements)
    ,m_rotation(rotation)
{

}

std::optional<symbol::AreaSymbolPlacement> text_package::TextPoint::areaPlacement() const
{
    return m_areaPlacement;
}

void text_package::TextPoint::setAreaPlacement(const symbol::AreaSymbolPlacement &areaPlacement)
{
    m_areaPlacement = std::make_optional(areaPlacement);
}

double text_package::TextPoint::rotation() const
{
    return m_rotation;
}

text_package::TextLine::TextLine(HorizontalAlignment ha, VerticalAlignment va, const QVector<TextElement> &elements, double startOffset, symbol::LinePlacementMode placementMode)
    :Text (ha, va, elements)
    ,m_startOffset(startOffset)
    ,m_placementMode(placementMode)
{

}

text_package::VerticalAlignment text_package::toVerticalAlignment(const QString &type)
{
    const static QMap<QString, VerticalAlignment> toVerticalAlignmentMap = {
        { "Top", VerticalAlignment::TOP },
        { "Bottom", VerticalAlignment::BOTTOM },
        { "Center", VerticalAlignment::CENTER },
        { "Baseline", VerticalAlignment::BASELINE}
    };
    if (!toVerticalAlignmentMap.contains(type)){
        qFatal("has no VerticalAlignment type in map");
    }
    return toVerticalAlignmentMap[type];
}

text_package::HorizontalAlignment text_package::toHorizontalAlignment(const QString &type)
{
    const static QMap<QString, HorizontalAlignment> toHorizontalAlignmentMap = {
        { "Start", HorizontalAlignment::START },
        { "Center", HorizontalAlignment::END },
        { "End", HorizontalAlignment::CENTER },
    };
    if (!toHorizontalAlignmentMap.contains(type)){
        qFatal("has no HorizontalAlignment type in map");
    }
    return toHorizontalAlignmentMap[type];
}

text_package::FontSlant text_package::toFontSlant(const QString &type)
{
    const static QMap<QString, FontSlant> toFontSlantMap = {
        { "Upright", FontSlant::UPRIGHT },
        { "Italics", FontSlant::ITALICS },
    };
    if (!toFontSlantMap.contains(type)){
        qFatal("has no FontSlant type in map");
    }
    return toFontSlantMap[type];
}

text_package::FontWeight text_package::toFontWeight(const QString &type)
{
    const static QMap<QString, FontWeight> toFontWeightMap = {
        { "Light", FontWeight::LIGHT },
        { "Medium", FontWeight::MEDIUM },
        { "Bold", FontWeight::BOLD },
    };
    if (!toFontWeightMap.contains(type)){
        qFatal("has no FontWeight type in map");
    }
    return toFontWeightMap[type];
}

text_package::FontProportion text_package::toFontProportion(const QString &type)
{
    const static QMap<QString, FontProportion> toFontProportionMap = {
        { "MonoSpaced", FontProportion::MONO_SPACES },
        { "Proportional", FontProportion::PROPORTIONAL },
    };
    if (!toFontProportionMap.contains(type)){
        qFatal("has no FontProportion type in map");
    }
    return toFontProportionMap[type];
}

text_package::FontCharacteristics::FontCharacteristics(bool serifs, text_package::FontWeight weight, text_package::FontSlant slant, text_package::FontProportion proportion)
    :m_serifs(serifs), m_weight(weight), m_slant(slant), m_proportion(proportion)
{

}

QFont::Weight text_package::FontCharacteristics::weightQt() const
{
    switch (m_weight) {
    case FontWeight::LIGHT: return QFont::Light;
    case FontWeight::MEDIUM: return QFont::Medium;
    case FontWeight::BOLD: return QFont::Bold;
    }

}

text_package::FontWeight text_package::FontCharacteristics::weight() const
{
    return m_weight;
}

text_package::TextElement::TextElement(QString text, double bodySize, double verticalOffset, text_package::Font *font, graphic_base::Color foreground)
    :m_text(text), m_bodySize(bodySize), m_verticalOffset(verticalOffset), m_font(font), m_foreground(foreground)
{

}

QString text_package::TextElement::text() const
{
    return m_text;
}

double text_package::TextElement::bodySize() const
{
    return m_bodySize;
}

const graphic_base::Color& text_package::TextElement::foregroundColor() const
{
    return m_foreground;
}

text_package::Font *text_package::TextElement::font() const
{
    return m_font;
}
