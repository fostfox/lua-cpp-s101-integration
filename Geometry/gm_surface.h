#pragma once


#include "../ObjectMapCatalogue/Entries/feature.h"

#include <QVector>


class GM_Surface
{
public:
    GM_Surface(const Fe2spRef &exteriorRing);
    GM_Surface(const Fe2spRef &exteriorRing, const QVector<Fe2spRef> &interiorRings);

    Fe2spRef exteriorRing() const;
    QVector<Fe2spRef> interiorRings() const;

    bool hasInteriorRings() const;



private:
    Fe2spRef m_exteriorRing;
    QVector<Fe2spRef> m_interiorRings;
};
