import QtQuick 2.15
import QtQuick.Controls.Basic 2.15
import "../../utils"
import "../../themes"
import "../../components"

Switch {
    id: root

    implicitHeight: 20
    implicitWidth: Math.max(
        background.width,
        background.width + 12 + label.implicitWidth
    )

    property color backgroundColor: ThemeManager.currentTheme.colors.controlSecondaryColor
    property color primaryColor: ThemeManager.currentTheme.colors.primaryColor
    property string checkedText: qsTr("On")
    property string uncheckedText: qsTr("Off")

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
            hovered ? ThemeManager.currentTheme.colors.controlTertiaryColor : backgroundColor

        // border
        border.color: checked ? "transparent" : ThemeManager.currentTheme.colors.controlBorderStrongColor
        border.width: ThemeManager.currentTheme.appearance.borderWidth

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
        color: checked ? ThemeManager.currentTheme.colors.textOnAccentColor : ThemeManager.currentTheme.colors.controlBorderStrongColor

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
        Rectangle { width: 40; height: 20; color: "transparent" }  // placeholder

        Text {
            id: label
            text: (root.text === '') ? root.checked ? checkedText : uncheckedText : root.text
            elide: Text.ElideRight
            verticalAlignment: Text.AlignVCenter
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
                primaryColor: ThemeManager.currentTheme.colors.disabledColor
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
