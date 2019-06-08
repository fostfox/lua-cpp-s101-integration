#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QShowEvent>

#include <memory>

class FeatureCatalogueController;
class FeatureMapController;
class ContexParametrController;
class PortrayalCatalogueController;
class ContextParam;
class DrawingInstructionsController;
class QGraphicsScene;

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = nullptr);
    ~MainWindow();
    bool init();


private slots:
    void on_loadMapAction_triggered();
    void on_saveAsPngAction_triggered();
    void on_exitAction_triggered();
    void on_actionContext_Parametrs_triggered();

    void updateContextParams();
    void keyPressEvent(QKeyEvent *event);

private:
    bool loadMapXml(const QString &mapFileName);
    bool doPortrayal();
    bool drawMap();

private:
    Ui::MainWindow *ui;
    QGraphicsScene *m_scene;

    bool m_isMapLoad = false;

    std::unique_ptr<ContextParam> m_paramUi;

    std::unique_ptr<FeatureCatalogueController> m_dictController;
    std::unique_ptr<FeatureMapController> m_mapController;
    std::unique_ptr<ContexParametrController> m_contextParamCtrl;
    std::unique_ptr<PortrayalCatalogueController> m_symbolCtrl;
    std::unique_ptr<DrawingInstructionsController> m_drawInstCtrl;
};

#endif // MAINWINDOW_H
