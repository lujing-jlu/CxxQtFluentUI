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

    readonly property var colors: themeManager.currentTheme.item ? themeManager.currentTheme.item.colors : QtObject {
        property color textAccentColor: "#0078D4"
        property color textColor: "#1b1b1b"
    }

    property bool isIconOnly: !toolBtn.text && icon.name

    contentItem: Item {
        width: parent.width
        height: parent.height

        Rin.Icon {
            id: icon
            anchors.centerIn: parent
            size: 20
            color: toolBtn.enabled ? (toolBtn.highlighted ? colors.textAccentColor : colors.textColor) : Qt.alpha(colors.textColor, 0.4)
            visible: icon.name !== ""
        }

        Text {
            id: btnText
            anchors.centerIn: parent
            text: toolBtn.text
            font.pixelSize: 14
            color: toolBtn.enabled ? (toolBtn.highlighted ? colors.textAccentColor : colors.textColor) : Qt.alpha(colors.textColor, 0.4)
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
