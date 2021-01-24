//#ifndef LAPTIMERMODEL_H
//#define LAPTIMERMODEL_H



//#include <QtCore>
//#include <QObject>
//#include <QAbstractListModel>
//#include <QSortFilterProxyModel>



//typedef struct LapTimerItem_T {
//    int lap_number = 0;
//    int lap_hour = 0;
//    int lap_minute = 0;
//    int lap_second = 0;
//    int lap_milisecond = 0;
//    int lap_totalTime = 0;
//    QString detailed_lap_time= "--:--.--";
//    QString detailed_lap_timeKorea= "--:--.--";
//    double temperature = 0;
//} LapTimerItem_T;
//Q_DECLARE_METATYPE(LapTimerItem_T)



//class LapTimerModel : public QAbstractListModel
//{
//    Q_OBJECT
//    Q_PROPERTY(int bestLapIndex READ bestLapIndex WRITE setBestLapIndex NOTIFY bestLapIndexChanged)
//    Q_PROPERTY(int itemCount        READ itemCount          NOTIFY itemCountChanged)
//public:
//    //! Roles for the fields
//    enum LapTimerItemRole {
//        lapNumberRole = Qt::UserRole + 1,
//        lapHourRole,
//        lapMinuteRole,
//        lapSecondRole,
//        lapMilisecondRole,
//        lapTotalLapTimerRole,
//        detailedLapTimeRole,
//        detailedLapTimeKoreaRole,
//        temperatureRole
//    };



//    LapTimerModel(QObject *pParent = 0);
//    //! Class destructor
//    ~LapTimerModel();
//    /*!
//     * \brief roleNames
//     * \return Hash of role names
//     */
//    QHash<int, QByteArray> roleNames() const;
//    /*!
//     * \brief updateData Updates the lap timer item list with new data
//     * \param data The data to update the lap timer item list with
//     */
//    void updateData(const QList<LapTimerItem_T> data);
//    /*!
//     * \brief append Append new data to lap timer item list.
//     * \param data The date to append the list with.
//     */
//    void append(LapTimerItem_T data);
//    /*!
//     * \brief rowCount Gets the number of rows in the list
//     * \param parent Reference to the parent object
//     * \return The number of rows in the list
//     */
//    Q_INVOKABLE int rowCount(const QModelIndex &parent = QModelIndex()) const;
//    /*!
//     * \brief data Retrieve data from list.
//     * \param index Position of the data
//     * \param role Field role
//     * \return The retrived data
//     */
//    QVariant data(const QModelIndex &index, int role) const;
//    /*!
//     * \brief dataFromIndex Retrieve data from list based on idx and role key
//     * \param idx Position of the data
//     * \param role Field role
//     * \return The retrieved data
//     */
//    QVariant dataFromIndex(const int idx, int role) const;
//    /*!
//     * \brief getItem Retrieve data from list based on idx and role value
//     * \param idx Position of the data
//     * \param role_key Field role
//     * \return The retrieved data
//     */
//    Q_INVOKABLE QVariant getItem(int idx, const QByteArray &role_key);



//    Q_INVOKABLE int bestLapIndex();
//    Q_INVOKABLE void setBestLapIndex(int index);



//    void recheckBestLapTimer();



//    //! Clears the lap timer item list
//    void clearData();
//    int itemCount() const;

//    int checkExistLapTimer(int value);
//    void updateItem(int idx ,const LapTimerItem_T data);
//    LapTimerItem_T getData(int index);
//    LapTimerItem_T getLastLapData();
//    LapTimerItem_T getPreBestLapData();



//signals:
//    void bestLapIndexChanged();
//    void itemCountChanged();



//private:
//    QList<LapTimerItem_T> m_lapTimerItemList;
//    int m_bestLapIndex;
//    LapTimerItem_T m_lastLapData;
//    LapTimerItem_T m_preBestLapData;
//    LapTimerItem_T m_lapDataAtIndex;
//};



//class LapTimerFilterProxyModel : public QSortFilterProxyModel
//{
//    Q_OBJECT
//public:
//    LapTimerFilterProxyModel(QObject* parent = 0)
//        : QSortFilterProxyModel(parent){
////        setSortOrder(true);
//    }



//    ~LapTimerFilterProxyModel(){}



//    Q_INVOKABLE void setSortOrder(bool isDesc)
//    {
//        if(isDesc) {
//            this->sort(0, Qt::DescendingOrder);
//        } else {
//            this->sort(0, Qt::AscendingOrder);
//        }
//    }



