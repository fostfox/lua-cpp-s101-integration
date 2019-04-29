#pragma once

#include "../ObjectMapCatalogue/Entries/feature.h"

#include <QVector>


class GM_CompositeCurve
{
public:
    GM_CompositeCurve(const QVector<Fe2spRef> &curveAssociations);

    QVector<Fe2spRef> curveAssociations() const;

private:
    QVector<Fe2spRef> m_curveAssociations;
};
