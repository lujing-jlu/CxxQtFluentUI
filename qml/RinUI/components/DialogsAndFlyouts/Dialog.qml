import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15
import "../../themes"
import "../../utils"
import "../../components"


Dialog {
    id: root

    property bool titleBarVisible: false

    anchors.centerIn: Overlay.overlay  // Center in the overlay
    closePolicy: Popup.NoAutoClose  // 更符合fds规范

    padding: 24
    topPadding: 24
    bottomPadding: 24
    implicitWidth: Math.max(Utils.dialogMinimumWidth, Math.min(implicitContentWidth + 48, Utils.dialogMaximumWidth))

    contentItem: ColumnLayout {
        spacing: 12
        Text {
            Layout.fillWidth: true
            font.pixelSize: 20; font.weight: Font.Medium
            text: root.title
        }
    }


    header: Item {}

    // 定制footer
    footer: DialogButtonBox {
        id: buttonBox
        standardButtons: root.standardButtons
    }

    background: Rectangle {
        id: background
        anchors.fill: parent
        color: themeManager.currentTheme.colors.backgroundAcrylicColor
        border.color: themeManager.currentTheme.colors.windowBorderColor
        border.width: 1
        radius: themeManager.currentTheme.appearance.windowRadius

        Behavior on color {
            ColorAnimation {
                duration: Utils.backdropEnabled ? 0 : 150
            }
        }

        layer.enabled: true
        layer.effect: Shadow {
            style: "dialog"
            source: background
        }
    }

    Overlay.modal: Rectangle {
        color: themeManager.currentTheme.colors.backgroundSmokeColor
    }

    // 动画 / Animation //
    enter: Transition {
        ParallelAnimation {
            NumberAnimation {
                target: root
                property: "opacity"
                from: 0
                to: 1
                duration: Utils.appearanceSpeed
                easing.type: Easing.InOutQuart
            }
            NumberAnimation {
                target: root
                property: "scale"
                from: 1.1
                to: 1
                duration: Utils.animationSpeedMiddle
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
                duration: Utils.animationSpeedMiddle
                easing.type: Easing.OutQuint
            }
        }
    }
}
