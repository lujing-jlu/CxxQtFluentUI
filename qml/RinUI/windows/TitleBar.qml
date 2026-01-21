import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import "../themes"
import "../components"

Item {
    id: root
    property int titleBarHeight: themeManager.currentTheme && themeManager.currentTheme.appearance ?
        themeManager.currentTheme.appearance.windowTitleBarHeight : 48
    property alias title: titleLabel.text
    property alias icon: iconLabel.source
    property alias backgroundColor: rectBk.color

    property bool titleEnabled: true
    property alias iconEnabled: iconLabel.visible
    property bool minimizeEnabled: true
    property bool maximizeEnabled: true
    property bool closeEnabled: true

    property alias minimizeVisible: minimizeBtn.visible
    property alias maximizeVisible: maximizeBtn.visible
    property alias closeVisible: closeBtn.visible

    default property alias content: contentItem.data

    property var window: null

    height: titleBarHeight
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    clip: true
    z: 999

    property color textColor: themeManager.currentTheme && themeManager.currentTheme.colors ?
        themeManager.currentTheme.colors.textColor : "#1b1b1b"

    function toggleMaximized() {
        if (!maximizeEnabled) return
        WindowManager.maximizeWindow(window)
    }

    Rectangle {
        id: rectBk
        anchors.fill: parent
        color: "transparent"

        MouseArea {
            anchors.fill: parent
            anchors.leftMargin: 48
            anchors.margins: 4
            propagateComposedEvents: true
            acceptedButtons: Qt.LeftButton

            property point clickPos: Qt.point(0, 0)

            onPressed: clickPos = Qt.point(mouseX, mouseY)
            onDoubleClicked: toggleMaximized()

            onPositionChanged: function(mouse) {
                if (window && (window.visibility === Window.Maximized || window.isMaximized || window.isFullScreen)) {
                    return
                }

                // Mouse offset
                let delta = Qt.point(mouse.x - clickPos.x, mouse.y - clickPos.y)

                if (window) {
                    window.x = window.x + delta.x
                    window.y = window.y + delta.y
                }
            }
        }
    }

    RowLayout {
        anchors.fill: parent
        anchors.margins: 0
        spacing: 0

        RowLayout {
            id: titleRow
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.leftMargin: 16
            spacing: 16
            opacity: root.titleEnabled

            Behavior on opacity { NumberAnimation { duration: 150 } }

            Icon {
                id: iconLabel
                size: 16
                Layout.alignment: Qt.AlignVCenter
                visible: source !== ""
            }

            Text {
                id: titleLabel
                Layout.alignment: Qt.AlignVCenter
                font.pixelSize: 12
                color: textColor
                text: qsTr("Fluent TitleBar")
            }
        }

        Item {
            id: contentItem
            Layout.fillWidth: true
            Layout.fillHeight: true
            clip: true
        }

        Row {
            width: implicitWidth
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignRight
            spacing: 0

            CtrlBtn {
                id: minimizeBtn
                mode: 1
                enabled: root.minimizeEnabled
                visible: root.minimizeVisible
                window: root.window
            }

            CtrlBtn {
                id: maximizeBtn
                mode: 0
                enabled: root.maximizeEnabled
                visible: root.maximizeVisible
                window: root.window
            }

            CtrlBtn {
                id: closeBtn
                mode: 2
                enabled: root.closeEnabled
                visible: root.closeVisible
                window: root.window
            }
        }
    }
}
