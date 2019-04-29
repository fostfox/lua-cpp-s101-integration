#pragma once

#include "../ObjectDictCatalogue/DataTypes/datatypes.h"


namespace std{
template< class T >
class optional;

}


class GM_Point
{
public:
    GM_Point() = default;
    GM_Point(Real x, Real y);
    GM_Point(Real x, Real y, Real z);

    ~GM_Point();


    bool hasZ() const;

    Real x() const;
    Real y() const;
    Real z() const;

private:
    Real m_x;
    Real m_y;
    std::optional<Real>* m_z;
};
