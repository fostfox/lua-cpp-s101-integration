#include "gm_surface.h"


GM_Surface::GM_Surface(const Fe2spRef &exteriorRing)
    :m_exteriorRing(exteriorRing)
{

}

GM_Surface::GM_Surface(const Fe2spRef &exteriorRing, const QVector<Fe2spRef> &interiorRings)
    :m_exteriorRing(exteriorRing), m_interiorRings(interiorRings)
{

}

Fe2spRef GM_Surface::exteriorRing() const
{
    return m_exteriorRing;
}

QVector<Fe2spRef> GM_Surface::interiorRings() const
{
    return m_interiorRings;
}

bool GM_Surface::hasInteriorRings() const
{
    return m_interiorRings.empty();
}
