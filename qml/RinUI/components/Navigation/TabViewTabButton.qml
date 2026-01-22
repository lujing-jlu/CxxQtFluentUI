import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15
import "../../themes"
import "../../utils"
import "../../components" as Rin

TabButton {
    id: root

    property string iconName: ""
    property bool closable: false

    signal closeClicked()

    implicitHeight: 36
    implicitWidth: Math.max(96, row.implicitWidth + 18)

    property color textColor: themeManager.currentTheme && themeManager.currentTheme.colors
        ? themeManager.currentTheme.colors.textColor
        : "#1b1b1b"
    property color subtleColor: themeManager.currentTheme && themeManager.currentTheme.colors
        ? themeManager.currentTheme.colors.subtleColor
        : "transparent"
    property color subtleSecondaryColor: themeManager.currentTheme && themeManager.currentTheme.colors
        ? themeManager.currentTheme.colors.subtleSecondaryColor
        : Qt.alpha("#000000", 0.04)
    property color controlFillColor: themeManager.currentTheme && themeManager.currentTheme.colors
        ? themeManager.currentTheme.colors.controlFillColor
        : Qt.alpha("#ffffff", 0.7)
    property color controlBorderColor: themeManager.currentTheme && themeManager.currentTheme.colors
        ? themeManager.currentTheme.colors.controlBorderColor
        : Qt.alpha("#000000", 0.06)
    property color primaryColor: themeManager.currentTheme && themeManager.currentTheme.colors
        ? themeManager.currentTheme.colors.primaryColor
        : "#0078D4"
    property int radius: themeManager.currentTheme && themeManager.currentTheme.appearance
        ? themeManager.currentTheme.appearance.buttonRadius
        : 5
    property int borderWidth: themeManager.currentTheme && themeManager.currentTheme.appearance
        ? themeManager.currentTheme.appearance.borderWidth
        : 1

    background: Rectangle {
        anchors.fill: parent
        radius: root.radius
        color: root.checked ? root.controlFillColor : (root.hovered ? root.subtleSecondaryColor : root.subtleColor)
        border.width: root.checked ? root.borderWidth : 0
        border.color: root.controlBorderColor

        Behavior on color { ColorAnimation { duration: Utils.appearanceSpeed; easing.type: Easing.OutQuart } }
    }

    contentItem: Item {
        anchors.fill: parent
        clip: true

        RowLayout {
            id: row
            anchors.fill: parent
            anchors.leftMargin: 12
            anchors.rightMargin: 8
            spacing: 8

            Rin.Icon {
                visible: root.iconName !== ""
                name: root.iconName
                size: 16
                color: root.textColor
                Layout.alignment: Qt.AlignVCenter
            }

            Text {
                text: root.text
                font.pixelSize: 14
                color: root.textColor
                elide: Text.ElideRight
                Layout.alignment: Qt.AlignVCenter
                Layout.fillWidth: true
            }

            Rin.ToolButton {
                visible: root.closable
                flat: true
                hoverable: true
                width: 28
                height: 28
                iconName: "ic_fluent_dismiss_20_regular"
                iconSize: 12
                onClicked: root.closeClicked()
            }
        }

        Rectangle {
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.bottomMargin: root.borderWidth
            height: 3
            radius: 2
            color: root.primaryColor
            visible: root.checked
        }
    }
}

