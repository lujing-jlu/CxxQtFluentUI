import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtQuick.Window 2.15
import "../themes"
import "../windows"
import "../components"

ApplicationWindow {
    id: baseWindow
    property int hwnd: 0
    property bool isRinUIWindow: true

    flags: Qt.FramelessWindowHint | Qt.Window | Qt.WindowMinimizeButtonHint | Qt.WindowMaximizeButtonHint

    color: "transparent"

    property var icon: ""
    property alias titleEnabled: titleBar.titleEnabled
    property alias minimizeEnabled: titleBar.minimizeEnabled
    property bool maximizeEnabled: maximumHeight === 16777215 && maximumWidth === 16777215
    property alias closeEnabled: titleBar.closeEnabled

    property alias minimizeVisible: titleBar.minimizeVisible
    property alias maximizeVisible: titleBar.maximizeVisible
    property alias closeVisible: titleBar.closeVisible

    property int titleBarHeight: themeManager.currentTheme && themeManager.currentTheme.appearance ?
        themeManager.currentTheme.appearance.windowTitleBarHeight : 48
    property alias titleBarArea: titleBar.content

    property alias framelessMenuBar: menuBarArea.children
    default property alias content: contentArea.children
    property alias floatLayer: floatLayer

    property color backgroundColor: themeManager.currentTheme && themeManager.currentTheme.colors ?
        themeManager.currentTheme.colors.backgroundColor : "#F3F3F3"
    property color windowBorderColor: themeManager.currentTheme && themeManager.currentTheme.colors ?
        themeManager.currentTheme.colors.windowBorderColor : Qt.alpha("#757575", 0.09)
    property real windowRadius: themeManager.currentTheme && themeManager.currentTheme.appearance ?
        themeManager.currentTheme.appearance.windowRadius : 7

    onVisibilityChanged: {
        if (baseWindow.visibility === Window.Maximized) {
            background.radius = 0
        } else {
            background.radius = windowRadius
        }
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.topMargin: 4
        anchors.bottomMargin: 4
        anchors.leftMargin: 4
        anchors.rightMargin: 4
        spacing: 0

        Item {
            Layout.preferredHeight: titleBar.height
            Layout.fillWidth: true
        }

        Item {
            id: menuBarArea
            Layout.fillWidth: true
        }

        Item {
            id: contentArea
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }

    TitleBar {
        id: titleBar
        window: baseWindow
        icon: baseWindow.icon || ""
        title: baseWindow.title || ""
        Layout.fillWidth: true
        height: baseWindow.titleBarHeight
        maximizeEnabled: baseWindow.maximizeEnabled
    }

    background: Rectangle {
        id: background
        anchors.fill: parent
        color: backgroundColor
        border.color: windowBorderColor
        border.width: 1
        radius: windowRadius
        z: -1
        clip: true

        Behavior on color { ColorAnimation { duration: 150 } }
    }

    Behavior on color { ColorAnimation { duration: 150 } }

    FloatLayer {
        id: floatLayer
        anchors.topMargin: titleBarHeight
        z: 998
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: baseWindow.visibility !== Window.Maximized
        z: -1
        cursorShape: {
            const p = Qt.point(mouseX, mouseY)
            const b = 4
            if (p.x < b && p.y < b) return Qt.SizeFDiagCursor
            if (p.x >= width - b && p.y >= height - b) return Qt.SizeFDiagCursor
            if (p.x >= width - b && p.y < b) return Qt.SizeBDiagCursor
            if (p.x < b && p.y >= height - b) return Qt.SizeBDiagCursor
            if (p.x < b || p.x >= width - b) return Qt.SizeHorCursor
            if (p.y < b || p.y >= height - b) return Qt.SizeVerCursor
            return Qt.ArrowCursor
        }
        acceptedButtons: Qt.NoButton
    }
}
