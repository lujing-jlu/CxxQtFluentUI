import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Window 2.15
import "../themes"
import "../components"

Rectangle {
    id: root
    property int mode: 0  // 0: max/restore, 1: minimize, 2: close
    property var window: null

    property color captionCloseColor: themeManager.currentTheme && themeManager.currentTheme.colors ?
        themeManager.currentTheme.colors.captionCloseColor : "#c42b1c"
    property color captionCloseTextColor: themeManager.currentTheme && themeManager.currentTheme.colors ?
        themeManager.currentTheme.colors.captionCloseTextColor : "#ffffff"
    property color subtleSecondaryColor: themeManager.currentTheme && themeManager.currentTheme.colors ?
        themeManager.currentTheme.colors.subtleSecondaryColor : Qt.alpha("#000000", 0.04)
    property color textColor: themeManager.currentTheme && themeManager.currentTheme.colors ?
        themeManager.currentTheme.colors.textColor : "#1b1b1b"

    implicitWidth: 46
    height: parent ? parent.height : 32

    color: "transparent"
    opacity: enabled ? 1 : 0.5

    // Tooltip
    ToolTip {
        parent: root
        delay: 500
        visible: mouseArea.containsMouse
        text: mode === 0 ? qsTr("Maximize") :
              mode === 1 ? qsTr("Minimize") :
              mode === 2 ? qsTr("Close") : qsTr("Unknown")
    }

    function toggleControl() {
        if (!window) return

        if (mode === 0) {
            WindowManager.maximizeWindow(window)
        } else if (mode === 1) {
            WindowManager.minimizeWindow(window)
        } else if (mode === 2) {
            WindowManager.closeWindow(window)
        }
    }

    // Background for hover/press states
    Rectangle {
        id: background
        anchors.fill: parent
        color: root.mode === 2 ? root.captionCloseColor : root.subtleSecondaryColor
        opacity: 0

        Behavior on opacity { NumberAnimation { duration: 100; easing.type: Easing.InOutQuad } }
    }

    // Button icon
    Canvas {
        id: iconCanvas
        anchors.centerIn: parent
        width: mode === 0 ? 14 : 12
        height: mode === 0 ? 14 : 12

        property color iconColor: textColor

        onPaint: {
            var ctx = getContext("2d")
            ctx.clearRect(0, 0, width, height)
            ctx.fillStyle = iconColor
            ctx.lineWidth = 1.5

            if (root.mode === 0) {
                // Maximize/Restore icon
                if (window && (window.visibility === Window.Maximized || window.isMaximized)) {
                    // Restore icon (two overlapping rectangles)
                    ctx.strokeRect(0, 2, width - 4, height - 6)
                    ctx.fillRect(4, 0, width - 4, height - 6)
                } else {
                    // Maximize icon (single rectangle)
                    ctx.strokeRect(0, 0, width, height)
                }
            } else if (root.mode === 1) {
                // Minimize icon (horizontal line)
                ctx.fillRect(0, height / 2, width, 2)
            } else if (root.mode === 2) {
                // Close icon (X)
                ctx.beginPath()
                ctx.moveTo(0, 0)
                ctx.lineTo(width, height)
                ctx.moveTo(width, 0)
                ctx.lineTo(0, height)
                ctx.stroke()
            }
        }

        onIconColorChanged: requestPaint()
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        enabled: root.enabled
        hoverEnabled: true
        onClicked: root.toggleControl()
    }

    states: [
        State {
            name: "pressed"
            when: mouseArea.pressed
            PropertyChanges {
                target: background
                opacity: 0.8
            }
            PropertyChanges {
                target: iconCanvas
                iconColor: root.mode === 2 ? root.captionCloseTextColor : root.textColor
            }
        },
        State {
            name: "hovered"
            when: mouseArea.containsMouse
            PropertyChanges {
                target: background
                opacity: 1
            }
            PropertyChanges {
                target: iconCanvas
                iconColor: root.mode === 2 ? root.captionCloseTextColor : root.textColor
            }
        }
    ]
}
