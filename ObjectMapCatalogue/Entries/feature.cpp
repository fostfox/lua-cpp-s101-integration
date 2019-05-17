#include "feature.h"
#include <iostream>
#include <QString>

Attribute::Attribute()
{

}

Attribute::Attribute(int code, const std::string &alias, const Attribute::AttrTypes &type, const std::vector<std::string> &value)
    :m_code(code), m_type(type), m_alias(alias),m_value(value)
{

}

const int &Attribute::code() const
{
    return m_code;
}

const std::string &Attribute::alias() const
{
    return m_alias;
}

const Attribute::AttrTypes &Attribute::type() const
{
    return m_type;
}

const std::string Fe2spRef::spatial() const
{
    return m_spatial;
}

const std::vector<std::string> &Attribute::value() const
{
    return m_value;
}

void Attribute::setCode(int code)
{
    //std::cout << "code: " << code << std::endl;
    m_code = code;
}

void Attribute::setAlias(std::string alias)
{
    //std::cout << "alias: " << alias << std::endl;
    m_alias = alias;
}

void Attribute::setType(const AttrTypes &type)
{
    m_type = type;
}

void Fe2spRef::setSpatial(std::string spatial)
{
    m_spatial = spatial;
}

void Attribute::setValue(const std::vector<std::string> &value)
{
    //std::cout << "code: " << value.toString().toStdString() << std::endl;
    m_value = value;
}

Fe2spRef::Fe2spRef()
{

}

Fe2spRef::Fe2spRef(int refId, int refType, int orientation, int scamin,
                   int scamax, std::string spatial)
    :m_refId(refId), m_refType(refType), m_orientation(orientation), m_scamin(scamin),
      m_scamax(scamax), m_spatial(spatial)
{

}

int Fe2spRef::refId() const
{
    return m_refId;
}

int Fe2spRef::refType() const
{
    return m_refType;
}

int Fe2spRef::orientation() const
{
    return m_orientation;
}

int Fe2spRef::scamin() const
{
    return m_scamin;
}

int Fe2spRef::scamax() const
{
    return m_scamax;
}

void Fe2spRef::setRefId(int refId)
{
    m_refId = refId;
}

void Fe2spRef::setRefType(int refType)
{
    m_refType = refType;
}

void Fe2spRef::setOrientation(int orientation)
{
    m_orientation = orientation;
}

void Fe2spRef::setScamin(int scamin)
{
    m_scamin = scamin;
}

void Fe2spRef::setScamax(int scamax)
{
    m_scamax = scamax;
}

IsolatedPoint::IsolatedPoint(float latitude, float longitude)
    :m_lat(latitude), m_lon(longitude)
{

}

IsolatedPoint::IsolatedPoint()
{

}

float IsolatedPoint::lat() const
{
    return m_lat;
}

float IsolatedPoint::lon() const
{
    return m_lon;
}

void IsolatedPoint::setLat(float lat)
{
    m_lat = lat;
}

void IsolatedPoint::setLon(float lon)
{
    m_lon = lon;
}

Feature::Feature(int id
                , int classId
                ,const  std::string &alias
                , const std::vector<Attribute> &intAttrs
                , const std::vector<ComplexAttribute> &complexAttrs
                , const Fe2spRef &fe2sp
                /*, IsolatedPoint isolatedPoint*/)
    : m_id(id)
    , m_class(classId)
    , m_classAlias(alias)
    , m_intAttrs(intAttrs)
    , m_complexAttrs(complexAttrs)
    , m_fe2spRef(fe2sp)
    /*, m_isolatedPoint(isolatedPoint)*/
{

    for (auto attr : intAttrs)
        m_code_to_attr.insert(std::make_pair(attr.alias(), attr));
    for (auto attr : complexAttrs)
        m_code_to_cAttr.insert(std::make_pair(attr.alias(), attr));
}

Feature::Feature()
{

}

int Feature::id() const
{
    return m_id;
}

const std::string& Feature::classAlias() const{
    return m_classAlias;
}

const std::vector<Attribute>& Feature::intAttrs() const
{
    return m_intAttrs;
}

