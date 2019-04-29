#include "fc_listedvalue.h"


CharacterString FC_ListedValue::label() const
{
    return m_label;
}

CharacterString FC_ListedValue::defenition() const
{
    return m_defenition;
}

PositiveInteger FC_ListedValue::code() const
{
    return m_code;
}

std::vector<CharacterString> FC_ListedValue::alias() const
{
    return m_alias;
}

std::vector<CharacterString> FC_ListedValue::remarks() const
{
    return m_remarks;
}

void FC_ListedValue::setLabel(const CharacterString &label)
{
    m_label = label;
}

void FC_ListedValue::setDefenition(const CharacterString &defenition)
{
    m_defenition = defenition;
}

void FC_ListedValue::setCode(const PositiveInteger &code)
{
    m_code = code;
}

void FC_ListedValue::addRemarks(const CharacterString &remark)
{
    m_remarks.push_back(remark);
}

void FC_ListedValue::addAlias(const CharacterString &alias)
{
    m_alias.push_back(alias);
}
