import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../themes"
import "../../components" as Rin

TabButton {
    id: root

    implicitWidth: Math.max(row.implicitWidth + 26, 40)
    implicitHeight: 32

    property color primaryColor: themeManager.currentTheme && themeManager.currentTheme.colors ?
        themeManager.currentTheme.colors.primaryColor : "#0078D4"
    property color textColor: themeManager.currentTheme && themeManager.currentTheme.colors ?
        themeManager.currentTheme.colors.textColor : "#1b1b1b"
    property real borderWidth: themeManager.currentTheme && themeManager.currentTheme.appearance ?
        themeManager.currentTheme.appearance.borderWidth : 1
    property int animationSpeed: 150

    background: Item {}

    Behavior on opacity {
        NumberAnimation {
            duration: animationSpeed
            easing.type: Easing.InOutQuint
        }
    }

    contentItem: Item {
        clip: true
        anchors.fill: parent

        Row {
            id: row
            spacing: 8
            anchors.centerIn: parent

            Rin.Icon {
                id: iconWidget
                size: (icon || source) ? text.font.pixelSize * 1.3 : 0
                name: root.icon.name || ""
                source: root.icon.source || ""
                color: textColor
            }

            Text {
                id: text
                font.pixelSize: 14
                text: root.text
                color: textColor
            }
        }

        Rin.Indicator {
            anchors {
                bottom: parent.bottom
                bottomMargin: borderWidth
                horizontalCenter: parent.horizontalCenter
            }
            visible: root.checked
            orientation: Qt.Horizontal
            primaryColor: root.primaryColor
        }
    }

    states: [
        State {
            name: "disabled"
            when: !enabled
            PropertyChanges {
                target: root
                opacity: 0.65
            }
        },
        State {
            name: "pressed"
            when: pressed
            PropertyChanges {
                target: root
                opacity: 0.67
            }
        },
        State {
            name: "hovered"
            when: hovered
            PropertyChanges {
                target: root
                opacity: 0.875
            }
        }
    ]
}
