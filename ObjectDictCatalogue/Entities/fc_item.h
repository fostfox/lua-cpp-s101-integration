#pragma once

#include <QVector>
#include "../DataTypes/datatypes.h"


class FC_Item
{
public:
    FC_Item() = default;
    FC_Item(CharacterString name
           , CharacterString defenition
           , CharacterString code
           , std::vector<CharacterString> remarks
           , std::vector<CharacterString> alias
            );

    CharacterString name() const;
    CharacterString defenition() const;
    CharacterString code() const;
    const std::vector<CharacterString>& remarks() const;
    const std::vector<CharacterString>& alias() const;

    void setName(const CharacterString &name);
    void setDefenition(const CharacterString &defenition);
    void setCode(const CharacterString &code);
    void addRemarks(const CharacterString &remark);
    void addAlias(const CharacterString &alias);

private:
    CharacterString m_name;
    CharacterString m_defenition;
    CharacterString m_code;
    std::vector<CharacterString> m_remarks;
    std::vector<CharacterString> m_alias;
};
