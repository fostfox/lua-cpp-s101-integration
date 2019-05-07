#pragma once

#include <QMap>
#include <QVector>

#include "../ObjectDictCatalogue/Entities/enumtype.h"

class QVariant;

namespace contextparamstype {
enum  ContextParameterTypes {
    IGNORE_SCAMIN,
    RADAR_OVERLAY,
    SAFETY_DEPTH,
    PLAIN_BOUNDARIES,
    SIMPLIFIED_POINTS,
    SAFETY_CONTOUR,
    SHALLOW_CONTOUR,
    DEEP_CONTOUR,
    SHALLOW_PATTERN,
    TWO_SHADES,
    NATIONAL_LANGUAGE,
    SHOW_ISOLATED_DANGERS_IN_SHALLOW_WATERS,

    UNDEFINED
};
}


class ContextParameterType : public EnumType<contextparamstype::ContextParameterTypes>
{
public:
  ContextParameterType(contextparamstype::ContextParameterTypes t);
  ContextParameterType(std::string t);

private:
  void initMaps();
};



class ContextParameter
{
public:
    enum ValueType { BOOLEAN, INTEGER, REAL, TEXT, DATE };

    QMap<ValueType, std::string> TypeToStr = {
        { BOOLEAN, "boolean" },
        { INTEGER, "integer" },
        { REAL, "real" },
        { TEXT, "text" },
        { DATE, "date" }
    };

    ContextParameter() = default;
    ContextParameter(const ContextParameterType& name, const QVariant &defaultValue);

    std::string id() const;
    std::string type() const;
    std::string defaultValue() const;

    ValueType enumType() const;

private:  
    std::string m_id;
    std::string m_type;
    std::string m_defaultValue;
    ValueType m_enumType;
};



class ContexParametrController {
public:
    ContexParametrController() = default;
    ContexParametrController(const QVector<ContextParameter>& contextParameters);


    QVector<ContextParameter> contextParameters() const;

private:
    QVector<ContextParameter> m_contextParameters;
};

