import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15
import "../../themes"
import "../../components" as Rin

Button {
    id: root
    property alias menu: dropDownMenu
    property alias iconName: icon.name

    default property alias contentData: dropDownMenu.contentData

    property color primaryColor: themeManager.currentTheme && themeManager.currentTheme.colors ?
        themeManager.currentTheme.colors.primaryColor : "#0078D4"
    property color textColor: themeManager.currentTheme && themeManager.currentTheme.colors ?
        themeManager.currentTheme.colors.textColor : "#1b1b1b"
    property bool isPrimary: false

    readonly property color backgroundColor: isPrimary ?
        primaryColor : (themeManager.currentTheme && themeManager.currentTheme.colors ?
            themeManager.currentTheme.colors.controlColor : "#ffffff")

    readonly property real buttonRadius: themeManager.currentTheme && themeManager.currentTheme.appearance ?
        themeManager.currentTheme.appearance.buttonRadius : 5

    font.pixelSize: 14
    padding: 12
    leftPadding: 20
    rightPadding: 36

    background: Rectangle {
        id: background
        anchors.fill: parent
        color: root.hovered ? (themeManager.currentTheme && themeManager.currentTheme.colors ?
            themeManager.currentTheme.colors.controlSecondaryColor : "#F9F9F9") : root.backgroundColor
        radius: root.buttonRadius
        border.width: 1
        border.color: isPrimary ? primaryColor : (themeManager.currentTheme && themeManager.currentTheme.colors ?
            themeManager.currentTheme.colors.controlBorderColor : "#000000")

        Behavior on color { ColorAnimation { duration: 150 } }
    }

    contentItem: RowLayout {
        spacing: 8
        anchors.centerIn: parent

        Rin.Icon {
            id: icon
            size: 16
            visible: root.iconName !== ""
            color: {
                if (!root.enabled) return Qt.alpha(textColor, 0.4)
                if (isPrimary) return themeManager.currentTheme && themeManager.currentTheme.colors ?
                    themeManager.currentTheme.colors.textOnAccentColor : "#ffffff"
                return textColor
            }
        }

        Text {
            text: root.text
            font: root.font
            color: {
                if (!root.enabled) return Qt.alpha(textColor, 0.4)
                if (isPrimary) return themeManager.currentTheme && themeManager.currentTheme.colors ?
                    themeManager.currentTheme.colors.textOnAccentColor : "#ffffff"
                return textColor
            }
            Layout.fillWidth: true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }

    Rectangle {
        id: dropDownIcon
        anchors.right: parent.right
        anchors.rightMargin: 12
        anchors.verticalCenter: parent.verticalCenter
        width: 12
        height: 12
        color: {
            if (!root.enabled) return Qt.alpha(textColor, 0.4)
            if (isPrimary) return themeManager.currentTheme && themeManager.currentTheme.colors ?
                themeManager.currentTheme.colors.textOnAccentColor : "#ffffff"
            return textColor
        }
        opacity: 0.7

        Canvas {
            anchors.fill: parent
            onPaint: {
                var ctx = getContext("2d")
                ctx.clearRect(0, 0, width, height)
                ctx.fillStyle = parent.color
                ctx.beginPath()
                ctx.moveTo(width / 2, height * 0.3)
                ctx.lineTo(width * 0.8, height * 0.7)
                ctx.lineTo(width * 0.2, height * 0.7)
                ctx.closePath()
                ctx.fill()
            }
        }
    }

    Rin.Menu {
        id: dropDownMenu
        position: Rin.Position.Bottom
    }

    onClicked: {
        if (dropDownMenu.count > 0) {
            dropDownMenu.open()
        }
    }

    opacity: !enabled ? 0.6 : 1
}
