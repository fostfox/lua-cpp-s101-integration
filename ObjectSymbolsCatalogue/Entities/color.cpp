#include "color.h"


const QColor &pcatalogue::ColorProfile::color() const
{
    return m_color;
}

pcatalogue::ColorProfile::ColorProfile(int r, int g, int b, double transparency)
    :m_color(r, g, b), m_transparency(transparency)
{
}

void pcatalogue::ColorPalette::addColorProfile(const QString &paletteName, const QString &colorToken, const pcatalogue::ColorProfile &color)
{
    m_palette[paletteName][colorToken] = color;
}

pcatalogue::ColorProfile pcatalogue::ColorPalette::colorProfile(const QString &paletteName, const QString &colorToken) const
{
    if (!m_palette.contains(paletteName)){
        qFatal(("Where is no palette="+paletteName+"in map").toLocal8Bit());
    }

    const auto& pallette = m_palette[paletteName];
    if (!pallette.contains(colorToken)){
        qFatal(("Where is no colorToken="+colorToken+"in map").toLocal8Bit());
    }

    return pallette[colorToken];
}
