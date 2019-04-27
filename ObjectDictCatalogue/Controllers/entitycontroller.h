#pragma once

#include <QMap>
#include <QVector>
#include <QString>

template <typename FC_T>
class EntityController
{
  public:
    EntityController();

    void addType(const FC_T& ft);
    FC_T type(const std::string& featureCode) const;
    const QVector<FC_T>& types() const;
    const std::vector<std::string>& codes() const;

private:
    QVector<FC_T> m_types;
    QMap<std::string, FC_T> m_codeToPTypeMap;
    std::vector<std::string> m_codes;
};


//-----------------------------------------------------------------------------

template<typename FC_T>
EntityController<FC_T>::EntityController()
{

}

template<typename FC_T>
void EntityController<FC_T>::addType(const FC_T &ft)
{
    std::string code = ft.header().code();
    m_types.push_back(ft);
    m_codes.push_back(code);
    m_codeToPTypeMap.insert(code, m_types.last());
}

template<typename FC_T>
FC_T EntityController<FC_T>::type(const std::string& featureCode) const
{
    if (!m_codeToPTypeMap.contains(featureCode)){
        throw "No element in map";
    }
    return m_codeToPTypeMap[featureCode];
}

template<typename FC_T>
const QVector<FC_T>& EntityController<FC_T>::types() const
{
    return m_types;
}

template<typename FC_T>
const std::vector<std::string>& EntityController<FC_T>::codes() const
{
    return m_codes;
}
