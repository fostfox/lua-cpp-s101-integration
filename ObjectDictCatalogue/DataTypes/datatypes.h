#pragma once

#include <string>

using Integer = int;
using PositiveInteger = unsigned int;
using NonNegativeInteger = unsigned int;
using Real = float;
using Boolean = bool;
using CharacterString = std::string;
using Date = std::string;
using Time = std::string;
using DateTime = std::string;
using TruncatedDate = std::string;

using ValueEnumAttrType = int;
using AttrCode = CharacterString;
using RoleCode = CharacterString;
using FeatureAssociationCode = CharacterString;
using FeatureTypeCode = CharacterString;
using InformationAssociationCode = CharacterString;
using InformationTypeCode = CharacterString;

//Booleaan(QString str) {
//    return str == "true";
//}

struct UnlimitedInteger {
    UnlimitedInteger() = default;
    UnlimitedInteger(Boolean infinite, Integer value = 0)
        : infinite(infinite), value(value) {}

    Boolean infinite;
    Integer value;
};


struct Multiplicity {
    Multiplicity() = default;
    Multiplicity(NonNegativeInteger lower, UnlimitedInteger upper)
        :lower(lower), upper(upper) {}
    NonNegativeInteger lower;
    UnlimitedInteger upper;
};


