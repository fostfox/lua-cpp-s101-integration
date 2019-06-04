//#include "help_init.h"
#include <QApplication>

#include "Forms/mainwindow.h"


int main(int argc, char *argv[])
{
    QApplication a(argc, argv);

    MainWindow mainWindow;
    mainWindow.init();
    mainWindow.showFullScreen();

    return a.exec();
}
