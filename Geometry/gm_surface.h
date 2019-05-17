#pragma once


#include "../ObjectMapCatalogue/Entries/feature.h"
#include "gm_object.h"
#include <QVector>


class GM_Surface : public GM_Object
{
public:
    GM_Surface() = default;
    GM_Surface(const Fe2spRef &exteriorRing);
    GM_Surface(const Fe2spRef &exteriorRing, const QVector<Fe2spRef> &interiorRings);
    ~GM_Surface() = default;

    const Fe2spRef& exteriorRing() const;
    const QVector<Fe2spRef>& interiorRings() const;

    void setExteriorRing(const Fe2spRef &exter);
    void setInteriorRings(const QVector<Fe2spRef> &inter);

    void addInteriorRing(const Fe2spRef &inter);

    bool hasInteriorRings() const;
    bool hasExteriorRing() const;
    Type getType() const;


private:
    Fe2spRef m_exteriorRing;
    QVector<Fe2spRef> m_interiorRings;
};
