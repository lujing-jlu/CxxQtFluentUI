import QtQuick 2.15
import QtQuick.Controls.Basic 2.15
import "../../utils"
import "../../themes"
import "../../components"

RadioButton {
    id: root
    property color backgroundColor: ThemeManager.currentTheme.colors.controlSecondaryColor
    property color primaryColor: ThemeManager.currentTheme.colors.primaryColor

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

        radius: width / 2
        color: checked ? primaryColor :
            hovered ? ThemeManager.currentTheme.colors.controlTertiaryColor : backgroundColor
        // border
        border.color: checked ? "transparent" : ThemeManager.currentTheme.colors.controlBorderStrongColor
        border.width: ThemeManager.currentTheme.appearance.borderWidth

        Behavior on color { ColorAnimation { duration: Utils.animationSpeed; easing.type: Easing.OutQuart } }
        Behavior on opacity { NumberAnimation { duration: Utils.appearanceSpeed; easing.type: Easing.OutQuart } }

        // inner circle indicator
        Rectangle {
            id: indicator
            anchors.centerIn: parent
            width: background.width / 2
            height: background.height / 2
            scale: enabled ?
                checked ? pressed ? 0.8 : hovered ? 1.25 : 1   // checked
                    : pressed ? 1 : 0  // unchecked
                : checked ? 1 : 0  // disabled

            anchors.verticalCenter: background.verticalCenter
            radius: height / 2
            color: checked ? ThemeManager.currentTheme.colors.textOnAccentColor : pressed ? ThemeManager.currentTheme.colors.textOnAccentColor : "transparent"

            Behavior on color { ColorAnimation { duration: Utils.animationSpeed; easing.type: Easing.OutQuart } }
            Behavior on scale { NumberAnimation { duration: Utils.animationSpeed; easing.type: Easing.OutQuint } }
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
                primaryColor: ThemeManager.currentTheme.colors.disabledColor
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
