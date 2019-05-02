#pragma once

#include "../DataTypes/datatypes.h"
#include <vector>

class FC_ListedValue
{
  public:
    FC_ListedValue() = default;
    FC_ListedValue(
             CharacterString label
            ,CharacterString defenition
            ,PositiveInteger code
            ,CharacterString remarks
            ,CharacterString alias
            );

    CharacterString label() const;
    CharacterString defenition() const;
    PositiveInteger code() const;
    std::vector<CharacterString> remarks() const;
    std::vector<CharacterString> alias() const;

    void setLabel(const CharacterString &label);
    void setDefenition(const CharacterString &defenition);
    void setCode(const PositiveInteger &code);
    void addRemarks(const CharacterString &remark);
    void addAlias(const CharacterString &alias);

private:
    CharacterString m_label;
    CharacterString m_defenition;
    PositiveInteger m_code;
    std::vector<CharacterString> m_remarks;
    std::vector<CharacterString> m_alias;
};
