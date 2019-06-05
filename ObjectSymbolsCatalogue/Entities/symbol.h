#pragma once

#include <QString>
#include <QGraphicsSvgItem>
#include <QPixmap>

namespace pcatalogue {
class SymbolProfile
{
public:
    SymbolProfile() = default;
    SymbolProfile(const QString& path);
    //QGraphicsSvgItem* svgItem() const;
    const QPixmap &pixmap() const;

private:
    //QGraphicsSvgItem* m_svgItem;
    QPixmap m_pixmap;
};
}