const IsolatedPoint &Feature::isolatedPoint() const
{
    return m_isolatedPoint;
}

void Feature::setId(int id)
{
    m_id = id;
}

void Feature::setIntAttrs(std::vector<Attribute> intAttrs)
{
    m_intAttrs = intAttrs;
    for (auto attr : intAttrs)
        m_code_to_attr.insert(std::make_pair(attr.alias(), attr));
}

void Feature::setComplexAttrs(const std::vector<ComplexAttribute> &complexAttrs)
{
    m_complexAttrs = complexAttrs;
    for (auto attr : complexAttrs)
        m_code_to_cAttr.insert(std::make_pair(attr.alias(), attr));
}

void Feature::setIsolatedPoint(const IsolatedPoint &isolatedPoint)
{
    m_isolatedPoint = isolatedPoint;
}

void Feature::addIntAttr(Attribute attr)
{
    m_intAttrs.push_back(attr);
    m_code_to_attr.insert(std::make_pair(attr.alias(), attr));
}

void Feature::addComplexAttr(ComplexAttribute attr)
{
    m_complexAttrs.push_back(attr);
    m_code_to_cAttr.insert(std::make_pair(attr.alias(), attr));
}

const Attribute& Feature::getAttributeByCode(std::string code) const
{
    if(m_code_to_attr.find(code) == m_code_to_attr.end()){
        qFatal(QString("'m_code_to_attr' has no key '%1'").arg(QString::fromStdString(code)).toUtf8());
    }
    return m_code_to_attr.at(code);
}

const ComplexAttribute& Feature::getComplexAttributeByCode(const std::string &code) const
{
    if(m_code_to_cAttr.find(code) == m_code_to_cAttr.end()){
        qFatal(QString("'m_code_to_cAttr' has no key '%1'").arg(QString::fromStdString(code)).toUtf8());
    }
    return m_code_to_cAttr.at(code);
}

bool Feature::hasComplexAttribute(const std::string& code) const
{
    return m_code_to_cAttr.count(code) != 0;
}

bool Feature::hasSimpleAttribute(const std::string &code) const
{
    return m_code_to_attr.find(code) != m_code_to_attr.end();
}

const Fe2spRef &Feature::fe2spRef() const
{
    return m_fe2spRef;
}

void Feature::setFe2spRef(const Fe2spRef &fe2spRef)
{
    m_fe2spRef = fe2spRef;
}

void Feature::setClass(int classId)
{
    m_class = classId;
}

void Feature::setClassAlias(const std::string &classAlias)
{
    m_classAlias = classAlias;
}

const std::vector<ComplexAttribute> &Feature::complexAttrs() const
{
    return m_complexAttrs;
}

int Feature::classId() const
{
    return m_class;
}

ComplexAttribute::ComplexAttribute()
{

}

ComplexAttribute::ComplexAttribute(int code, const std::string &alias, const std::vector<Attribute> &attrs)
    :   m_attrs(attrs), m_alias(alias), m_code(code)
{
    for (const auto &attr : attrs)
        m_code_to_attr.insert(std::make_pair(attr.alias(), attr));
}

int ComplexAttribute::code() const
{
    return m_code;
}

std::string ComplexAttribute::alias() const
{
    return m_alias;
}

const std::vector<Attribute>& ComplexAttribute::attibutes() const
{
    return m_attrs;
}

const Attribute &ComplexAttribute::getAttributeByCode(std::string code) const
{
    if(m_code_to_attr.find(code) == m_code_to_attr.end()){
        qFatal(QString("'m_code_to_attr' has no key '%1'").arg(QString::fromStdString(code)).toUtf8());
    }
    return m_code_to_attr.at(code);
}

void ComplexAttribute::setCode(int code)
{
    m_code = code;
}

void ComplexAttribute::setAlias(const std::string &alias)
{
    m_alias = alias;
}

void ComplexAttribute::addAttribute(const Attribute &attr)
{
    m_attrs.push_back(attr);
    m_code_to_attr.insert(std::make_pair(attr.alias(), attr));
}

bool ComplexAttribute::hasAttribute(const std::string &code) const
{
    return m_code_to_attr.find(code) != m_code_to_attr.end();
}
