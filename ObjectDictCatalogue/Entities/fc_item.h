#pragma once

#include <vector>
#include "../DataTypes/datatypes.h"


class FC_Item
{
public:
    FC_Item() = default;
    FC_Item(const CharacterString& name
           , const CharacterString& defenition
           , const CharacterString& code
           , const CharacterString& remarks
           , const std::vector<CharacterString>& alias
            );

    const CharacterString& name() const;
    const CharacterString& defenition() const;
    const CharacterString& code() const;
    const CharacterString& remarks() const;
    const std::vector<CharacterString>& alias() const;

    void setName(const CharacterString &name);
    void setDefenition(const CharacterString &defenition);
    void setCode(const CharacterString &code);
    void setRemarks(const CharacterString &remark);
    void addAlias(const CharacterString &alias);

private:
    CharacterString m_name;
    CharacterString m_defenition;
    CharacterString m_code;
    CharacterString m_remarks;
    std::vector<CharacterString> m_alias;
};
