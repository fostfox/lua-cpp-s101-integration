#include "symbol.h"

#include <QFile>
#include <QPainter>

pcatalogue::SymbolProfile::SymbolProfile(const QString &path)
{
    if (QFile::exists(path)){
        m_pixmap = QPixmap(path);
    } else {
        m_pixmap = QPixmap(20,20);
        QPainter painter(&m_pixmap);
        painter.setBrush(Qt::red);
        painter.setPen(Qt::blue);
        painter.drawRect(0,0,30,30);
        painter.drawLine(0,0,30,30);
        painter.drawLine(0,30,30,0);
        painter.end();
    }
}

//QGraphicsSvgItem *pcatalogue::SymbolProfile::svgItem() const
//{
//    return m_svgItem;
//}

const QPixmap &pcatalogue::SymbolProfile::pixmap() const
{
    return m_pixmap;
}

