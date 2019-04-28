#include "contextparameter.h"


ContextParameter::ContextParameter(std::string id, Types type, std::string defaultValue)
    :m_id(id), m_type(TypeToStr[type]), m_defaultValue(defaultValue)
{

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



ContexParametrController::ContexParametrController()
{
    m_contextParameters = {
        ContextParameter("IGNORE_SCAMIN", ContextParameter::BOOLEAN, "false"),
    };
}

QVector<ContextParameter> ContexParametrController::contextParameters() const
{
    return m_contextParameters;
}
