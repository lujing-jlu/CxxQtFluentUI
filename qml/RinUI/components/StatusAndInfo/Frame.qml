import QtQuick 2.15
import QtQuick.Controls.Basic 2.15
import "../../utils" as Utils
import "../../components" as Rin

Frame {
    id: root

    property var colors: themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors : ({
        cardColor: "#ffffff",
        cardBorderColor: "#e5e5e5"
    })

    property var appearance: themeManager.currentTheme ? themeManager.currentTheme.appearance : ({
        smallRadius: 4,
        borderWidth: 1
    })

    property bool frameless: false
    property bool hoverable: true
    property bool hover: false
    property alias radius: background.radius
    property color borderColor: colors.cardBorderColor
    property int borderWidth: appearance.borderWidth

    clip: true

    background: Rectangle {
        id: background
        anchors.fill: parent
        radius: appearance.smallRadius
        color: root.frameless ? "transparent" : colors.cardColor
        border.width: borderWidth
        border.color: borderColor
        opacity: root.hover ? 0.7 : 1
        visible: !root.frameless

        MouseArea {
            anchors.fill: parent
            hoverEnabled: root.hoverable
            onEntered: root.hover = true
            onExited: root.hover = false
        }

        Behavior on opacity { NumberAnimation { duration: 100; easing.type: Easing.OutQuad } }
        Behavior on color { ColorAnimation { duration: 150; easing.type: Easing.OutQuad } }
    }
}
