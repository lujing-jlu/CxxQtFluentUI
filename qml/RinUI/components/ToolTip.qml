import QtQuick 2.15
import QtQuick.Controls.Basic 2.15
import "../utils" as Utils
import "../components" as Rin

ToolTip {
    id: tooltip

    property var colors: themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors : QtObject {
        property color backgroundAcrylicColor: "#ffffff"
        property color cardBorderColor: "#e5e5e5"
        property color textColor: "#1b1b1b"
    }

    property var appearance: themeManager.currentTheme ? themeManager.currentTheme.appearance : QtObject {
        property int buttonRadius: 4
    }

    property var typography: themeManager.currentTheme ? themeManager.currentTheme.typography : QtObject {
        property int captionSize: 12
    }

    timeout: -1

    contentItem: Text {
        id: tooltipText
        anchors.centerIn: background
        font.pixelSize: typography.captionSize
        text: tooltip.text
        color: colors.textColor
    }

    background: Rectangle {
        id: background
        width: tooltipText.width + 20
        height: tooltipText.height + 14
        anchors.horizontalCenter: parent.horizontalCenter
        y: -6

        radius: appearance.buttonRadius
        color: colors.backgroundAcrylicColor
        border.color: colors.cardBorderColor
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
