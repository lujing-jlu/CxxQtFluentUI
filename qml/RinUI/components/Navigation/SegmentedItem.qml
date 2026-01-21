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
    property color controlFillColor: themeManager.currentTheme && themeManager.currentTheme.colors ?
        themeManager.currentTheme.colors.controlFillColor : "#ffffff"
    property color subtleSecondaryColor: themeManager.currentTheme && themeManager.currentTheme.colors ?
        themeManager.currentTheme.colors.subtleSecondaryColor : "#e0e0e0"
    property color subtleColor: themeManager.currentTheme && themeManager.currentTheme.colors ?
        themeManager.currentTheme.colors.subtleColor : "#f0f0f0"
    property color controlBorderColor: themeManager.currentTheme && themeManager.currentTheme.colors ?
        themeManager.currentTheme.colors.controlBorderColor : "#000000"
    property real smallRadius: themeManager.currentTheme && themeManager.currentTheme.appearance ?
        themeManager.currentTheme.appearance.smallRadius : 3
    property real borderWidth: themeManager.currentTheme && themeManager.currentTheme.appearance ?
        themeManager.currentTheme.appearance.borderWidth : 1
    property int animationSpeed: 150

    background: Rectangle {
        id: background
        anchors.centerIn: parent
        width: checked ? parent.width : parent.width - 8
        height: checked ? parent.height : parent.height - 6

        color: checked ? controlFillColor :
            hovered ? subtleSecondaryColor : subtleColor
        radius: smallRadius

        border.width: borderWidth
        border.color: checked ? controlBorderColor : "transparent"

        Behavior on scale {
            NumberAnimation {
                duration: animationSpeed
                easing.type: Easing.OutQuart
            }
        }
    }

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
            PropertyChanges {
                target: background
                scale: 0.95
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