//    void setCustomizeRoleName(int _role)
//    {
//        m_customizeRoleName = _role;
//    }



//    bool lessThan(const QModelIndex &left, const QModelIndex &right) const
//    {
//        int const left_row  = left.row();
//        int const right_row = right.row();
//        int const num_columns = sourceModel()->columnCount();
//        bool result = false;



//        if(m_customizeRoleName == LapTimerModel::lapNumberRole)
//        {
//            for(int compared_column = left.column(); compared_column<num_columns; ++compared_column) {
//                QModelIndex const left_idx = sourceModel()->index(left_row, compared_column, QModelIndex());
//                QModelIndex const right_idx = sourceModel()->index(right_row, compared_column, QModelIndex());



//                int const leftData = sourceModel()->data(left_idx,LapTimerModel::lapNumberRole).toInt();
//                int const rightData = sourceModel()->data(right_idx,LapTimerModel::lapNumberRole).toInt();
//                if(leftData < rightData) {
//                    result = true;
//                }
//            }
//        }
//        else if(m_customizeRoleName == LapTimerModel::lapHourRole)
//        {
//            for(int compared_column = left.column(); compared_column<num_columns; ++compared_column) {
//                QModelIndex const left_idx = sourceModel()->index(left_row, compared_column, QModelIndex());
//                QModelIndex const right_idx = sourceModel()->index(right_row, compared_column, QModelIndex());



//                int const leftData = sourceModel()->data(left_idx,LapTimerModel::lapHourRole).toInt()*360000
//                                   + sourceModel()->data(left_idx,LapTimerModel::lapMinuteRole).toInt()*6000
//                                   + sourceModel()->data(left_idx,LapTimerModel::lapSecondRole).toInt()*100
//                                   + sourceModel()->data(left_idx,LapTimerModel::lapMilisecondRole).toInt();
//                int const rightData = sourceModel()->data(right_idx,LapTimerModel::lapHourRole).toInt()*360000
//                                   + sourceModel()->data(right_idx,LapTimerModel::lapMinuteRole).toInt()*6000
//                                   + sourceModel()->data(right_idx,LapTimerModel::lapSecondRole).toInt()*100
//                                   + sourceModel()->data(right_idx,LapTimerModel::lapMilisecondRole).toInt();
//                if(leftData < rightData) {
//                    result = true;
//                } else if(leftData == rightData) {
//                    int const leftNumber = sourceModel()->data(left_idx,LapTimerModel::lapNumberRole).toInt();
//                    int const rightNumber = sourceModel()->data(right_idx,LapTimerModel::lapNumberRole).toInt();
//                    if(leftNumber < rightNumber) {
//                        result = true;
//                    }
//                }
//            }
//        }



//        return result;
//    }
//private:
//    int m_customizeRoleName = LapTimerModel::lapNumberRole;



//};



//#endif // LAPTIMERMODEL_H


//        [11:25 AM] Le Ngoc Hai (FGA.IVI)

//        #include "LapTimerModel.h"
//        #include "Logger.h"



//        LapTimerModel::LapTimerModel(QObject *pParent)
//            : QAbstractListModel(pParent) {​​​​​​​
//            m_lapTimerItemList.clear();
//            m_bestLapIndex = -1;
//        //    m_lastLapData = new LapTimerItem_T;
//        //    m_preBestLapData = new LapTimerItem_T;
//        //    m_lapDataAtIndex = new LapTimerItem_T;
//        }​​​​​​​


//        LapTimerModel::~LapTimerModel() {​​​​​​​
//        //    if(m_lastLapData != NULL)
//        //    {​​​​​​​
//        //        delete m_lastLapData;
//        //        m_lastLapData = nullptr;
//        //    }​​​​​​​
//        //    if(m_preBestLapData != NULL)
//        //    {​​​​​​​
//        //        delete m_preBestLapData;
//        //        m_preBestLapData = nullptr;
//        //    }​​​​​​​
//        //    if(m_lapDataAtIndex != NULL)
//        //    {​​​​​​​
//        //        delete m_lapDataAtIndex;
//        //        m_lapDataAtIndex = nullptr;
//        //    }​​​​​​​
//        }​​​​​​​


