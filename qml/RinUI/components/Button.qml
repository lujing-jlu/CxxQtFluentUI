import QtQuick 2.15
import QtQuick.Controls 2.15
import "../themes"
import "../utils"

Button {
    id: root

    property color primaryColor: themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors.primaryColor : "#0078D4"
    property color textColor: themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
    property bool isPrimary: false
    property bool isFlat: false

    readonly property color backgroundColor: isFlat
        ? "transparent"
        : (isPrimary ? primaryColor : (themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors.controlColor : "#ffffff"))

    readonly property color hoverColor: !isPrimary && !isFlat
        ? (themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors.controlSecondaryColor : "#F9F9F9")
        : backgroundColor

    readonly property color borderColor: isFlat
        ? "transparent"
        : (enabled ? (isPrimary ? primaryColor : (themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors.controlBorderColor : "#000000")) : "#000000")

    readonly property real buttonRadius: (themeManager.currentTheme && themeManager.currentTheme.appearance) ? themeManager.currentTheme.appearance.buttonRadius : 5

    font.pixelSize: 14
    icon.width: font.pixelSize * 1.2
    icon.height: font.pixelSize * 1.2

    padding: 12
    leftPadding: 20
    rightPadding: 20

    background: Rectangle {
        id: background
        anchors.fill: parent
        color: root.hovered ? root.hoverColor : root.backgroundColor
        radius: root.buttonRadius
        border.width: isFlat ? 0 : 1
        border.color: root.borderColor

        Behavior on color { ColorAnimation { duration: 150 } }
    }

    contentItem: Text {
        text: root.text
        color: {
            if (!enabled) return themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors.disabledColor : "#000000"
            if (isPrimary && !isFlat) return themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors.textOnAccentColor : "#ffffff"
            if (isPrimary && isFlat) return primaryColor
            return root.textColor
        }
        font: root.font
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }

    opacity: !root.enabled ? 0.6 : 1
}
