#pragma once

#include <optional>
#include <QMap>

#include "../Entities/color.h"
#include "../Entities/symbol.h"
#include "../../ObjectDrawCatalogue/Packages/linestyles_package.h"

namespace pcatalogue {
class SymbolProfile;
class ColorProfile;
}
namespace line_styles {
class LineStyle;
class LineSymbol;
}
namespace area_fills {
class SymbolFill;
class AreaCRSType;
}
namespace graphic_base {
class Vector;
}


class SymbolProfileBulder {
public:
    bool isReady() const;
    pcatalogue::SymbolProfile symbol() const;
    void setPath(const QString &path);
private:
    std::optional<QString> m_path;
};


class ColorProfileBulder {
public:
    bool isReady() const;
    pcatalogue::SymbolProfile symbol() const;
    void setR(int r);
    void setG(int g);
    void setB(int b);
private:
    std::optional<int> m_r;
    std::optional<int> m_g;
    std::optional<int> m_b;
};


class LineStyleBulder {
public:
    bool isReady() const;
    pcatalogue::SymbolProfile symbol() const;
    void setRefId(int r);
    void setIntervalLength(int g);
    void setWidth(int b);
    void setColor( );
    void addLineSymbol(const QString &symbolRef, double pos);
    void addDash(double start, double lenght);
private:
    std::optional<QString> m_refId;
    std::optional<double> m_intervalLength;
    std::optional<double> m_width;
    std::optional<QString> m_color;
    QVector<line_styles::LineSymbol> refSymbolAndPos;
    QVector<line_styles::Dash> dashStartLenght;
};


class SymbolFillBulder
{
private:
    QString refId;
    graphic_base::Vector v1;
    graphic_base::Vector v2;
    QString AreaCRSType;
};