//        /***************************************************************************
//        * Method name: roleNames
//        * Description: Create hash for role names
//        * Return     : QHash
//        *****************************************************************************/
//        QHash<int, QByteArray> LapTimerModel::roleNames() const
//        {​​​​​​​
//            QHash<int, QByteArray> roles;
//            roles[lapNumberRole] = "lapNumber";
//            roles[lapHourRole] = "lapHour";
//            roles[lapMinuteRole] = "lapMinute";
//            roles[lapSecondRole] = "lapSecond";
//            roles[lapMilisecondRole] = "lapMilisecond";
//            roles[lapTotalLapTimerRole] = "totalLapTimer";
//            roles[detailedLapTimeRole] = "detailedLapTime";
//            roles[detailedLapTimeKoreaRole] = "detailedLapTimeKorea";
//            roles[temperatureRole] = "temperature";


//            return roles;
//        }​​​​​​​


//        /***************************************************************************
//        * Method name: updateData
//        * Description: Updates the lap timer item list with new data
//        * Arguments  :
//        *              data(in):
//        *****************************************************************************/
//        void LapTimerModel::updateData(const QList<LapTimerItem_T> data)
//        {​​​​​​​
//            beginResetModel();
//            m_lapTimerItemList = data;
//            endResetModel();
//        }​​​​​​​


//        /***************************************************************************
//        * Method name: updateData
//        * Description: Append new data to the lap timer item list
//        * Arguments  :
//        *              data(in):
//        *****************************************************************************/
//        void LapTimerModel::append(LapTimerItem_T data)
//        {​​​​​​​
//            if(m_lapTimerItemList.isEmpty())
//            {​​​​​​​
//                m_preBestLapData.lap_number = data.lap_number;
//                m_preBestLapData.lap_hour = data.lap_hour;
//                m_preBestLapData.lap_minute = data.lap_minute;
//                m_preBestLapData.lap_second = data.lap_second;
//                m_preBestLapData.lap_milisecond = data.lap_milisecond;
//                m_preBestLapData.lap_totalTime = data.lap_totalTime;
//                m_preBestLapData.detailed_lap_time = data.detailed_lap_time;
//                m_preBestLapData.detailed_lap_timeKorea = data.detailed_lap_timeKorea;
//                m_preBestLapData.temperature = data.temperature;
//                m_lastLapData = data;
//            }​​​​​​​
//            else
//            {​​​​​​​
//                m_preBestLapData.lap_number = getData(m_bestLapIndex).lap_number;
//                m_preBestLapData.lap_hour = getData(m_bestLapIndex).lap_hour;
//                m_preBestLapData.lap_minute = getData(m_bestLapIndex).lap_minute;
//                m_preBestLapData.lap_second = getData(m_bestLapIndex).lap_second;
//                m_preBestLapData.lap_milisecond = getData(m_bestLapIndex).lap_milisecond;
//                m_preBestLapData.lap_totalTime = getData(m_bestLapIndex).lap_totalTime;
//                m_preBestLapData.detailed_lap_time = getData(m_bestLapIndex).detailed_lap_time;
//                m_preBestLapData.detailed_lap_timeKorea = getData(m_bestLapIndex).detailed_lap_timeKorea;
//                m_preBestLapData.temperature = getData(m_bestLapIndex).temperature;
//                m_lastLapData = m_lapTimerItemList.first();
//            }​​​​​​​


//            int bestLapTime = 0;
//            if (m_bestLapIndex != -1) {​​​​​​​
//                bestLapTime = dataFromIndex(m_bestLapIndex, lapTotalLapTimerRole).toInt();
//            }​​​​​​​


//            beginInsertRows(QModelIndex{​​​​​​​}​​​​​​​, 0, 0);
//            m_lapTimerItemList.insert(0, data);


//            int dataLapTime = data.lap_totalTime;


//            if(bestLapTime == 0 || (dataLapTime < bestLapTime))
//            {​​​​​​​
//                setBestLapIndex(0);
//            }​​​​​​​ else {​​​​​​​
//                setBestLapIndex(bestLapIndex() + 1);
//            }​​​​​​​


//            emit itemCountChanged();
//            endInsertRows();
//        }​​​​​​​


//        /****************************************************************************
//        * Method name: rowCount
//        * Description: Gets the number of lap timer items in the list
//        * Note       : -
//        * Arguments  :
//        *              parent(in):
//        * Return     : int
//        *****************************************************************************/
//        int LapTimerModel::rowCount(const QModelIndex &parent) const
//        {​​​​​​​
//            do {​​​​​​​
//                (void)(parent);
//            }​​​​​​​ while (0);
//            return m_lapTimerItemList.count();
//        }​​​​​​​


