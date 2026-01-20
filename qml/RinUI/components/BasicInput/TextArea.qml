import QtQuick 2.15
import QtQuick.Controls.Basic 2.15
import "../../utils" as Utils
import "../../components" as Rin

TextArea {
    id: root

    property var colors: themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors : QtObject {
        property color primaryColor: "#0078D4"
        property color textColor: "#1b1b1b"
        property color textSecondaryColor: Qt.alpha("#000000", 0.6)
        property color textControlBorderColor: "#8a8a8a"
        property color controlColor: "#ffffff"
        property color controlSecondaryColor: Qt.alpha("#000000", 0.04)
        property color controlInputActiveColor: "#ffffff"
        property color controlBorderColor: "#8a8a8a"
    }

    property var typography: themeManager.currentTheme ? themeManager.currentTheme.typography : QtObject {
        property int bodySize: 14
    }

    property var appearance: themeManager.currentTheme ? themeManager.currentTheme.appearance : QtObject {
        property int buttonRadius: 4
        property int borderWidth: 1
    }

    property bool frameless: false
    property bool editable: true
    property alias primaryColor: root.color

    selectByMouse: true
    enabled: editable

    // Background
    background: Rectangle {
        id: background
        anchors.fill: parent
        radius: appearance.buttonRadius
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
            color: root.activeFocus ? colors.primaryColor : root.frameless ? "transparent" : colors.textControlBorderColor

            Behavior on color { NumberAnimation { duration: 150; easing.type: Easing.OutQuint } }
            Behavior on height { NumberAnimation { duration: 150; easing.type: Easing.OutQuint } }
        }
    }

    Behavior on opacity { NumberAnimation { duration: 150; easing.type: Easing.OutQuint } }

    // Font
    font.pixelSize: typography.bodySize
    font.family: Utils.FontIconLoader.fontFamily

    wrapMode: Text.WordWrap
    selectionColor: colors.primaryColor
    color: colors.textColor
    placeholderTextColor: colors.textSecondaryColor

    leftPadding: 12
    rightPadding: 12
    topPadding: 8
    bottomPadding: 8

    // Animation
    Behavior on implicitHeight { NumberAnimation { duration: 150; easing.type: Easing.OutQuint } }

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
