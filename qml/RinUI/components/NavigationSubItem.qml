import QtQuick 2.15
import QtQuick.Controls 2.15
import "../themes"
import "../components" as Rin

Item {
    id: root
    property var itemData: ({})
    property var navigationView: null
    property bool highlighted: false

    height: 38
    width: parent ? parent.width : 200

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        onClicked: {
            if (itemData.page && navigationView) {
                navigationView.push(itemData.page)
            }
        }
    }

    Rectangle {
        id: itemBg
        anchors.fill: parent
        anchors.leftMargin: 11 + 34
        anchors.rightMargin: 8
        anchors.topMargin: 2
        anchors.bottomMargin: 2
        radius: 4
        color: mouseArea.pressed
            ? (themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors.subtleTertiaryColor : Qt.alpha("#000000", 0.12))
            : (root.highlighted || mouseArea.containsMouse)
                ? (themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors.subtleSecondaryColor : Qt.alpha("#000000", 0.06))
                : "transparent"
        opacity: root.highlighted || mouseArea.containsMouse ? 1 : 0

        Behavior on opacity {
            NumberAnimation { duration: 100 }
        }

        Behavior on color {
            ColorAnimation {
                duration: 150
                easing.type: Easing.InOutQuart
            }
        }
    }

    Row {
        id: left
        spacing: 16
        anchors.left: parent.left
        anchors.leftMargin: 11 + 34
        anchors.verticalCenter: parent.verticalCenter

        Rin.Icon {
            id: icon
            anchors.verticalCenter: parent.verticalCenter
            size: (itemData.size !== undefined && itemData.size !== null) ? itemData.size : (itemData.icon ? 19 : 0)
            name: itemData.icon || ""
            color: root.highlighted ?
                (themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors.primaryColor : "#0078D4") :
                (themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors.textColor : "#1b1b1b")
        }

        Text {
            id: text
            anchors.verticalCenter: parent.verticalCenter
            text: itemData.title || ""
            font.pixelSize: 14
            color: root.highlighted ?
                (themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors.primaryColor : "#0078D4") :
                (themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors.textColor : "#1b1b1b")
            clip: true
            wrapMode: Text.NoWrap
            elide: Text.ElideRight
        }
    }

    // Highlight indicator
    Rectangle {
        id: indicator
        x: left.x - 11
        y: root.height / 2 - height / 2 - 2
        width: 3
        height: 20
        radius: 1
        color: themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors.primaryColor : "#0078D4"
        visible: root.highlighted
    }

    ToolTip {
        visible: mouseArea.containsMouse
        delay: 500
        text: itemData.title || ""
    }
}
