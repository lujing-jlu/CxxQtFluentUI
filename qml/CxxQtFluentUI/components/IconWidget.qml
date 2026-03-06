import QtQuick 2.15

Item {
    property string icon: ""
    property string name: ""
    property alias color: text.color
    property int size: 16
    property color defaultColor: "transparent"

    implicitWidth: size
    implicitHeight: size

    Text {
        id: text
        anchors.centerIn: parent
        text: icon || name
        font.pixelSize: size
        color: defaultColor
    }
}
