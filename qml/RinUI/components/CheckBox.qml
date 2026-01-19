import QtQuick 2.15
import QtQuick.Controls.Basic 2.15
import "../themes"
import "../utils"

CheckBox {
    id: root

    property var themeColors: themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors : null
    property var themeAppearance: themeManager.currentTheme ? themeManager.currentTheme.appearance : null

    property color primaryColor: themeColors ? themeColors.primaryColor : "#0078D4"
    property color backgroundColor: themeColors ? themeColors.controlSecondaryColor : Qt.alpha("#F9F9F9", 0.5)

    readonly property color textOnAccentColor: themeColors ? themeColors.textOnAccentColor : "#ffffff"
    readonly property color disabledColor: themeColors ? themeColors.disabledColor : "#000000"
    readonly property color controlSecondaryColor: themeColors ? themeColors.controlSecondaryColor : Qt.alpha("#F9F9F9", 0.5)
    readonly property color controlTertiaryColor: themeColors ? themeColors.controlTertiaryColor : Qt.alpha("#F9F9F9", 0.3)
    readonly property color controlBorderStrongColor: themeColors ? themeColors.controlBorderStrongColor : Qt.alpha("#000000", 0.6063)

    readonly property int buttonRadius: themeAppearance ? themeAppearance.buttonRadius : 5
    readonly property int borderWidth: themeAppearance ? themeAppearance.borderWidth : 1

    spacing: 8

    // accessibility
    FocusIndicator {
        control: parent
    }

    contentItem: Text {
        leftPadding: root.indicator.width + root.spacing
        verticalAlignment: Text.AlignVCenter

        text: root.text
    }

    // indicator
    indicator: Rectangle {
        id: background
        width: 20
        height: 20
        x: root.leftPadding
        y: parent.height / 2 - height / 2
        radius: buttonRadius
        color: checkState !== Qt.Unchecked ? primaryColor :
            hovered ? controlTertiaryColor : backgroundColor
        // border
        border.color: checkState !== Qt.Unchecked ? "transparent" : controlBorderStrongColor
        border.width: borderWidth

        Behavior on color { ColorAnimation { duration: Utils.animationSpeed; easing.type: Easing.OutQuart } }
        Behavior on opacity { NumberAnimation { duration: Utils.appearanceSpeed; easing.type: Easing.OutQuart } }

        // indicator checkmark using Unicode
        Text {
            id: checkmark
            anchors.centerIn: parent
            text: checkState !== Qt.PartiallyChecked ? "✓" : "−"
            color: textOnAccentColor
            font.pixelSize: 14
            font.bold: true
            visible: checkState !== Qt.Unchecked

            Behavior on opacity { NumberAnimation { duration: Utils.appearanceSpeed; easing.type: Easing.OutQuart } }
        }
    }

    Behavior on opacity { NumberAnimation { duration: Utils.appearanceSpeed; easing.type: Easing.OutQuart } }

    // states
    states: [
        State {
            name: "disabled"
            when: !enabled
            PropertyChanges {
                target: root
                opacity: 0.4
                primaryColor: disabledColor
            }
        },
        State {
            name: "pressed"
            when: pressed
            PropertyChanges {
                target: background;
                opacity: 0.65
            }
        },
        State {
            name: "hovered"
            when: hovered
            PropertyChanges {
                target: background;
                opacity: 0.875
            }
        }
    ]
}
