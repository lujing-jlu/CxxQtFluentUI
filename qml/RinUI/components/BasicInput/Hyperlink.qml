import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../themes"

Button {
    id: root

    property url openUrl: ""
    property alias url: root.openUrl
    property bool underline: !root.hovered

    property color primaryColor: themeManager.currentTheme && themeManager.currentTheme.colors ?
        themeManager.currentTheme.colors.primaryColor : "#0078D4"
    property color textColor: themeManager.currentTheme && themeManager.currentTheme.colors ?
        themeManager.currentTheme.colors.textColor : "#1b1b1b"

    property real buttonRadius: themeManager.currentTheme && themeManager.currentTheme.appearance ?
        themeManager.currentTheme.appearance.buttonRadius : 5

    font.pixelSize: 14
    font.underline: underline
    padding: 8
    leftPadding: 12
    rightPadding: 12

    background: Rectangle {
        anchors.fill: parent
        color: "transparent"
        radius: root.buttonRadius
    }

    contentItem: Text {
        text: root.text
        color: root.enabled ? root.primaryColor : Qt.alpha(textColor, 0.4)
        font: root.font
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter

        Behavior on color { ColorAnimation { duration: 150 } }
    }

    onClicked: {
        if (openUrl.toString().length > 0) {
            Qt.openUrlExternally(openUrl)
        }
    }

    opacity: !enabled ? 0.6 : 1
}
