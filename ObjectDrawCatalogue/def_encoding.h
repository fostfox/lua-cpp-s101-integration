#ifndef DEF_ENCODING_H
#define DEF_ENCODING_H

#include <QStringList>
#include <QVector>


namespace def_encode {


class DrawInstr
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

class DrawInstrs {
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



} // namespace def_encode
#endif // DEF_ENCODING_H
