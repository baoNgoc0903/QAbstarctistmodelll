#ifndef Q_TIMER_H
#define Q_TIMER_H
#include <QObject>
#include <QTimer>
#include <QElapsedTimer>
#include <QDebug>
#include "qtimerModel.h"

class Q_Timer : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString currentTime READ currentTime WRITE setCurrentTime NOTIFY currentTimeChanged)
public:
    Q_Timer();
    QString currentTime();
    void setCurrentTime(QString currentTimee);
    Q_INVOKABLE void startandstopTimer(bool sTart);
public slots:
    void slotQTimer();
signals:
    void currentTimeChanged();
private:
    QTimer qTimer;
    QElapsedTimer qElapsedTimer;
    QString m_currentTime;
    MTimerItem temp;
};

#endif // Q_TIMER_H
