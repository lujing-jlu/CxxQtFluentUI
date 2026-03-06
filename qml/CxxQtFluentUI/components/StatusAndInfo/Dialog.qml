import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../../utils" as Utils
import "../../components" as Rin
import "../../themes"

Dialog {
    id: root

    property var colors: ThemeManager.currentTheme && ThemeManager.currentTheme.colors ? ThemeManager.currentTheme.colors : QtObject {
        property color backgroundAcrylicColor: "#ffffff"
        property color windowBorderColor: "#e5e5e5"
        property color backgroundSmokeColor: Qt.alpha("#000000", 0.32)
    }

    property var appearance: ThemeManager.currentTheme ? ThemeManager.currentTheme.appearance : QtObject {
        property int windowRadius: 8
    }

    property var typography: ThemeManager.currentTheme ? ThemeManager.currentTheme.typography : QtObject {
        property int subtitleSize: 20
    }

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
            font.pixelSize: typography.subtitleSize
            font.bold: true
            text: root.title
            color: colors.textColor
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
        color: colors.backgroundAcrylicColor
        border.color: colors.windowBorderColor
        border.width: 1
        radius: appearance.windowRadius
    }

    Overlay.modal: Rectangle {
        color: colors.backgroundSmokeColor
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
