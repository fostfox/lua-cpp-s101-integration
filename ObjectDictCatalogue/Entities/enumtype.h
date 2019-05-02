#pragma once

#include <QString>
#include <QMap>
#include <QDebug>

template<typename Type>
QMap<Type, std::string>& modEnumToStrMap(const QMap<Type, std::string>& enumToStrMap)
{
    return const_cast<QMap<Type, std::string>&>(enumToStrMap);
}


template <typename Type> class EnumType
{
  public:
    EnumType() = default;
    EnumType(Type t);
    EnumType(std::string t);

    Type type() const;
    std::string toQString() const;

  protected:
    // Должна вызываться после инициазизации m_qstrToEnumMap из класса наследника
    void initEnumToStrMap();

  private:
    std::string toQString(Type t) const;
    Type toEnum(const std::string& t) const;

  protected:
    QMap<Type, std::string> m_enumToStrMap;
  private:
    QMap<std::string, Type> m_qstrToEnumMap;
    Type m_type;
    std::string m_strType;
};


template<typename T>
void checkUnsetEnummType(EnumType<T> e){
    if (e.type() == T::UNDEFINED){
        qFatal("Set to undefined type");
    }
}


template<typename Type>
EnumType<Type>::EnumType(Type t)
{
    if (t == Type::UNDEFINED){
        //qCritical() << "Set to undefined type";
    }
    m_type = t;
}

template<typename Type>
EnumType<Type>::EnumType(std::string t)
{
    m_strType = t;
}

template<typename Type>
Type EnumType<Type>::type() const
{
    return m_type;
}

template<typename Type>
std::string EnumType<Type>::toQString() const
{
    return toQString(m_type);
}

template<typename Type>
void EnumType<Type>::initEnumToStrMap()
{
    for (auto it = m_enumToStrMap.begin(); it != m_enumToStrMap.end(); ++it){
        auto newKey = it.value();
        auto newVal = it.key();
        m_qstrToEnumMap[newKey] = newVal;
    }
    if (!m_strType.empty()){
        m_type = toEnum(m_strType);
    } else {
        m_strType = toQString(m_type);
    }
}

template<typename Type>
std::string EnumType<Type>::toQString(Type t) const
{
    if(!m_enumToStrMap.contains(t)){
        qFatal("'m_enumToStrMap' has no key 't'");
    }
    return m_enumToStrMap[t];
}

template<typename Type>
Type EnumType<Type>::toEnum(const std::string &t) const
{
    if(!m_qstrToEnumMap.contains(t)){
        qFatal(QString("'m_enumToStrMap' has no key '%1'").arg(QString::fromStdString(t)).toUtf8());
    }
    return m_qstrToEnumMap[t];
}
