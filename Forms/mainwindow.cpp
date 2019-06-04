#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "help_init.h"

#include "Forms/contextparam.h"

#include <QFileDialog>

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

    DrawEngine drawEngine(
                *m_mapController,
                *m_drawInstCtrl,
                *m_symbolCtrl
                );

    if (ui->mapView->scene()){
        ui->mapView->scene()->deleteLater();
    }
    auto scene = new QGraphicsScene();
    //ui->mapView->fitInView(QRectF(QPointF(0,0),QSize(1920,1080)));
    //scene->setSceneRect(QRectF(QPointF(0,0),ui->mapView->size()));
    ui->mapView->setScene(scene);
    ui->mapView->setRenderHint(QPainter::Antialiasing);

    QPolygonF points;
    double dpim = ui->mapView->physicalDpiX() / MM_PER_INCH;
    drawEngine.draw(dpim, scene);

    const auto& img = drawEngine.img();
    img.save(filenames::IMG_MAP);

}

void MainWindow::on_saveAsPngAction_triggered()
{

}

void MainWindow::on_exitAction_triggered()
{

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
