#include "contextparameter.h"
#include <QVariant>

using Type = contextparamstype::ContextParameterTypes;


ContextParameterType::ContextParameterType(contextparamstype::ContextParameterTypes t)
    :EnumType<Type>(t)
{
    initMaps();
}

ContextParameterType::ContextParameterType(std::string t)
    :EnumType<Type>(t)
{
    initMaps();
}

void ContextParameterType::initMaps()
{
    modEnumToStrMap(m_enumToStrMap) = {
            { Type::IGNORE_SCAMIN,      "IGNORE_SCAMIN" },
            { Type::RADAR_OVERLAY,      "RADAR_OVERLAY" },
            { Type::SAFETY_DEPTH,       "SAFETY_DEPTH" },
            { Type::PLAIN_BOUNDARIES,   "PLAIN_BOUNDARIES" },
            { Type::SIMPLIFIED_POINTS,  "SIMPLIFIED_POINTS" },
            { Type::SAFETY_CONTOUR,     "SAFETY_CONTOUR" },
            { Type::SHALLOW_CONTOUR,    "SHALLOW_CONTOUR" },
            { Type::DEEP_CONTOUR,       "DEEP_CONTOUR" },
            { Type::SHALLOW_PATTERN,    "SHALLOW_PATTERN" },
            { Type::TWO_SHADES,         "TWO_SHADES" },
            { Type::NATIONAL_LANGUAGE,  "NATIONAL_LANGUAGE" },
            { Type::SHOW_ISOLATED_DANGERS_IN_SHALLOW_WATERS,  "SHOW_ISOLATED_DANGERS_IN_SHALLOW_WATERS" },
            { Type::UNDEFINED, "UNDEFINED"}
    };
    initEnumToStrMap();
}

ContextParameter::ContextParameter(const ContextParameterType &name, const QVariant &defaultValue)
{
    m_id = name.toQString();
    m_defaultValue = defaultValue.toString().toStdString();

    switch (defaultValue.type()) {
    case QVariant::Int    : { m_enumType = ValueType::INTEGER;  } break;
    case QVariant::Double : { m_enumType = ValueType::REAL;     } break;
    case QVariant::Bool   : { m_enumType = ValueType::BOOLEAN;  } break;
    case QVariant::String : { m_enumType = ValueType::TEXT;     } break;
    case QVariant::Date   : { m_type     = ValueType::DATE;     } break;
    default: {
        qFatal("ContextParameterType value type");
    }
    }
    m_type = TypeToStr[m_enumType];
}

std::string ContextParameter::id() const
{
    return m_id;
}

std::string ContextParameter::type() const
{
    return m_type;
}

std::string ContextParameter::defaultValue() const
{
    return m_defaultValue;
}

ContextParameter::ValueType ContextParameter::enumType() const
{
    return m_enumType;
}



ContexParametrController::ContexParametrController(const QVector<ContextParameter> &contextParameters)
    :m_contextParameters(contextParameters)
{
}

QVector<ContextParameter> ContexParametrController::contextParameters() const
{
    return m_contextParameters;
}

