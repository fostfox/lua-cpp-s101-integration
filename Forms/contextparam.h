#ifndef CONTEXTPARAM_H
#define CONTEXTPARAM_H

#include <QWidget>

class ContexParametrController;


namespace Ui {
class ContextParam;
}

class ContextParam : public QWidget
{
    Q_OBJECT

public:
    explicit ContextParam(QWidget *parent = nullptr);
    ~ContextParam();

    ContexParametrController* params();

signals:
    void updateParams();

private slots:
    void on_buttonBox_rejected();

    void on_buttonBox_accepted();

private:
    Ui::ContextParam *ui;
    ContexParametrController* m_controller;
};

#endif // CONTEXTPARAM_H
