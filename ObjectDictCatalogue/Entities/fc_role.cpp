#include "fc_role.h"


FC_Role::FC_Role()
{

}

FC_Role::FC_Role(const FC_Item &header)
    :m_header(header)
{

}

const FC_Item &FC_Role::header() const
{
    return m_header;
}
