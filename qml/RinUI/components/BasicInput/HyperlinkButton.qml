import QtQuick 2.15
import "../../components" as Rin

Rin.Button {
    id: root

    property url link: ""
    property bool underlineOnHover: true

    isFlat: true
    padding: 0
    leftPadding: 0
    rightPadding: 0

    background: Item { }

    contentItem: Text {
        text: root.text
        font.pixelSize: 14
        color: themeManager && themeManager.currentTheme && themeManager.currentTheme.colors
            ? themeManager.currentTheme.colors.textAccentColor
            : "#0078D4"
        font.underline: root.underlineOnHover && root.hovered
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        opacity: root.enabled ? (root.pressed ? 0.75 : 1.0) : 0.5
    }

    onClicked: {
        if (link && String(link) !== "") {
            Qt.openUrlExternally(link)
        }
    }
}
