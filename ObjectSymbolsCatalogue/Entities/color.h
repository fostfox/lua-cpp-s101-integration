#pragma once

#include <QColor>
#include <QMap>


namespace pcatalogue {
class ColorProfile
{
public:
    ColorProfile() = default;
    ColorProfile(int r, int g, int b, double transparency);
    const QColor& color() const;

private:
    QColor m_color;
    double m_transparency;
};


class ColorPalette
{
public:
    ColorPalette() = default;
    void addColorProfile(const QString& paletteName, const QString& colorToken, const ColorProfile& color);
    ColorProfile colorProfile(const QString& paletteName, const QString& colorToken) const;

private:
    QMap<QString, QMap<QString, ColorProfile>> m_palette;
};
}
