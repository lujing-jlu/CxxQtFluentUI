import QtQuick 2.15
import QtQuick.Controls.Basic 2.15
import "../../utils" as Utils
import "../../components" as Rin

SpinBox {
    id: root

    property color themePrimaryColor: themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors.primaryColor : "#0078D4"
    property color themeControlColor: themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors.controlColor : "#ffffff"
    property color themeControlBorderColor: themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors.controlBorderColor : "#8a8a8a"
    property color themeControlSecondaryColor: themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors.controlSecondaryColor : Qt.alpha("#000000", 0.04)
    property color themeControlInputActiveColor: themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors.controlInputActiveColor : "#ffffff"
    property color themeTextControlBorderColor: themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors.textControlBorderColor : "#8a8a8a"
    property color themeTextSecondaryColor: themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors.textSecondaryColor : Qt.alpha("#000000", 0.6)

    property int buttonRadius: themeManager.currentTheme ? themeManager.currentTheme.appearance.buttonRadius : 4
    property int borderWidth: themeManager.currentTheme ? themeManager.currentTheme.appearance.borderWidth : 1

    editable: true
    property color primaryColor: themePrimaryColor

    implicitWidth: Math.max(implicitWidth + 64, 124)

    // Content
    contentItem: TextInput {
        selectByMouse: true
        text: root.textFromValue(root.value, root.locale)
        horizontalAlignment: Qt.AlignLeft
        verticalAlignment: Qt.AlignVCenter
        readOnly: !root.editable
        validator: root.validator
        inputMethodHints: Qt.ImhFormattedNumbersOnly

        font.pixelSize: 14
        color: themeTextSecondaryColor
    }

    // Background
    background: Rectangle {
        id: background
        anchors.fill: parent
        radius: buttonRadius
        color: themeControlColor
        clip: true
        border.width: activeFocus ? 2 : 1
        border.color: activeFocus ? themePrimaryColor : themeControlBorderColor

        // Bottom indicator
        Rectangle {
            id: indicator
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            radius: 99
            height: activeFocus ? 2 : 1
            color: activeFocus ? themePrimaryColor : themeTextControlBorderColor

            Behavior on color { NumberAnimation { duration: 150; easing.type: Easing.OutQuint } }
            Behavior on height { NumberAnimation { duration: 150; easing.type: Easing.OutQuint } }
        }
    }

    // Up button
    up.indicator: Rin.ToolButton {
        id: upBtn
        flat: true
        z: 9
        focusPolicy: editable ? Qt.StrongFocus : Qt.NoFocus
        implicitWidth: 32
        implicitHeight: 24
        anchors.top: parent.top
        anchors.right: downBtn.left
        anchors.bottom: parent.bottom
        anchors.margins: 4
        anchors.bottomMargin: 6
        iconName: "ic_fluent_chevron_up_20_regular"
        iconSize: 16
        iconColor: themeTextSecondaryColor
        hoverable: editable
        onClicked: increase()
    }

    // Down button
    down.indicator: Rin.ToolButton {
        id: downBtn
        z: 9
        flat: true
        focusPolicy: editable ? Qt.StrongFocus : Qt.NoFocus
        implicitWidth: 32
        implicitHeight: 24
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 4
        anchors.bottomMargin: 6
        iconName: "ic_fluent_chevron_down_20_regular"
        iconSize: 16
        iconColor: themeTextSecondaryColor
        hoverable: editable
        onClicked: decrease()
    }

    leftPadding: 12
    rightPadding: 12
    topPadding: 5
    bottomPadding: 7

    Behavior on opacity { NumberAnimation { duration: 150; easing.type: Easing.OutQuint } }

    // Wheel handler
    WheelHandler {
        target: root
        onWheel: (event) => {
            if (!root.focus) return;
            if (event.angleDelta.y > 0) {
                root.value += root.stepSize;
            } else if (event.angleDelta.y < 0) {
                root.value -= root.stepSize;
            }
            event.accepted = true;
        }
    }

    // States
    states: [
        State {
            name: "disabled"
            when: !enabled
            PropertyChanges {
                target: root;
                opacity: !editable ? 1 : 0.4
            }
        },
        State {
            name: "pressed"
            when: activeFocus
            PropertyChanges {
                target: background;
                color: themeControlInputActiveColor
            }
        },
        State {
            name: "hovered"
            when: hovered
            PropertyChanges {
                target: background;
                color: themeControlSecondaryColor
            }
        }
    ]
}
