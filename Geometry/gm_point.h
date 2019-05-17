#pragma once

#include "../ObjectDictCatalogue/DataTypes/datatypes.h"
#include "gm_object.h"
#include <optional>

//namespace std{
//template< class T >
//class optional;

//}


class GM_Point : public GM_Object
{
public:
    GM_Point() = default;
    GM_Point(const std::string& x, const std::string& y);
    GM_Point(const std::string& x, std::string y, const std::string& z);

    bool hasZ() const;
    Type getType() const;

    const std::string& x() const;
    const std::string& y() const;
    const std::string& z() const;

private:
    std::string m_x;
    std::string m_y;
    std::optional<std::string> m_z;
};
