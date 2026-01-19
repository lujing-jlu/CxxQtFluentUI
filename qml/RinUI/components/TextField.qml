import QtQuick 2.15
import QtQuick.Controls.Basic 2.15
import "../utils" as Utils
import "../components" as Rin

TextField {
    id: root

    property bool frameless: false
    property bool editable: true
    property alias primaryColor: root.color
    property bool clearEnabled: true

    selectByMouse: true
    enabled: editable

    readonly property var colors: themeManager.currentTheme.item ? themeManager.currentTheme.item.colors : QtObject {
        property color primaryColor: "#0078D4"
        property color textColor: "#1b1b1b"
        property color textSecondaryColor: Qt.alpha("#000000", 0.6)
        property color textTertialyColor: Qt.alpha("#000000", 0.4)
        property color textControlBorderColor: "#8a8a8a"
        property color controlColor: "#ffffff"
        property color controlSecondaryColor: Qt.alpha("#000000", 0.04)
        property color controlInputActiveColor: "#ffffff"
        property color controlBorderColor: "#8a8a8a"
    }

    readonly property var typography: themeManager.currentTheme.item ? themeManager.currentTheme.item.typography : QtObject {
        property int bodySize: 14
    }

    // Background
    background: Rectangle {
        id: background
        anchors.fill: parent
        radius: 4
        color: root.frameless ? "transparent" : colors.controlColor
        clip: true
        border.width: root.activeFocus ? 2 : 1
        border.color: root.activeFocus ? colors.primaryColor : colors.controlBorderColor

        // Bottom indicator
        Rectangle {
            id: indicator
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            radius: 99
            height: root.activeFocus ? 2 : 1
            color: root.activeFocus ? colors.primaryColor : colors.textControlBorderColor

            Behavior on color { NumberAnimation { duration: 150; easing.type: Easing.OutQuart } }
            Behavior on height { NumberAnimation { duration: 150; easing.type: Easing.OutQuart } }
        }
    }

    Behavior on opacity { NumberAnimation { duration: 150; easing.type: Easing.OutQuint } }

    // Font
    font.pixelSize: typography.bodySize
    font.family: Utils.FontIconLoader.fontFamily
    color: colors.textColor
    placeholderTextColor: colors.textSecondaryColor

    leftPadding: 12
    rightPadding: (clearEnabled && clearBtn.visible ? 28 : 12)
    topPadding: 6
    bottomPadding: 6

    // Clear button
    Rin.Button {
        id: clearBtn
        anchors.right: parent.right
        anchors.margins: 4
        anchors.rightMargin: root.rightPadding - width + 2
        anchors.verticalCenter: parent.verticalCenter
        implicitWidth: 26
        implicitHeight: 22
        focusPolicy: Qt.NoFocus
        flat: true
        highlighted: true
        visible: clearEnabled && root.text && root.text.length > 0 && root.activeFocus
        onClicked: root.text = ""
        radius: 4

        contentItem: Rin.Icon {
            name: "ic_fluent_dismiss_20_regular"
            size: 14
            color: colors.textTertialyColor
        }
    }

    // States
    states: [
        State {
            name: "disabled"
            when: !enabled
            PropertyChanges {
                target: background;
                opacity: !editable ? 1 : 0.4
            }
        },
        State {
            name: "pressed"
            when: root.activeFocus
            PropertyChanges {
                target: background;
                color: colors.controlInputActiveColor
            }
        },
        State {
            name: "hovered"
            when: hovered
            PropertyChanges {
                target: background;
                color: colors.controlSecondaryColor
            }
        }
    ]
}