//        /****************************************************************************
//        * Method name: data
//        * Description: Gets the spcific data
//        * Note       : -
//        * Arguments  :
//        *              index(in):
//        *              role(in)
//        * Return     : QVariant
//        *****************************************************************************/
//        QVariant LapTimerModel::data(const QModelIndex &index, int role) const
//        {​​​​​​​
//            return dataFromIndex(index.row(), role);
//        }​​​​​​​















//        ​[11:25 AM] Le Ngoc Hai (FGA.IVI)

//        /****************************************************************************
//        * Method name: dataFromIndex
//        * Description: Gets the specific data
//        * Note       : -
//        * Arguments  :
//        *              idx(in):
//        *              role(in)
//        * Return     : QVariant
//        *****************************************************************************/
//        QVariant LapTimerModel::dataFromIndex(const int idx, int role) const
//        {​​​​​​​
//            QVariant value{​​​​​​​QVariant::fromValue<QString>("")}​​​​​​​;
//            if (0 <= idx || m_lapTimerItemList.count() > idx) {​​​​​​​
//                switch (role) {​​​​​​​
//                case lapNumberRole:
//                    value = QVariant::fromValue<int>(m_lapTimerItemList.at(idx).lap_number);
//                    break;
//                case lapHourRole:
//                    value = QVariant::fromValue<int>(m_lapTimerItemList.at(idx).lap_hour);
//                    break;
//                case lapMinuteRole:
//                    value = QVariant::fromValue<int>(m_lapTimerItemList.at(idx).lap_minute);
//                    break;
//                case lapSecondRole:
//                    value = QVariant::fromValue<int>(m_lapTimerItemList.at(idx).lap_second);
//                    break;
//                case lapMilisecondRole:
//                    value = QVariant::fromValue<int>(m_lapTimerItemList.at(idx).lap_milisecond);
//                    break;
//                case lapTotalLapTimerRole:
//                    value = QVariant::fromValue<int>(m_lapTimerItemList.at(idx).lap_totalTime);
//                    break;
//                case detailedLapTimeRole:
//                    value = QVariant::fromValue<QString>(m_lapTimerItemList.at(idx).detailed_lap_time);
//                    break;
//                case detailedLapTimeKoreaRole:
//                    value = QVariant::fromValue<QString>(m_lapTimerItemList.at(idx).detailed_lap_timeKorea);
//                    break;
//                case temperatureRole:
//                    value = QVariant::fromValue<double>(m_lapTimerItemList.at(idx).temperature);
//                    break;
//                default:
//                    break;
//                }​​​​​​​
//            }​​​​​​​
//            return value;
//        }​​​​​​​


//        /****************************************************************************
//        * Method name: getItem
//        * Description: Gets the specific data
//        * Note       : -
//        * Arguments  :
//        *              idx(in):
//        *              role_key(in)
//        * Return     : QVariant
//        *****************************************************************************/
//        QVariant LapTimerModel::getItem(int idx, const QByteArray &role_key)
//        {​​​​​​​
//            QVariant data {​​​​​​​""}​​​​​​​;


//            if (idx >= 0 && idx < m_lapTimerItemList.size()
//                    && m_lapTimerItemList.size() > 0) {​​​​​​​
//                int role = roleNames().key(role_key);
//                data = dataFromIndex(idx, role);
//            }​​​​​​​


//            return data;
//        }​​​​​​​


//        void LapTimerModel::setBestLapIndex(int index)
//        {​​​​​​​
//            //Always emit the bestLapIndexChanged, because of Best Lap order.
//        //    if (m_bestLapIndex != index) {​​​​​​​
//                m_bestLapIndex = index;
//                emit bestLapIndexChanged();
//        //    }​​​​​​​
//        }​​​​​​​


//        int LapTimerModel::bestLapIndex()
//        {​​​​​​​
//            return m_bestLapIndex;
//        }​​​​​​​


//        /***************************************************************************
//        * Method name: clearData
//        * Description: Clears the lap timer item list
//        *****************************************************************************/
//        void LapTimerModel::clearData()
//        {​​​​​​​
//            if(m_lapTimerItemList.count() > 0)
//            {​​​​​​​
//                beginResetModel();
//                m_lapTimerItemList.clear();
//        //        qDeleteAll(m_lapTimerItemList);
//                endResetModel();
//                emit itemCountChanged();
//            }​​​​​​​
//            else
//            {​​​​​​​
//            }​​​​​​​
//        }​​​​​​​


//        int LapTimerModel::itemCount() const
//        {​​​​​​​
//            return m_lapTimerItemList.count();
//        }​​​​​​​


