import QtQuick 2.15
import QtQuick.Layouts 2.15
import ".." as Rin
import "../../themes"
import "../../utils"

Rin.Popup {
    id: tip

    property string title: ""
    property string text: ""

    property bool closable: true
    property bool tailVisible: true
    property int tailSize: 10

    property string primaryButtonText: ""
    property string secondaryButtonText: ""

    signal primaryClicked()
    signal secondaryClicked()
    signal closeClicked()

    padding: 16
    position: Rin.Position.Bottom

    background: Item {
        anchors.fill: parent

        Rectangle {
            id: backgroundRect
            anchors.fill: parent
            radius: themeManager.currentTheme.appearance.windowRadius
            color: themeManager.currentTheme.colors.backgroundAcrylicColor
            border.color: themeManager.currentTheme.colors.flyoutBorderColor

            layer.enabled: true
            layer.effect: Rin.Shadow {
                style: "flyout"
                source: backgroundRect
            }
        }

        Canvas {
            id: tail
            visible: tip.tailVisible && (tip.position !== Rin.Position.Center) && (tip.position !== Rin.Position.None)
            width: tip.tailSize * 2
            height: tip.tailSize * 2
            antialiasing: true

            anchors.horizontalCenter: (tip.position === Rin.Position.Top || tip.position === Rin.Position.Bottom) ? parent.horizontalCenter : undefined
            anchors.verticalCenter: (tip.position === Rin.Position.Left || tip.position === Rin.Position.Right) ? parent.verticalCenter : undefined

            anchors.top: tip.position === Rin.Position.Bottom ? parent.top : undefined
            anchors.bottom: tip.position === Rin.Position.Top ? parent.bottom : undefined
            anchors.left: tip.position === Rin.Position.Right ? parent.left : undefined
            anchors.right: tip.position === Rin.Position.Left ? parent.right : undefined

            anchors.topMargin: tip.position === Rin.Position.Bottom ? -tip.tailSize : 0
            anchors.bottomMargin: tip.position === Rin.Position.Top ? -tip.tailSize : 0
            anchors.leftMargin: tip.position === Rin.Position.Right ? -tip.tailSize : 0
            anchors.rightMargin: tip.position === Rin.Position.Left ? -tip.tailSize : 0

            onPaint: {
                const ctx = getContext("2d")
                ctx.reset()
                ctx.clearRect(0, 0, width, height)

                ctx.fillStyle = themeManager.currentTheme.colors.backgroundAcrylicColor
                ctx.strokeStyle = themeManager.currentTheme.colors.flyoutBorderColor
                ctx.lineWidth = 1

                ctx.beginPath()
                if (tip.position === Rin.Position.Top) {
                    // tail points up (popup above anchor, tail on bottom)
                    ctx.moveTo(width / 2, tip.tailSize)
                    ctx.lineTo(width / 2 - tip.tailSize, 0)
                    ctx.lineTo(width / 2 + tip.tailSize, 0)
                } else if (tip.position === Rin.Position.Bottom) {
                    ctx.moveTo(width / 2, tip.tailSize)
                    ctx.lineTo(width / 2 - tip.tailSize, height)
                    ctx.lineTo(width / 2 + tip.tailSize, height)
                } else if (tip.position === Rin.Position.Left) {
                    ctx.moveTo(tip.tailSize, height / 2)
                    ctx.lineTo(0, height / 2 - tip.tailSize)
                    ctx.lineTo(0, height / 2 + tip.tailSize)
                } else if (tip.position === Rin.Position.Right) {
                    ctx.moveTo(tip.tailSize, height / 2)
                    ctx.lineTo(width, height / 2 - tip.tailSize)
                    ctx.lineTo(width, height / 2 + tip.tailSize)
                }
                ctx.closePath()
                ctx.fill()
                ctx.stroke()
            }

            Component.onCompleted: requestPaint()
            onVisibleChanged: requestPaint()
            onWidthChanged: requestPaint()
            onHeightChanged: requestPaint()
        }
    }

    contentItem: ColumnLayout {
        spacing: 10

        RowLayout {
            Layout.fillWidth: true
            spacing: 8

            Rin.Text {
                Layout.fillWidth: true
                typography: Rin.Typography.Subtitle
                visible: tip.title.length > 0
                text: tip.title
            }

            Rin.ToolButton {
                visible: tip.closable
                flat: true
                width: 32
                height: 32
                iconName: "ic_fluent_dismiss_20_regular"
                iconSize: 12
                onClicked: {
                    tip.closeClicked()
                    tip.close()
                }
            }
        }

        Rin.Text {
            Layout.fillWidth: true
            wrapMode: Text.WordWrap
            color: themeManager.currentTheme.colors.textSecondaryColor
            visible: tip.text.length > 0
            text: tip.text
        }

        RowLayout {
            Layout.fillWidth: true
            spacing: 8
            visible: primaryButtonText.length > 0 || secondaryButtonText.length > 0

            Item { Layout.fillWidth: true }

            Rin.Button {
                visible: secondaryButtonText.length > 0
                text: secondaryButtonText
                isFlat: true
                onClicked: tip.secondaryClicked()
            }

            Rin.Button {
                visible: primaryButtonText.length > 0
                text: primaryButtonText
                isPrimary: true
                onClicked: tip.primaryClicked()
            }
        }
    }
}
