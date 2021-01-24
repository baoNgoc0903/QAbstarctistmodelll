#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "q_timer.h"
#include "qtimerModel.h"
int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    Q_Timer m_time;
    engine.rootContext()->setContextProperty("mtime", &m_time);
//    engine.rootContext()->setContextProperty("timermodel", &tmodel);
    engine.rootContext()->setContextProperty("timermodel", INSTANCE_TIMERMODEL);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    return app.exec();
}
