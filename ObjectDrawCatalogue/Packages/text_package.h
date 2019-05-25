#ifndef TEXT_PACKAGE_H
#define TEXT_PACKAGE_H

#include "graphicbase_package.h"
#include "symbol_package.h"

#include <QVector>
#include <QString>
#include <optional>


namespace Text {

enum class VerticalAlignment {
    TOP,
    BOTTOM,
    CENTER,
    BASELINE
};
const static QMap<QString, VerticalAlignment> toVerticalAlignmentMap = {
    { "Top", VerticalAlignment::TOP },
    { "Bottom", VerticalAlignment::BOTTOM },
    { "Center", VerticalAlignment::CENTER },
    { "Baseline", VerticalAlignment::BASELINE}
};
VerticalAlignment toVerticalAlignment(const QString &type);

enum class HorizontalAlignment {
    START,
    END,
    CENTER
};
const static QMap<QString, HorizontalAlignment> toHorizontalAlignmentMap = {
    { "Start", HorizontalAlignment::START },
    { "Center", HorizontalAlignment::END },
    { "End", HorizontalAlignment::CENTER },
};
HorizontalAlignment toHorizontalAlignment(const QString &type);

enum class TextFlag {
    underLine,
    strikeThrough,
    upperLine
};

enum class FontSlant {
    UPRIGHT,
    ITALICS
};
const static QMap<QString, FontSlant> toFontSlantMap = {
    { "Upright", FontSlant::UPRIGHT },
    { "Italics", FontSlant::ITALICS },
};
FontSlant toFontSlant(const QString &type);

enum class FontWeight {
    LIGHT,
    MEDIUM,
    BOLD
};
const static QMap<QString, FontWeight> toFontWeightMap = {
    { "Light", FontWeight::LIGHT },
    { "Medium", FontWeight::MEDIUM },
    { "Bold", FontWeight::BOLD },
};
FontWeight toFontWeight(const QString &type);

enum class FontProportion {
    MONO_SPACES,
    PROPORTIONAL
};
const static QMap<QString, FontProportion> toFontProportionMap = {
    { "MonoSpaced", FontProportion::MONO_SPACES },
    { "Proportional", FontProportion::PROPORTIONAL },
};
FontProportion toFontProportion(const QString &type);


class TextFlags
{
public:
    TextFlags();
private:
    QVector<TextFlag> m_flag;
};


class Font
{
public:
    Font();
    virtual ~Font();
};

class FontCharacteristics : public Font
{
public:
    FontCharacteristics(bool serifs, FontWeight weight, FontSlant slant, FontProportion m_proportion);
private:
    bool m_serifs;
    FontWeight m_weight;
    FontSlant m_slant;
    FontProportion m_proportion;
};

class FontReference : public Font
{
public:
    FontReference(QString reference);
private:
    QString m_reference;
};


class TextElement
{
public:
    TextElement(QString text, double bodySize, double verticalOffset, Font* font, GraphicBase::Color foreground);
private:
    QString m_text;
    double m_bodySize;
    double m_verticalOffset;
    std::optional<TextFlags> m_flags;
    Font* m_font;
    GraphicBase::Color m_foreground;
    std::optional<GraphicBase::Color> m_background;
};


class Text
{
public:
    Text(HorizontalAlignment ha, VerticalAlignment va,  const QVector<TextElement>& elements);
private:
    HorizontalAlignment m_horizontalAlignment;
    VerticalAlignment m_verticalAlignment;
    QVector<TextElement> m_elements;
};


class TextPoint : public Text
{
public:
    TextPoint(HorizontalAlignment ha, VerticalAlignment va,  const QVector<TextElement>& elements
              ,double rotation);

    std::optional<Symbol::AreaSymbolPlacement> areaPlacement() const;
    void setAreaPlacement(const Symbol::AreaSymbolPlacement &areaPlacement);

private:
    std::optional<GraphicBase::Vector> m_offset;
    double m_rotation;
    std::optional<Symbol::AreaSymbolPlacement> m_areaPlacement;
};


class TextLine : public Text
{
public:
    TextLine(HorizontalAlignment ha, VerticalAlignment va,  const QVector<TextElement>& elements
             , double startOffset, Symbol::LinePlacementMode placementMode);
private:
    double m_startOffset;
    std::optional<double> m_endOffset;
    Symbol::LinePlacementMode m_placementMode;
};


}
#endif // TEXT_PACKAGE_H
