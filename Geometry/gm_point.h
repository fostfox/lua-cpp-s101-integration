#pragma once

#include "../ObjectDictCatalogue/DataTypes/datatypes.h"


class GM_Point
{
public:
    GM_Point(Real x, Real y);
    GM_Point(Real x, Real y, Real z);

private:
    Real x;
    Real y;
    Real z;
};
