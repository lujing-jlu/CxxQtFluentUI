import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15
import "../../themes"
import "../../utils"
import "../../components" as Rin

Button {
    id: root

    property string iconName: ""

    implicitHeight: 36
    implicitWidth: Math.max(36, row.implicitWidth + 18)

    property color textColor: themeManager.currentTheme && themeManager.currentTheme.colors
        ? themeManager.currentTheme.colors.textColor
        : "#1b1b1b"
    property color subtleSecondaryColor: themeManager.currentTheme && themeManager.currentTheme.colors
        ? themeManager.currentTheme.colors.subtleSecondaryColor
        : Qt.alpha("#000000", 0.04)
    property color subtleTertiaryColor: themeManager.currentTheme && themeManager.currentTheme.colors
        ? themeManager.currentTheme.colors.subtleTertiaryColor
        : Qt.alpha("#000000", 0.02)
    property int radius: themeManager.currentTheme && themeManager.currentTheme.appearance
        ? themeManager.currentTheme.appearance.buttonRadius
        : 5

    background: Rectangle {
        anchors.fill: parent
        radius: root.radius
        color: root.pressed ? root.subtleTertiaryColor : (root.hovered ? root.subtleSecondaryColor : "transparent")
        Behavior on color { ColorAnimation { duration: Utils.appearanceSpeed; easing.type: Easing.OutQuart } }
    }

    contentItem: RowLayout {
        id: row
        anchors.centerIn: parent
        spacing: 8

        Rin.Icon {
            visible: root.iconName !== ""
            name: root.iconName
            size: 16
            color: root.textColor
            Layout.alignment: Qt.AlignVCenter
        }

        Text {
            visible: root.text.length > 0
            text: root.text
            font.pixelSize: 14
            color: root.textColor
            Layout.alignment: Qt.AlignVCenter
        }
    }
}

