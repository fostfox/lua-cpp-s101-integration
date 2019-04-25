#pragma once

#include <QString>
#include <QMap>


template<typename Type>
QMap<Type, QString>& modEnumToStrMap(const QMap<Type, QString>& enumToStrMap)
{
    return const_cast<QMap<Type, QString>&>(enumToStrMap);
}


template <typename Type> class EnumType
{
  public:
    EnumType() = default;
    EnumType(Type t);
    EnumType(QString t);

    Type type() const;
    QString toQString() const;

  protected:
    // Должна вызываться после инициазизации m_qstrToEnumMap из класса наследника
    void initEnumToStrMap();

  private:
    QString toQString(Type t) const;
    Type toEnum(const QString& t) const;

  protected:
    QMap<Type, QString> m_enumToStrMap;
  private:
    QMap<QString, Type> m_qstrToEnumMap;
    Type m_type;
    QString m_strType;
};



template<typename Type>
EnumType<Type>::EnumType(Type t)
{
    m_type = t;
}

template<typename Type>
EnumType<Type>::EnumType(QString t)
{
    m_strType = t;
}

template<typename Type>
Type EnumType<Type>::type() const
{
    return m_type;
}

template<typename Type>
QString EnumType<Type>::toQString() const
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
    if (!m_strType.isEmpty()){
        m_type = toEnum(m_strType);
    } else {
        m_strType = toQString(m_type);
    }
}

template<typename Type>
QString EnumType<Type>::toQString(Type t) const
{
    return m_enumToStrMap[t];
}

template<typename Type>
Type EnumType<Type>::toEnum(const QString &t) const
{
    return m_qstrToEnumMap[t];
}
