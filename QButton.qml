import QtQuick 2.0

Rectangle{
    id: rootBtn
    width: 100
    height: 50
    border.color: "green"
    border.width: 0.5
    color: "lightsteelblue"
    property alias text: textchild.text
    signal pressed()
    signal released()
    signal clicked()
    property bool selected:false
    Text{
        id: textchild
        anchors.centerIn: parent
        font.pixelSize: 30
    }

    MouseArea{
        anchors.fill: parent
        onPressed: {
            if(selected){
                parent.pressed()
            }
        }
        onReleased: {
            if(selected){
                parent.released()
            }
        }
    }
}
