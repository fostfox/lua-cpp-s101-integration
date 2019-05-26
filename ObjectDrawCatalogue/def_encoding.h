#pragma once

#include <QStringList>
#include <QVector>


namespace def_encode {
class DrawInstr;
class DrawInstrs;
}


class def_encode::DrawInstr
{
public:
    DrawInstr() = default;
    DrawInstr(const QString &command, const QStringList &parametrList);
    const QString& command() const;
    const QStringList& parametrList() const;
private:
    QString m_command;
    QStringList m_parametrList;
};

class def_encode::DrawInstrs {
public:
    DrawInstrs() = default;
    DrawInstrs(const QString &defDrawInstrs);
    void addInstr(const DrawInstr &drawInstr);
    const QVector<DrawInstr>& drawInstrs() const;
private:
    void parse(const QString &drawInstr);
private:
    QVector<DrawInstr> m_drawInstrs;
};
