#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "help_init.h"

#include "Forms/contextparam.h"

#include <QFileDialog>
#include <iostream>

static QTextStream errorStream(stderr);


MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    qInstallMessageHandler(myMessageOutput);
}

MainWindow::~MainWindow()
{
    delete ui;
}

bool MainWindow::init()
{
    QFile dictFile(filenames::DICT);
    if (!isExistsEndOpen(errorStream, dictFile, QIODevice::ReadOnly)) { return false; }
    QFile symbolFile(filenames::PORTRAYAL_CATALOGUE);
    if (!isExistsEndOpen(errorStream, symbolFile, QIODevice::ReadOnly)) { return false; }
    if (!isExists(errorStream, filenames::LUA_MAIN)) { return false; }

    qInfo("START: Feature Catalog parsing");
    FeatureCatalogueXMLBuilder dictBuilder;
    m_dictController = std::make_unique<FeatureCatalogueController>(dictBuilder.build(&dictFile));
    dictFile.close();
    qInfo("END: Feature Catalog parsing");

    PortrayalCatalogueBuilder pcBuilder;
    m_symbolCtrl = std::make_unique<PortrayalCatalogueController>(pcBuilder.build(&symbolFile));

    m_contextParamCtrl = std::make_unique<ContexParametrController>(contextparams::PARAMS);

    return true;
}

void MainWindow::on_loadMapAction_triggered()
{
    auto fileName = QFileDialog::getOpenFileName(this, tr("Open File"), "/home", tr("Maps (*.usf.xml)"));
    m_isMapLoad = loadMapXml(fileName);
    if (m_isMapLoad){
        updateContextParams();
        auto isPortrayal = doPortrayal();
    }
}

bool MainWindow::loadMapXml(const QString &mapFileName)
{
    QFile mapFile(mapFileName);
    if (!isExistsEndOpen(errorStream, mapFile, QIODevice::ReadOnly)) { return false; }

    qInfo("START: Map parsing");
    FeatureMapXMLBuilder mapBuilder(&mapFile);
    m_mapController = std::make_unique<FeatureMapController>(mapBuilder.build(true));
    mapFile.close();
    qInfo("END: Map parsing");

    return true;
}

bool MainWindow::doPortrayal()
{
    if (!m_contextParamCtrl || !m_dictController || !m_mapController) {
        return false;
    }

    LuaRuleMashine luaPortoyal(filenames::LUA_MAIN, *m_dictController, *m_mapController, *m_contextParamCtrl);

    auto status = luaPortoyal.doPortrayal();
    auto msg = std::string(" \n\n--- DO PORTRAYAL STATUS: --- ") + (status ? "true" : "false");
    qDebug(msg.c_str());
    if (!status) return false;

    m_drawInstCtrl = std::make_unique<DrawingInstructionsController>(luaPortoyal.drawController());

    QFile portayalFile(filenames::PORTRAYAL);
    if (!isOpen(errorStream,portayalFile, QIODevice::WriteOnly | QIODevice::Text)) { return -1; }
    writeDrawInst(portayalFile, *m_drawInstCtrl, *m_dictController, *m_mapController);

    auto drawStatus = drawMap();

    return drawStatus;
}

bool MainWindow::drawMap()
{
    if (!m_mapController || !m_drawInstCtrl || !m_symbolCtrl) {
        return false;
    }

    double y_min = m_mapController->getLatInterval().first;
    double y_max = m_mapController->getLatInterval().second;
    double x_min = m_mapController->getLonInterval().first;
    double x_max = m_mapController->getLonInterval().second;

    double x_d = x_max - x_min;
    double y_d = y_max - y_min;

    double h, w;
    if (x_d >= y_d){
        double coef = x_d / y_d;
        h = ui->mapView->width() / coef - 5;
        w = ui->mapView->width() - 5;
    } else {
        double coef = y_d / x_d;
        h = ui->mapView->height() - 5;
        w = ui->mapView->height() / coef - 5;
    }

    DrawEngine drawEngine(
                *m_mapController,
                *m_drawInstCtrl,
                *m_symbolCtrl
                );


    auto scene = new QGraphicsScene();
//    scene->setSceneRect(0, 0, w, h);
    //ui->mapView->fitInView(QRectF(QPointF(0,0),QSize(1920,1080)));
    //scene->setSceneRect(QRectF(QPointF(0,0),ui->mapView->size()));
    ui->mapView->setScene(scene);
    ui->mapView->setRenderHint(QPainter::Antialiasing);
    ui->mapView->setDragMode(QGraphicsView::ScrollHandDrag);
    ui->mapView->setFocus();

    QPolygonF points;
    double dpim = ui->mapView->physicalDpiX() / MM_PER_INCH;
    drawEngine.setHeightWidth(h, w);
    drawEngine.draw(dpim, scene);

    const auto& img = drawEngine.img();
    img.save(filenames::IMG_MAP);

}

void MainWindow::on_saveAsPngAction_triggered()
{
    auto fileName = QFileDialog::getSaveFileName(this, tr("Save File"), "Map", tr("Maps (*.png)"));
    QPixmap pixMap = ui->mapView->grab();
    pixMap.save(fileName);
}

void MainWindow::on_exitAction_triggered()
{
    close();
}

void MainWindow::on_actionContext_Parametrs_triggered()
{
    m_paramUi.reset(new ContextParam());
    connect(m_paramUi.get(), SIGNAL(updateParams()), SLOT(updateContextParams()));
    m_paramUi->show();
}

void MainWindow::updateContextParams()
{
    if (!m_paramUi || !m_isMapLoad) return;
    m_contextParamCtrl.reset(m_paramUi->params());
    //drawMap();
    doPortrayal();
}

void MainWindow::wheelEvent(QWheelEvent *event)
{
    const double scaleFactor = 1.005;
    if(event->delta() > 0)
    {
        ui->mapView->scale(scaleFactor, scaleFactor);
    }
    else
    {
        ui->mapView->scale(1.0 / scaleFactor, 1.0 / scaleFactor);
    }
}
