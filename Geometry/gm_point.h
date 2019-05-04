#pragma once

#include "../ObjectDictCatalogue/DataTypes/datatypes.h"
#include "gm_object.h"

namespace std{
template< class T >
class optional;

}


class GM_Point : public GM_Object
{
public:
    GM_Point() = default;
    GM_Point(std::string x, std::string y);
    GM_Point(std::string x, std::string y, std::string z);

    ~GM_Point() = default;


    bool hasZ() const;
    Type getType() const;

    std::string x() const;
    std::string y() const;
    std::string z() const;

private:
    std::string m_x;
    std::string m_y;
    std::optional<std::string>* m_z;
};
