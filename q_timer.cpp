#include "q_timer.h"

Q_Timer::Q_Timer():m_currentTime("00:00:00")
{
    QObject::connect(&qTimer, SIGNAL(timeout()), this, SLOT(slotQTimer()));
    qTimer.setInterval(10);
}

QString Q_Timer::currentTime(){
    return m_currentTime;
}

void Q_Timer::setCurrentTime(QString currentTimee){
    if(currentTimee != m_currentTime){
        m_currentTime = currentTimee;
        emit currentTimeChanged();
    }
}

void Q_Timer::startandstopTimer(bool sTart){
    if(sTart){
        qTimer.start();
        qElapsedTimer.restart(); //reset -> start
    }
    else{
        qTimer.stop();
        qint64 time = qElapsedTimer.elapsed();
        temp.m_number +=1;
        temp.m_second = static_cast<int>(time/1000);
        temp.m_hour = static_cast<int>(temp.m_second/3600);
        temp.m_minute = static_cast<int>(temp.m_second/60 - temp.m_hour*60);
        temp.m_milisecond=  static_cast<int>((time%1000)/10);

        INSTANCE_TIMERMODEL->append(temp);
        qDebug() << temp.m_number;
    }
}

void Q_Timer::slotQTimer(){
    qint64 time = qElapsedTimer.elapsed();
    int second = static_cast<int>(time/1000);
    int hour = static_cast<int>(second/3600);
    int minute = static_cast<int>(second/60 - hour*60);
    int milisecond=  static_cast<int>((time%1000)/10);
    QString strhour, strminute, strsecond, strmilisecond;
    strhour = hour>9? QString("%1").arg(hour) : QString("0%1").arg(hour);
    strminute = minute>9? QString("%1").arg(minute) : QString("0%1").arg(minute);
    strsecond = second>9? QString("%1").arg(second) : QString("0%1").arg(second);
    strmilisecond = milisecond>9? QString("%1").arg(milisecond) : QString("0%1").arg(milisecond);

    m_currentTime = hour>0?QString("%1:%2:%3").arg(strhour).arg(strminute).arg(strsecond):
                           QString("%1:%2:%3").arg(strminute).arg(strsecond).arg(strmilisecond);
    currentTimeChanged();
}
