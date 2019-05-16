#pragma once
#include <vector>
#include <string>
#include <unordered_map>

class Attribute
{
public:
    enum class AttrTypes { INT, DOUBLE, STRING, LIST };
    Attribute();
    Attribute(int code, std::string alias, AttrTypes type,
              std::vector<std::string> value);
    const int& code() const;
    const std::string& alias() const;
    const AttrTypes& type() const;
    const std::vector<std::string>& value() const;
    void setCode(int code);
    void setAlias(std::string alias);
    void setType(const AttrTypes &type);
    void setValue(const std::vector<std::string> &value);

private:
    int m_code;
    std::string m_alias;
    AttrTypes m_type;
    std::vector<std::string> m_value;
};

class ComplexAttribute
{
public:
    ComplexAttribute();
    ComplexAttribute(int code, std::string alias, const std::vector<Attribute> &attrs);
    int code() const;
    std::string alias() const;
    std::vector<Attribute> attibutes() const;
    const Attribute &getAttributeByCode(std::string code) const;
    void setCode(int code);
    void setAlias(std::string alias);
    void addAttribute(Attribute attr);

    bool hasAttribute(const std::string &code) const;
private:
    int m_code;
    std::string m_alias;
    std::vector<Attribute> m_attrs;
    std::unordered_map<std::string, Attribute> m_code_to_attr;
};

class Fe2spRef
{
public:
    Fe2spRef();
    Fe2spRef(int refId, int refType, int orientation, int scamin, int scamax, std::string spatial);
    int refId() const;
    int refType() const;
    int orientation() const;
    int scamin() const;
    int scamax() const;
    const std::string spatial() const;

    void setRefId(int refId);
    void setRefType(int refType);
    void setOrientation(int orientation);
    void setScamin(int scamin);
    void setScamax(int scamax);
    void setSpatial(std::string spatial);
private:
    int m_refId = -1;
    int m_refType;
    int m_orientation;
    int m_scamin;
    int m_scamax;
    std::string m_spatial = "noGeometry";
};

class IsolatedPoint
{
public:
    IsolatedPoint(float latitude, float longitude);
    IsolatedPoint();

    float lat() const;
    float lon() const;

    void setLat(float lat);

    void setLon(float lon);

private:
    float m_lat;
    float m_lon;
};

class Feature
{
public:
    Feature(int m_id, int m_class, std::string alias
           , std::vector<Attribute> m_intAttrs
           , std::vector<ComplexAttribute> m_complexAttrs
           , Fe2spRef fe2sp
           /*, IsolatedPoint m_isolatedPoint*/);
    Feature();

    int id() const;
    int classId() const;
    const std::string &classAlias() const;
    std::vector<Attribute> intAttrs() const;
    std::vector<ComplexAttribute> complexAttrs() const;
    IsolatedPoint isolatedPoint() const;
    const Fe2spRef &fe2spRef() const;

    void setId(int id);
    void setClass(int classId);
    void setClassAlias(std::string classAlias);
    void setIntAttrs(std::vector<Attribute> intAttrs);
    void setComplexAttrs(const std::vector<ComplexAttribute> &complexAttrs);
    void setIsolatedPoint(const IsolatedPoint &isolatedPoint);
    void setFe2spRef(const Fe2spRef &fe2spRef);
    void addIntAttr(Attribute attr);
    void addComplexAttr(ComplexAttribute attr);
    const Attribute &getAttributeByCode(std::string code) const;
    const ComplexAttribute &getComplexAttributeByCode(const std::string &code) const;

    bool hasComplexAttribute(const std::string &code) const;
    bool hasSimpleAttribute(const std::string &code) const;

private:
    int m_id;
    int m_class;
    std::string m_classAlias;
    std::vector<Attribute> m_intAttrs;
    std::vector<ComplexAttribute> m_complexAttrs;
    Fe2spRef m_fe2spRef;
    IsolatedPoint m_isolatedPoint;
    std::unordered_map<std::string, Attribute> m_code_to_attr;
    std::unordered_map<std::string, ComplexAttribute> m_code_to_cAttr;
};
