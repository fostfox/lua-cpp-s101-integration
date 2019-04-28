#pragma once


#include "../ObjectMapCatalogue/Entries/feature.h"


class GM_Surface
{
public:
    GM_Surface(const Fe2spRef &exteriorRing);
    GM_Surface(const Fe2spRef &exteriorRing, const QVector<Fe2spRef> interiorRings);

private:

};
