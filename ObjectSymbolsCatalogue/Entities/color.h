#pragma once

#include <QString>

namespace pcatalogue {
class ColorProfile;
class ColorPalette;
}


class pcatalogue::ColorProfile
{
public:
    ColorProfile(int r, int g, int b);
};


class pcatalogue::ColorPalette
{
public:
    ColorPalette();
    void addColorProfile(const QString& paletteName, const ColorProfile& color);
};
