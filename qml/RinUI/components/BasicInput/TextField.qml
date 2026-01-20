import QtQuick 2.15
import QtQuick.Controls.Basic 2.15
import "../../utils" as Utils
import "../../components" as Rin

TextField {
    id: root

    property bool frameless: false
    property bool editable: true
    property bool clearEnabled: true

    // Fallback colors
    property color fallbackPrimaryColor: "#0078D4"
    property color fallbackTextColor: "#1b1b1b"
    property color fallbackTextSecondaryColor: Qt.alpha("#000000", 0.6)
    property color fallbackTextTertialyColor: Qt.alpha("#000000", 0.4)
    property color fallbackTextControlBorderColor: "#8a8a8a"
    property color fallbackControlColor: "#ffffff"
    property color fallbackControlSecondaryColor: Qt.alpha("#000000", 0.04)
    property color fallbackControlInputActiveColor: "#ffffff"
    property color fallbackControlBorderColor: "#8a8a8a"

    selectByMouse: true
    enabled: editable

    // Background
    background: Rectangle {
        id: background
        anchors.fill: parent
        radius: 4
        color: root.frameless ? "transparent" : controlColor
        clip: true
        border.width: root.activeFocus ? 2 : 1
        border.color: root.activeFocus ? primaryColor : controlBorderColor

        // Bottom indicator
        Rectangle {
            id: indicator
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            radius: 99
            height: root.activeFocus ? 2 : 1
            color: root.activeFocus ? primaryColor : textControlBorderColor

            Behavior on color { NumberAnimation { duration: 150; easing.type: Easing.OutQuart } }
            Behavior on height { NumberAnimation { duration: 150; easing.type: Easing.OutQuart } }
        }
    }

    Behavior on opacity { NumberAnimation { duration: 150; easing.type: Easing.OutQuint } }

    // Font
    font.pixelSize: 14
    font.family: Utils.FontIconLoader.fontFamily
    color: textColor
    placeholderTextColor: textSecondaryColor

    leftPadding: 12
    rightPadding: (clearEnabled && clearBtn.visible ? 28 : 12)
    topPadding: 6
    bottomPadding: 6

    // Color accessors
    function getColor(name) {
        if (themeManager.currentTheme && themeManager.currentTheme && themeManager.currentTheme.colors[name]) {
            return themeManager.currentTheme.colors[name];
        }
        switch(name) {
            case "primaryColor": return fallbackPrimaryColor;
            case "textColor": return fallbackTextColor;
            case "textSecondaryColor": return fallbackTextSecondaryColor;
            case "textTertialyColor": return fallbackTextTertialyColor;
            case "textControlBorderColor": return fallbackTextControlBorderColor;
            case "controlColor": return fallbackControlColor;
            case "controlSecondaryColor": return fallbackControlSecondaryColor;
            case "controlInputActiveColor": return fallbackControlInputActiveColor;
            case "controlBorderColor": return fallbackControlBorderColor;
            default: return fallbackTextColor;
        }
    }

    property color primaryColor: getColor("primaryColor")
    property color textColor: getColor("textColor")
    property color textSecondaryColor: getColor("textSecondaryColor")
    property color textControlBorderColor: getColor("textControlBorderColor")
    property color controlColor: getColor("controlColor")
    property color controlSecondaryColor: getColor("controlSecondaryColor")
    property color controlInputActiveColor: getColor("controlInputActiveColor")
    property color controlBorderColor: getColor("controlBorderColor")
    property color textTertialyColor: getColor("textTertialyColor")

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

        background: Rectangle {
            radius: 4
        }

        contentItem: Rin.Icon {
            name: "ic_fluent_dismiss_20_regular"
            size: 14
            color: root.textTertialyColor
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
                color: controlInputActiveColor
            }
        },
        State {
            name: "hovered"
            when: hovered
            PropertyChanges {
                target: background;
                color: controlSecondaryColor
            }
        }
    ]
}
