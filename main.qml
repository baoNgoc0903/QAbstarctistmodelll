import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    visible: true
    width: 640
    height: 380
    title: qsTr("Hello World")
    property string currentTime: mtime.currentTime
    Rectangle{
        id: header
        width: parent.width
        height: 20
        anchors.top: parent.top
        color: "gray"
        opacity: 0.8
    }
    Rectangle{
        id: footer
        width: parent.width
        anchors.bottom: parent.bottom
        height: 20
        color: "gray"
        opacity: 0.8
    }

    QButton{
        anchors.left: parent.right
        anchors.leftMargin: -640/2
        anchors.verticalCenter: btnStop.verticalCenter
        id: btnStart
        text:"Start"
        selected: true
        opacity: selected?1:0.3
        onReleased: {
            btnStart.selected = !btnStart.selected
            mtime.startandstopTimer(true)
        }
    }
    QButton{
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        anchors.right: parent.right
        id: btnStop
        text:"Stop"
        selected: !btnStart.selected
        opacity: selected?1: 0.3
        onReleased: {
            btnStart.selected = !btnStart.selected
            mtime.startandstopTimer(false)
        }
    }


    Item{
        id: contenerTime
        width: text1.implicitWidth+text2.implicitWidth+text3.implicitWidth+text4.implicitWidth+
               text5.implicitWidth+text6.implicitWidth+text7.implicitWidth+text8.implicitWidth+21
        height: text1.implicitHeight+10
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.horizontalCenterOffset: 640/4
        anchors.verticalCenter: parent.verticalCenter

        Text{
            id: text1
            anchors.verticalCenter: contenerTime.verticalCenter
            anchors.right: contenerTime.right
            font.pixelSize: 30
            text: currentTime.charAt(currentTime.length -1)
        }
        Text{
            id: text2
            anchors.verticalCenter: contenerTime.verticalCenter
            anchors.right: text1.left
            anchors.rightMargin: 3
            font.pixelSize: 30
            text: currentTime.charAt(currentTime.length -2)
        }
        Text{
            id: text3
            anchors.verticalCenter: contenerTime.verticalCenter
            anchors.right: text2.left
            anchors.rightMargin: 3
            font.pixelSize: 30
            text: currentTime.charAt(currentTime.length -3)
        }
        Text{
            id: text4
            anchors.verticalCenter: contenerTime.verticalCenter
            anchors.right: text3.left
            anchors.rightMargin: 3
            font.pixelSize: 30
            text: currentTime.charAt(currentTime.length -4)
        }
        Text{
            id: text5
            anchors.verticalCenter: contenerTime.verticalCenter
            anchors.right: text4.left
            anchors.rightMargin: 3
            font.pixelSize: 30
            text: currentTime.charAt(currentTime.length -5)
        }
        Text{
            id: text6
            anchors.verticalCenter: contenerTime.verticalCenter
            anchors.right: text5.left
            anchors.rightMargin: 3
            font.pixelSize: 30
            text: currentTime.charAt(currentTime.length -6)
        }
        Text{
            id: text7
            anchors.verticalCenter: contenerTime.verticalCenter
            anchors.right: text6.left
            anchors.rightMargin: 3
            font.pixelSize: 30
            text: currentTime.charAt(currentTime.length -7)
        }
        Text{
            id: text8
            anchors.verticalCenter: contenerTime.verticalCenter
            anchors.right: text7.left
            anchors.rightMargin: 3
            font.pixelSize: 30
            text: currentTime.charAt(currentTime.length -8)
        }
    }

    Item{
        width: 640/2
        anchors.top: header.bottom
        anchors.bottom: footer.top
        ListView{
            anchors.fill: parent
            clip: true
            model: timermodel
            delegate: Item {
                id: delegateItem
                width: parent.width
                height: 50
                Rectangle{
                    anchors.fill: parent
                    border.width: 1.0
                    border.color: "black"
                    Text{
                        anchors.centerIn: parent
                        text: tnumber +" "+thour+" "+tminute+" "+tsecond+" "+tmilisecond
                    }
                }
            }
        }
    }
    Text{
        anchors.right: parent.right
        text: timermodel.itemCount
    }
}
