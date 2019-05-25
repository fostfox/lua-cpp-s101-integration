#include "linestyles_package.h"

LineStyles::JoinStyle LineStyles::toJoinStyle(const QString &type)
{
    if (!toJoinStyleMap.contains(type)){
        qFatal("has no JoinStyle type in map");
    }
    return toJoinStyleMap[type];
}

LineStyles::CapStyle LineStyles::toCapStyle(const QString &type)
{
    if (!toCapStyleMap.contains(type)){
        qFatal("has no CapStyle type in map");
    }
    return toCapStyleMap[type];
}

QVector<Dash> LineStyle::dash() const
{
    return m_dash;
}

void LineStyle::setDash(const QVector<Dash> &dash)
{
    m_dash = dash;
}
