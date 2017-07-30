import QtQuick 2.0

Rectangle {
    signal valueSig(real val)
    property var value: 0.5
    width: parent.width; height: parent.height
    color: "lightblue"
    x: 30

//    onWidthChanged: {
//        sliderId.x = value*(width-width/40)
//    }

    Rectangle {
        id: rectBackgroundId
        width: parent.width; height: parent.height/5
        anchors.centerIn: parent
        color: "#e9e9e9"
    }

    Rectangle {
        id: sliderId
        width: parent.width/20; height: parent.height
//        color: "red"
        color: "#00000000"
        x: value*(rectBackgroundId.width)-rectBackgroundId.width/40

        Rectangle {
            anchors.centerIn: parent
            width: parent.width/2; height: parent.height/1.1
            color: "#474747"
        }

        MouseArea {
            id: mouseAreaId
            anchors.fill: parent
            drag.target : sliderId
            drag.axis: Drag.XAxis
            drag.minimumX : -parent.width/2
            drag.maximumX : rectBackgroundId.width - parent.width/2
            onReleased: valueSig((sliderId.x+sliderId.width/2)/rectBackgroundId.width)
        }
    }
}
