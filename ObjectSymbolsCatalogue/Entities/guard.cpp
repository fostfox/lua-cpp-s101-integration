#include "guard.h"

#include "../../ObjectDrawCatalogue/Builder/drawinstructionparser_init.hpp"

static commands_initial_state::LineStylemDefault DEFAULT_LINE_STYLE;
static commands_initial_state::TransformDefault DEFAULT_TRANSFORM;


bool LineStyleBulder::isReady() const
{
    return m_color.has_value()
        && m_refId.has_value()
        && m_width.has_value()
            ;
}

line_styles::LineStyle LineStyleBulder::build() const
{
    graphic_base::Color colorG(m_color.value(), DEFAULT_LINE_STYLE.transparency);
    graphic_base::Pen penG(m_width.value(), colorG);

    line_styles::LineStyle lineStyle(DEFAULT_LINE_STYLE.offset
                        , DEFAULT_LINE_STYLE.capStyle
                        , DEFAULT_LINE_STYLE.joinStyle
                        , penG
                        );
    if (m_intervalLength) {
        lineStyle.setIntervalLength(m_intervalLength.value());
    }

    for (const auto& params : m_dashStartLenght){
        lineStyle.addDash(line_styles::Dash(params.first, params.second));
    }
    for (const auto& params : m_refSymbolAndPos){
        line_styles::LineSymbol symbol(params.first
                          , DEFAULT_LINE_STYLE.rotation
                          , DEFAULT_LINE_STYLE.scaleFactor
                          , DEFAULT_LINE_STYLE.crsType
                          , params.second);
        lineStyle.addSymbol(symbol);
    }

    return lineStyle;
}

void LineStyleBulder::setRefId(const QString &refId)
{
    m_refId = refId;
}

void LineStyleBulder::setIntervalLength(double g)
{
    m_intervalLength = g;
}

void LineStyleBulder::setWidth(double b)
{
    m_width = b;
}

void LineStyleBulder::setColor(const QString &ref)
{
    m_color = ref;
}

void LineStyleBulder::addLineSymbol(const QString &symbolRef, double pos)
{
    m_refSymbolAndPos.push_back({symbolRef, pos});
}

void LineStyleBulder::addDash(double start, double lenght)
{
    m_dashStartLenght.push_back({start, lenght});
}

bool SymbolFillBulder::isReady() const
{
    return m_v1 && m_v2 && m_refId && m_symbolRef && m_areaCRSType;
}

area_fills::SymbolFill SymbolFillBulder::build() const
{
    symbol::Symbol symbol(m_symbolRef.value()
                          ,DEFAULT_TRANSFORM.rotation
                          ,DEFAULT_TRANSFORM.rotationCRS
                          ,graphic_base::Vector(DEFAULT_TRANSFORM.xOffsetMM, DEFAULT_TRANSFORM.yOffsetMM)
                          );
    return area_fills::SymbolFill(symbol, m_v1.value(), m_v2.value());
}

void SymbolFillBulder::setRefIf(const QString &ref)
{
    m_refId = ref;
}

void SymbolFillBulder::setV1(const graphic_base::Vector &v)
{
    m_v1 = v;
}

void SymbolFillBulder::setV2(const graphic_base::Vector &v)
{
    m_v2 = v;
}

void SymbolFillBulder::setAreaCRSType(const QString &type)
{
    m_areaCRSType = type;
}

void SymbolFillBulder::setSymbolRef(const QString &ref)
{
    m_symbolRef = ref;
}

bool SymbolProfileBulder::isReady() const
{
    if (m_path.has_value()){
        return true;
    }
    return false;
}

pcatalogue::SymbolProfile SymbolProfileBulder::build() const
{
    return pcatalogue::SymbolProfile(m_path.value());
}

void SymbolProfileBulder::setPath(const QString &path)
{
    m_path = path;
}

pcatalogue::ColorPalette ColorPaletteBulder::build() const
{
    return m_cp;
}

void ColorPaletteBulder::startNewPalette(const QString &name)
{
    m_currentPalette = name;
}

void ColorPaletteBulder::addColorProfile(const QString &colorToken, const pcatalogue::ColorProfile& color)
{
    if(!m_currentPalette.isEmpty()){
        m_cp.addColorProfile(m_currentPalette, colorToken, color);
    }
}

pcatalogue::ColorProfile ColorProfileBulder::build() const
{
    return pcatalogue::ColorProfile(m_r.value(), m_g.value(), m_b.value(), DEFAULT_LINE_STYLE.transparency);
}

void ColorProfileBulder::setR(int r)
{
    m_r = r;
}

void ColorProfileBulder::setG(int g)
{
    m_g = g;
}

void ColorProfileBulder::setB(int b)
{
    m_b = b;
}
