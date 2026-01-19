import QtQuick 2.15
import QtQuick.Controls.Basic 2.15
import "../themes"
import "../utils"

Switch {
    id: root

    property var themeColors: themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors : null
    property var themeAppearance: themeManager.currentTheme ? themeManager.currentTheme.appearance : null

    implicitHeight: 20

    property color primaryColor: themeColors ? themeColors.primaryColor : "#0078D4"
    property color backgroundColor: themeColors ? themeColors.controlSecondaryColor : Qt.alpha("#F9F9F9", 0.5)
    property string checkedText: qsTr("On")
    property string uncheckedText: qsTr("Off")

    readonly property color textOnAccentColor: themeColors ? themeColors.textOnAccentColor : "#ffffff"
    readonly property color disabledColor: themeColors ? themeColors.disabledColor : "#000000"
    readonly property color controlSecondaryColor: themeColors ? themeColors.controlSecondaryColor : Qt.alpha("#F9F9F9", 0.5)
    readonly property color controlTertiaryColor: themeColors ? themeColors.controlTertiaryColor : Qt.alpha("#F9F9F9", 0.3)
    readonly property color controlBorderStrongColor: themeColors ? themeColors.controlBorderStrongColor : Qt.alpha("#000000", 0.6063)

    readonly property int borderWidth: themeAppearance ? themeAppearance.borderWidth : 1

    // accessibility
    FocusIndicator {
        control: parent
    }

    // background
    background: Rectangle {
        id: background
        width: 40
        height: 20
        radius: height / 2
        color: checked ? primaryColor :
            hovered ? controlTertiaryColor : backgroundColor

        // border
        border.color: checked ? "transparent" : controlBorderStrongColor
        border.width: borderWidth

        Behavior on color { ColorAnimation { duration: Utils.animationSpeed; easing.type: Easing.OutQuart } }
    }

    // indicator
    indicator: Rectangle {
        id: indicator
        width: pressed && enabled ? background.height - 3:
            hovered  && enabled ? background.height - 3 * 2 : background.height - 4 * 2
        height: (hovered || pressed) && enabled ? background.height - 3 * 2 : background.height - 4 * 2

        anchors.verticalCenter: background.verticalCenter
        radius: height / 2
        color: checked ? textOnAccentColor : controlBorderStrongColor

        Behavior on color { ColorAnimation { duration: Utils.animationSpeed; easing.type: Easing.OutQuart } }

        Behavior on x { NumberAnimation { duration: Utils.animationSpeed; easing.type: Easing.OutQuint } }
        Behavior on height { NumberAnimation { duration: Utils.animationSpeed; easing.type: Easing.OutQuint } }

        x: (hovered || pressed) && enabled
            ? visualPosition * (background.width - 3 - width) + (checked ? 0 : 3)
            : visualPosition * (background.width - 8 - width) + 4
    }

    contentItem: Row {
        anchors.fill: parent
        spacing: 12
        Rectangle { width: 40; height: 20; color: "transparent" }

        Text {
            text: (root.text === '') ? root.checked ? checkedText : uncheckedText : root.text
        }
    }

    // states
    states: [
        State {
            name: "disabledSwitch"
            when: !root.enabled
            PropertyChanges {
                target: root
                opacity: 0.2169
                primaryColor: disabledColor
            }
        },
        State {
            name: "pressedSwitch"
            when: pressed
            PropertyChanges {
                target: background
                opacity: 0.8
            }
        },
        State {
            name: "hoveredSwitch"
            when: hovered
            PropertyChanges {
                target: background
                opacity: 0.9
            }
        }
    ]

    // animation
    Behavior on opacity { NumberAnimation { duration: Utils.appearanceSpeed; easing.type: Easing.OutQuart } }
}
