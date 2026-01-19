import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    id: window
    width: 1000
    height: 800
    visible: true
    title: "CxxQtFluentUI"

    color: "#EDEDED"

    Text {
        text: "Hello from CxxQt + FluentUI!"
        anchors.centerIn: parent
        font.pixelSize: 24
        color: "#070707"
    }
}
