#include "def_encoding.h"

using namespace def_encode;

DrawInstrs::DrawInstrs(const QString &defDrawInstrs)
{
    parse(defDrawInstrs);
}

void DrawInstrs::addInstr(const DrawInstr &drawInstr)
{
    m_drawInstrs.push_back(drawInstr);
}

const QVector<DrawInstr> &DrawInstrs::drawInstrs() const
{
    return m_drawInstrs;
}

void DrawInstrs::parse(const QString &drawInstr)
{
    const auto semicolon = ';';
    const auto colon = ':';
    const auto comma = ',';
    const auto ampersand = '&';
    const int firstElem = 0;
    const int secondElem = 1;

    auto elements = drawInstr.split(semicolon);
    for (const auto & element : elements){
        auto tmp = element.split(colon);
        auto commanad = tmp.at(firstElem);
        auto params = QStringList();
        if (tmp.size() > secondElem){
            params = tmp.at(secondElem).split(comma);
        }

        this->addInstr(DrawInstr(commanad, params));
    }
}

DrawInstr::DrawInstr(const QString &command, const QStringList &parametrList)
    :m_command(command), m_parametrList(parametrList)
{

}

const QString &DrawInstr::command() const
{
    return m_command;
}

const QStringList &DrawInstr::parametrList() const
{
    return m_parametrList;
}
