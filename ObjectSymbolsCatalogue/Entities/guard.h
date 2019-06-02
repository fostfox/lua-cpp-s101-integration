#pragma once

#include <optional>
#include <QMap>

#include "../Entities/color.h"
#include "../Entities/symbol.h"
#include "../../ObjectDrawCatalogue/Packages/linestyles_package.h"
#include "../../ObjectDrawCatalogue/Packages/areafills_package.h"
//namespace pcatalogue {
//class SymbolProfile;
//class ColorProfile;
//}
//namespace line_styles {
//class LineStyle;
//class LineSymbol;
//}
//namespace area_fills {
//class SymbolFill;
//class AreaCRSType;
//}
//namespace graphic_base {
//class Vector;
//}


class SymbolProfileBulder {
public:
    SymbolProfileBulder() = default;
    bool isReady() const;
    pcatalogue::SymbolProfile build() const;
    void setPath(const QString &path);
private:
    std::optional<QString> m_path;
};

class ColorProfileBulder{
public:
    ColorProfileBulder() = default;
    pcatalogue::ColorProfile build() const;

    void setR(int r);
    void setG(int g);
    void setB(int b);

private:
    std::optional<int> m_r;
    std::optional<int> m_g;
    std::optional<int> m_b;
};

class ColorPaletteBulder{
public:
    ColorPaletteBulder() = default;
    pcatalogue::ColorPalette build() const;

    void startNewPalette(const QString &name);
    void addColorProfile(const QString &colorToken, const pcatalogue::ColorProfile &color);
private:
    QString m_currentPalette;
    pcatalogue::ColorPalette m_cp;
};


class LineStyleBulder {
public:
    LineStyleBulder() = default;
    bool isReady() const;
    line_styles::LineStyle build() const;

    void setRefId(const QString & refId);
    void setIntervalLength(double g);
    void setWidth(double b);
    void setColor(const QString &ref);
    void addLineSymbol(const QString &symbolRef, double pos);
    void addDash(double start, double lenght);
private:
    std::optional<QString> m_refId;
    std::optional<double> m_intervalLength;
    std::optional<double> m_width;
    std::optional<QString> m_color;
    QVector<std::pair<QString, double>> m_refSymbolAndPos;
    QVector<std::pair<double, double>> m_dashStartLenght;
};


class SymbolFillBulder {
public:
    SymbolFillBulder() = default;
    bool isReady() const;
    area_fills::SymbolFill build() const;
    void setRefIf(const QString &ref);
    void setV1(const graphic_base::Vector& v);
    void setV2(const graphic_base::Vector& v);
    void setAreaCRSType(const QString& type);
    void setSymbolRef(const QString &ref);

private:
    std::optional<QString> m_refId;
    std::optional<graphic_base::Vector> m_v1;
    std::optional<graphic_base::Vector> m_v2;
    std::optional<QString> m_areaCRSType;
    std::optional<QString> m_symbolRef;
};