//        void LapTimerModel::updateItem(int idx, const LapTimerItem_T data)
//        {​​​​​​​
//            if(idx >= 0 && idx < m_lapTimerItemList.size() &&  !m_lapTimerItemList.empty())
//            {​​​​​​​
//                m_lapTimerItemList[idx].lap_hour = data.lap_hour;
//                m_lapTimerItemList[idx].lap_minute = data.lap_minute;
//                m_lapTimerItemList[idx].lap_second = data.lap_second;
//                m_lapTimerItemList[idx].lap_milisecond = data.lap_milisecond;
//                m_lapTimerItemList[idx].lap_totalTime = data.lap_totalTime;
//                m_lapTimerItemList[idx].detailed_lap_time = data.detailed_lap_time;
//                m_lapTimerItemList[idx].detailed_lap_timeKorea = data.detailed_lap_timeKorea;
//                m_lapTimerItemList[idx].temperature = data.temperature;
//                emit dataChanged(QAbstractItemModel::createIndex(idx, 0), QAbstractItemModel::createIndex(idx, 0));
//            }​​​​​​​
//        }​​​​​​​


//        LapTimerItem_T LapTimerModel::getData(int index)
//        {​​​​​​​
//            if(index >= 0 && index < m_lapTimerItemList.size() &&  !m_lapTimerItemList.empty())
//            {​​​​​​​
//                m_lapDataAtIndex = m_lapTimerItemList.at(index);
//            }​​​​​​​ else {​​​​​​​
//                m_lapDataAtIndex.lap_number = 0;
//                m_lapDataAtIndex.lap_hour = 0;
//                m_lapDataAtIndex.lap_minute = 0;
//                m_lapDataAtIndex.lap_second = 0;
//                m_lapDataAtIndex.lap_milisecond = 0;
//                m_lapDataAtIndex.temperature = 0;
//                m_lapDataAtIndex.lap_totalTime = 0;
//                m_lapDataAtIndex.detailed_lap_time = "";
//                m_lapDataAtIndex.detailed_lap_timeKorea = "";
//            }​​​​​​​
//            return m_lapDataAtIndex;
//        }​​​​​​​


//        LapTimerItem_T LapTimerModel::getLastLapData()
//        {​​​​​​​
//            return m_lastLapData;
//        }​​​​​​​


//        LapTimerItem_T LapTimerModel::getPreBestLapData()
//        {​​​​​​​
//            return m_preBestLapData;
//        }​​​​​​​


//        int LapTimerModel::checkExistLapTimer(int value)
//        {​​​​​​​
//            int index = -1;
//            if(!m_lapTimerItemList.empty())
//            {​​​​​​​
//                for(int i = 0; i < m_lapTimerItemList.size(); i++)
//                {​​​​​​​
//                    if(m_lapTimerItemList.at(i).lap_number == value )
//                    {​​​​​​​
//                        index = i;
//                        break;
//                    }​​​​​​​
//                }​​​​​​​
//            }​​​​​​​
//            return index;
//        }​​​​​​​


//        void LapTimerModel::recheckBestLapTimer()
//        {​​​​​​​
//            int bestLapTime = -1;
//            int lastLapTime = -1;
//            if (m_bestLapIndex != -1) {​​​​​​​
//                int lap_hour = dataFromIndex(m_bestLapIndex, lapHourRole).toInt();
//                int lap_minute = dataFromIndex(m_bestLapIndex, lapMinuteRole).toInt();
//                int lap_second = dataFromIndex(m_bestLapIndex, lapSecondRole).toInt();
//                int lap_milisecond = dataFromIndex(m_bestLapIndex, lapMilisecondRole).toInt();
//                bestLapTime = (((lap_hour*60)+lap_minute)*60+lap_second)*100+lap_milisecond;
//            }​​​​​​​


//            if(!m_lapTimerItemList.isEmpty())
//            {​​​​​​​
//                int lap_hour = dataFromIndex(0, lapHourRole).toInt();
//                int lap_minute = dataFromIndex(0, lapMinuteRole).toInt();
//                int lap_second = dataFromIndex(0, lapSecondRole).toInt();
//                int lap_milisecond = dataFromIndex(0, lapMilisecondRole).toInt();
//                lastLapTime = (((lap_hour*60)+lap_minute)*60+lap_second)*100+lap_milisecond;
//            }​​​​​​​


//            if(lastLapTime < bestLapTime && lastLapTime >= 0)
//            {​​​​​​​
//                setBestLapIndex(0);
//            }​​​​​​​
//        }​​​​​​​

















