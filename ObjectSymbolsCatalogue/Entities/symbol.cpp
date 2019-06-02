#include "symbol.h"

pcatalogue::SymbolProfile::SymbolProfile(const QString &path)
    :m_svgItem(new QGraphicsSvgItem(path))
    ,m_pixmap(QPixmap(path))
{

}

QGraphicsSvgItem *pcatalogue::SymbolProfile::svgItem() const
{
    return m_svgItem;
}

const QPixmap &pcatalogue::SymbolProfile::pixmap() const
{
    return m_pixmap;
}

