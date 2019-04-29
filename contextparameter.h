#pragma once

#include <QMap>
#include <QVector>
#include <string>

class ContextParameter
{
public:

    enum Types { BOOLEAN, INTEGER, REAL, TEXT, DATE };

    QMap<Types, std::string> TypeToStr = {
        { BOOLEAN, "boolean" },
        { INTEGER, "integer" },
        { REAL, "real" },
        { TEXT, "text" },
        { DATE, "date" }
    };

    ContextParameter() = default;
    ContextParameter(std::string id, Types type, std::string defaultValue);

    std::string id() const;
    std::string type() const;
    std::string defaultValue() const;

    Types enumType() const;

private:
    Types m_enumType;
    std::string m_id;
    std::string m_type;
    std::string m_defaultValue;
};



class ContexParametrController {
public:
    ContexParametrController();

    QVector<ContextParameter> contextParameters() const;

private:
    QVector<ContextParameter> m_contextParameters;
};

