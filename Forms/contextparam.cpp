#include "contextparam.h"
#include "ui_contextparam.h"

#include "../config.h"

#include "ObjectMapCatalogue/contextparameter.h"


ContextParam::ContextParam(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::ContextParam)
{
    ui->setupUi(this);

//    using namespace contextparams;
//    ui->safetyDepthValue->setValue(PARAMS[SAFETY_DEPTH].defaultValue());
//    ui->shallowContourValue->setValue(con)
//    ui->safetyContourValue->value() },
//    ui->twoShadesValue->isChecked() },
//    ui->deepContourValue->value() },
//    ui->shallowPatternValue->isChecked() },
//    ui->showDangersValue->isChecked() },
//    ui->plainBoundariesValue->isChecked() },
//    ui->simplifiedPointsValue->isChecked() },
//    ui->radarOverlayValue->isChecked() },
//    ui->ignoreScaminValue->isChecked() },
//    ui->nationalLanguageValue->currentText() },
}

ContextParam::~ContextParam()
{
    delete ui;
}

ContexParametrController *ContextParam::params()
{
    return m_controller;
}

void ContextParam::on_buttonBox_rejected()
{
    close();
}

void ContextParam::on_buttonBox_accepted()
{
    using namespace contextparamstype;
    QVector<ContextParameter> params = {
        { SAFETY_DEPTH, ui->safetyDepthValue->value() },
        { SHALLOW_CONTOUR, ui->shallowContourValue->value() },
        { SAFETY_CONTOUR, ui->safetyContourValue->value() },
        { TWO_SHADES, ui->twoShadesValue->isChecked() },
        { DEEP_CONTOUR, ui->deepContourValue->value() },
        { SHALLOW_PATTERN, ui->shallowPatternValue->isChecked() },
        { SHOW_ISOLATED_DANGERS_IN_SHALLOW_WATERS, ui->showDangersValue->isChecked() },
        { PLAIN_BOUNDARIES, ui->plainBoundariesValue->isChecked() },
        { SIMPLIFIED_POINTS, ui->simplifiedPointsValue->isChecked() },
        { RADAR_OVERLAY, ui->radarOverlayValue->isChecked() },
        { IGNORE_SCAMIN, ui->ignoreScaminValue->isChecked() },
        { NATIONAL_LANGUAGE, ui->nationalLanguageValue->currentText() },
    };
    m_controller = new ContexParametrController(params);
}
