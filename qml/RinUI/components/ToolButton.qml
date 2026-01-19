import QtQuick 2.15
import QtQuick.Controls 2.15
import "../utils" as Utils
import "../components" as Rin

Button {
    id: toolBtn

    property alias iconName: icon.name
    property alias iconSize: icon.size
    property alias iconColor: icon.color
    property bool hoverable: true

    property color textAccentColor: themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors.textAccentColor : "#0078D4"
    property color textColor: themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors.textColor : "#1b1b1b"

    property bool isIconOnly: !toolBtn.text && icon.name

    implicitWidth: isIconOnly ? 36 : Math.max(36, btnText.contentWidth + 24)
    implicitHeight: 36

    contentItem: Item {
        implicitWidth: toolBtn.implicitWidth
        implicitHeight: toolBtn.implicitHeight

        Rin.Icon {
            id: icon
            anchors.centerIn: parent
            size: 20
            color: toolBtn.enabled ? (toolBtn.highlighted ? textAccentColor : textColor) : Qt.alpha(textColor, 0.4)
            visible: icon.name !== ""
        }

        Text {
            id: btnText
            anchors.centerIn: parent
            text: toolBtn.text
            font.pixelSize: 14
            color: toolBtn.enabled ? (toolBtn.highlighted ? textAccentColor : textColor) : Qt.alpha(textColor, 0.4)
            visible: toolBtn.text !== ""
        }
    }

    // Hover behavior
    onHoveredChanged: {
        if (hoverable && enabled) {
            // Visual feedback on hover can be added here
        }
    }
}
