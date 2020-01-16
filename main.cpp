#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "imageprocessor.h"
#include "imageviewer.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    qmlRegisterType<ImageProcessor>("com.optimusprime.classes",1 ,0 ,"ImageProcessor");
    qmlRegisterType<ImageViewer>("com.optimusprime.classes",1 ,0, "ImageViewer");

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}

