#include "fc_item.h"


FC_Item::FC_Item(CharacterString name
                 ,CharacterString defenition
                 ,CharacterString code
                 ,QVector<CharacterString> remarks
                 ,QVector<CharacterString> alias)
    :m_name(name)
    ,m_defenition(defenition)
    ,m_code(code)
    ,m_remarks(remarks)
    ,m_alias(alias)
{

}

CharacterString FC_Item::name() const
{
    return m_name;
}

CharacterString FC_Item::defenition() const
{
    return m_defenition;
}

CharacterString FC_Item::code() const
{
    return m_code;
}

QVector<CharacterString> FC_Item::remarks() const
{
    return m_remarks;
}

QVector<CharacterString> FC_Item::alias() const
{
    return m_alias;
}

void FC_Item::setName(const CharacterString &name)
{
    m_name = name;
}

void FC_Item::setDefenition(const CharacterString &defenition)
{
    m_defenition = defenition;
}

void FC_Item::setCode(const CharacterString &code)
{
    m_code = code;
}

void FC_Item::addRemarks(const CharacterString &remark)
{
    m_remarks.push_back(remark);
}

void FC_Item::addAlias(const CharacterString &alias)
{
    m_alias.push_back(alias);
}
