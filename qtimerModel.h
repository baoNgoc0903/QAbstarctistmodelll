#ifndef QTIMERMODEL_H
#define QTIMERMODEL_H

#include <QObject>
#include <QtCore>
#include <QDebug>
#include <QAbstractListModel>
#define INSTANCE_TIMERMODEL TimerModel::instanceOfTimerModel()
typedef struct MTimerItem{
    int m_number = 0;
    int m_hour   = 0;
    int m_minute = 0;
    int m_second = 0;
    int m_milisecond = 0;
}MTimerItem;
Q_DECLARE_METATYPE(MTimerItem)

class TimerModel: public QAbstractListModel
{
    Q_OBJECT
    Q_PROPERTY(int itemCount READ itemCount  NOTIFY itemCountChanged)

public:
    enum TimerItemRole: int{
        NumberRole = Qt::UserRole+1,
        HourRole,
        MinuteRole,
        SecondRole,
        MilisecondRole,
    };
    int itemCount();
    TimerModel(QObject* pParent = nullptr);
    QHash<int, QByteArray> roleNames() const override;
    int rowCount(const QModelIndex &parent = QModelIndex()) const override;
    QVariant data(const QModelIndex &index, int role) const override;
    QVariant dataFromIndex(const int& idx, const int& role) const;

    void append(MTimerItem data);
    static TimerModel* instanceOfTimerModel();
signals:
    void itemCountChanged();
private:
    QList<MTimerItem> m_timerItemList;
//    MTimerItem m_reveiceData;
};
#endif // QTIMERMODEL_H
