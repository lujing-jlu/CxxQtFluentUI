import QtQuick 2.15
import QtQuick.Controls.Basic 2.15
import "../utils" as Utils
import "../components" as Rin

ToolTip {
    id: tooltip

    property color backgroundColor: themeManager.currentTheme && themeManager.currentTheme.colors
        ? themeManager.currentTheme.colors.backgroundAcrylicColor : "#ffffff"
    property color borderColor: themeManager.currentTheme && themeManager.currentTheme.colors
        ? themeManager.currentTheme.colors.cardBorderColor : "#e5e5e5"
    property color textColor: themeManager.currentTheme && themeManager.currentTheme.colors
        ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
    property int buttonRadius: themeManager.currentTheme && themeManager.currentTheme.appearance
        ? themeManager.currentTheme.appearance.buttonRadius : 4
    property int captionSize: themeManager.currentTheme && themeManager.currentTheme.typography
        ? themeManager.currentTheme.typography.captionSize : 12

    timeout: -1

    contentItem: Text {
        id: tooltipText
        anchors.centerIn: background
        font.pixelSize: captionSize
        text: tooltip.text
        color: textColor
    }

    background: Rectangle {
        id: background
        width: tooltipText.width + 20
        height: tooltipText.height + 14
        anchors.horizontalCenter: parent.horizontalCenter
        y: -6

        radius: buttonRadius
        color: backgroundColor
        border.color: borderColor
        border.width: 1
    }

    // Animation
    enter: Transition {
        ParallelAnimation {
            NumberAnimation {
                target: tooltip
                property: "opacity"
                from: 0
                to: 1
                duration: 250
                easing.type: Easing.InOutQuart
            }
        }
    }

    exit: Transition {
        ParallelAnimation {
            NumberAnimation {
                target: tooltip
                property: "opacity"
                from: 1
                to: 0
                duration: 300
                easing.type: Easing.InOutQuart
            }
        }
    }
}
