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
    SymbolProfileBulder();
    bool isReady() const;
    pcatalogue::SymbolProfile build() const;
    void setPath(const QString &path);
private:
    std::optional<QString> m_path;
};


class ColorPaletteBulder{
public:
    ColorPaletteBulder();
    void startNewPalette(const QString &name);
    void addColorProfile(const QString& token, const graphic_base::Color& color);
};


class LineStyleBulder {
public:
    LineStyleBulder();
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
    QVector<line_styles::LineSymbol> refSymbolAndPos;
    QVector<line_styles::Dash> dashStartLenght;
};


class SymbolFillBulder {
public:
    SymbolFillBulder();
    bool isReady() const;
    area_fills::SymbolFill build() const;
    void setRefIf(const QString &ref);
    void setV1(const graphic_base::Vector& v);
    void setV2(const graphic_base::Vector& v);
    void setAreaCRSType(const QString& type);
    void setSymbolRef(const QString &ref);

private:
    QString m_refId;
    graphic_base::Vector m_v1;
    graphic_base::Vector m_v2;
    QString m_areaCRSType;
    QString symbolRef;
};
