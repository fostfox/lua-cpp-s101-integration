#include "contextparameter.h"


ContextParameter::ContextParameter(std::string id, Types type, std::string defaultValue)
    :m_id(id), m_type(TypeToStr[type]), m_defaultValue(defaultValue)
{
    m_enumType = type;
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

ContextParameter::Types ContextParameter::enumType() const
{
    return m_enumType;
}



ContexParametrController::ContexParametrController()
{
    m_contextParameters = {
        ContextParameter("IGNORE_SCAMIN", ContextParameter::BOOLEAN, "false"),
        ContextParameter("RADAR_OVERLAY", ContextParameter::BOOLEAN, "false"),
        ContextParameter("SAFETY_DEPTH",  ContextParameter::REAL, "10.5"),
        ContextParameter("PLAIN_BOUNDARIES", ContextParameter::BOOLEAN, "false"),
        ContextParameter("SIMPLIFIED_POINTS", ContextParameter::BOOLEAN, "true"),
        ContextParameter("SAFETY_CONTOUR", ContextParameter::REAL, "10.5")
    };
}

QVector<ContextParameter> ContexParametrController::contextParameters() const
{
    return m_contextParameters;
}
