#include "gm_surface.h"


GM_Surface::GM_Surface(const Fe2spRef &exteriorRing)
    :m_exteriorRing(exteriorRing)
{

}

GM_Surface::GM_Surface(const Fe2spRef &exteriorRing, const QVector<Fe2spRef> &interiorRings)
    :m_exteriorRing(exteriorRing), m_interiorRings(interiorRings)
{

}

const Fe2spRef &GM_Surface::exteriorRing() const
{
    return m_exteriorRing;
}

const QVector<Fe2spRef> &GM_Surface::interiorRings() const
{
    return m_interiorRings;
}

void GM_Surface::setExteriorRing(const Fe2spRef &exter)
{
    m_exteriorRing = exter;
}

void GM_Surface::setInteriorRings(const QVector<Fe2spRef>& inter)
{
    m_interiorRings = inter;
}

void GM_Surface::addInteriorRing(const Fe2spRef &inter)
{
    m_interiorRings.push_back(inter);
}

bool GM_Surface::hasInteriorRings() const
{
    return m_interiorRings.empty();
}

bool GM_Surface::hasExteriorRing() const
{
    return m_exteriorRing.refId() != -1;
}

GM_Object::Type GM_Surface::getType() const
{
    return GM_Object::SURFACE;
}
