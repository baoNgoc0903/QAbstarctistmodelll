#include "qtimerModel.h"

static TimerModel* instanceTimerModel = new TimerModel(nullptr);
int TimerModel::itemCount(){
    return m_timerItemList.count();
}

TimerModel::TimerModel(QObject* pParent): QAbstractListModel(pParent)
{
    m_timerItemList.clear();
}

QHash<int, QByteArray> TimerModel::roleNames()const{
    QHash<int, QByteArray> roles;
    roles[NumberRole] = "tnumber";
    roles[HourRole] = "thour";
    roles[MinuteRole] = "tminute";
    roles[SecondRole] = "tsecond";
    roles[MilisecondRole] = "tmilisecond";
    return roles;
}
int TimerModel::rowCount(const QModelIndex& parent) const{
    do{
        (void)(parent);
    }while(0);
    return m_timerItemList.count();
}
QVariant TimerModel::data(const QModelIndex &index, int role)const{
    if(index.row() <0 || index.row() >= m_timerItemList.count()){
        return QVariant();
    }
    return dataFromIndex(index.row(), role);
}
QVariant TimerModel::dataFromIndex(const int& idx, const int& role) const{
    QVariant value{QVariant::fromValue<QString>("")};
    switch(role){
    case NumberRole:
        value = QVariant::fromValue<int>(m_timerItemList.at(idx).m_number);
        break;
    case HourRole:
        value = QVariant::fromValue<int>(m_timerItemList.at(idx).m_hour);
        break;
    case MinuteRole:
        value = QVariant::fromValue<int>(m_timerItemList.at(idx).m_minute);
        break;
    case SecondRole:
        value = QVariant::fromValue<int>(m_timerItemList.at(idx).m_second);
        break;
    case MilisecondRole:
        value = QVariant::fromValue<int>(m_timerItemList.at(idx).m_milisecond);
        break;
    default:
        break;
    }
    return value;
}

void TimerModel::append(MTimerItem data)
{
    beginInsertRows(QModelIndex{}, rowCount(),rowCount());
    m_timerItemList<<data;
    emit itemCountChanged();
    endInsertRows();
}

TimerModel *TimerModel::instanceOfTimerModel(){
    return instanceTimerModel;
}
