#pragma once

#include "../ObjectMapCatalogue/Entries/feature.h"
#include "gm_object.h"
#include <QVector>


class GM_CompositeCurve : public GM_Object
{
public:
    GM_CompositeCurve() = default;
    GM_CompositeCurve(const QVector<Fe2spRef> &curveAssociations);
    ~GM_CompositeCurve() = default;

    void addCurveAssotiation(const Fe2spRef& curveAssotiation);
    QVector<Fe2spRef> curveAssociations() const;
    Type getType() const;

private:
    QVector<Fe2spRef> m_curveAssociations;
};
