import QtQuick 2.15
import QtQuick.Controls.Basic 2.15
import "../utils"

Frame {
    id: root

    property bool frameless: false
    property bool hoverable: true
    property bool hover: false

    property color color: themeManager.currentTheme && themeManager.currentTheme.colors
        ? themeManager.currentTheme.colors.cardColor
        : "#ffffff"

    property alias radius: background.radius

    property color borderColor: themeManager.currentTheme && themeManager.currentTheme.colors
        ? themeManager.currentTheme.colors.cardBorderColor
        : "#e5e5e5"

    property int borderWidth: themeManager.currentTheme && themeManager.currentTheme.appearance
        ? themeManager.currentTheme.appearance.borderWidth
        : 1

    clip: true

    background: Rectangle {
        id: background
        anchors.fill: parent
        radius: themeManager.currentTheme && themeManager.currentTheme.appearance
            ? themeManager.currentTheme.appearance.smallRadius
            : 4
        color: root.color
        border.width: root.borderWidth
        border.color: root.borderColor
        opacity: root.hover ? 0.7 : 1
        visible: !root.frameless

        MouseArea {
            anchors.fill: parent
            hoverEnabled: root.hoverable
            onEntered: root.hover = true
            onExited: root.hover = false
        }

        Behavior on opacity { NumberAnimation { duration: Utils.animationSpeedFaster; easing.type: Easing.OutQuad } }
        Behavior on color { ColorAnimation { duration: Utils.appearanceSpeed; easing.type: Easing.OutQuad } }
    }
}
