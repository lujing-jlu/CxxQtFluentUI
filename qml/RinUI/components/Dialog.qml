import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../utils" as Utils
import "../components" as Rin

Dialog {
    id: root

    property color backgroundAcrylicColor: themeManager.currentTheme && themeManager.currentTheme.colors
        ? themeManager.currentTheme.colors.backgroundAcrylicColor : "#ffffff"
    property color windowBorderColor: themeManager.currentTheme && themeManager.currentTheme.colors
        ? themeManager.currentTheme.colors.windowBorderColor : "#e5e5e5"
    property color backgroundSmokeColor: "#55000000"
    property color textColor: themeManager.currentTheme && themeManager.currentTheme.colors
        ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
    property int windowRadius: themeManager.currentTheme && themeManager.currentTheme.appearance
        ? themeManager.currentTheme.appearance.windowRadius : 8
    property int subtitleSize: themeManager.currentTheme && themeManager.currentTheme.typography
        ? themeManager.currentTheme.typography.subtitleSize : 20

    property bool titleBarVisible: false

    anchors.centerIn: Overlay.overlay
    closePolicy: Popup.NoAutoClose

    padding: 24
    topPadding: 24
    bottomPadding: 24

    implicitWidth: Math.max(320, Math.min(implicitContentWidth + 48, 520))

    contentItem: ColumnLayout {
        spacing: 12
        Text {
            Layout.fillWidth: true
            font.pixelSize: subtitleSize
            font.bold: true
            text: root.title
            color: textColor
        }
    }

    header: Item {}

    footer: DialogButtonBox {
        id: buttonBox
        standardButtons: root.standardButtons
    }

    background: Rectangle {
        id: background
        anchors.fill: parent
        color: backgroundAcrylicColor
        border.color: windowBorderColor
        border.width: 1
        radius: windowRadius
    }

    Overlay.modal: Rectangle {
        color: backgroundSmokeColor
    }

    // Animation
    enter: Transition {
        ParallelAnimation {
            NumberAnimation {
                target: root
                property: "opacity"
                from: 0
                to: 1
                duration: 200
                easing.type: Easing.InOutQuart
            }
            NumberAnimation {
                target: root
                property: "scale"
                from: 1.1
                to: 1
                duration: 250
                easing.type: Easing.OutQuint
            }
        }
    }

    exit: Transition {
        ParallelAnimation {
            NumberAnimation {
                target: root
                property: "opacity"
                from: 1
                to: 0
                duration: 100
                easing.type: Easing.InOutQuart
            }
            NumberAnimation {
                target: root
                property: "scale"
                from: 1
                to: 1.1
                duration: 250
                easing.type: Easing.OutQuint
            }
        }
    }
}
