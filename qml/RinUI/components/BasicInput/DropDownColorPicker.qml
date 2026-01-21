import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15
import "../../themes"
import "../../components" as Rin

Button {
    id: root

    property alias color: picker.color
    property alias hue: picker.hue
    property alias saturation: picker.saturation
    property alias value: picker.value
    property alias alpha: picker.alpha
    property alias ringMode: picker.ringMode
    property alias collapsed: picker.collapsed
    property alias moreVisible: picker.moreVisible
    property alias colorSliderVisible: picker.colorSliderVisible
    property alias colorChannelInputVisible: picker.colorChannelInputVisible
    property alias hexInputVisible: picker.hexInputVisible
    property alias alphaSliderVisible: picker.alphaSliderVisible
    property alias alphaInputVisible: picker.alphaInputVisible
    property alias alphaEnabled: picker.alphaEnabled

    property bool textVisible: false
    property bool hexText: false

    readonly property int checkerboardCellSize: 4

    property color primaryColor: themeManager.currentTheme && themeManager.currentTheme.colors ?
        themeManager.currentTheme.colors.primaryColor : "#0078D4"
    property color textColor: themeManager.currentTheme && themeManager.currentTheme.colors ?
        themeManager.currentTheme.colors.textColor : "#1b1b1b"
    property color textSecondaryColor: themeManager.currentTheme && themeManager.currentTheme.colors ?
        themeManager.currentTheme.colors.textSecondaryColor : Qt.alpha("#000000", 0.6)
    property color dividerBorderColor: themeManager.currentTheme && themeManager.currentTheme.colors ?
        themeManager.currentTheme.colors.dividerBorderColor : Qt.alpha("#000000", 0.08)
    property real smallRadius: themeManager.currentTheme && themeManager.currentTheme.appearance ?
        themeManager.currentTheme.appearance.smallRadius : 3
    property real buttonRadius: themeManager.currentTheme && themeManager.currentTheme.appearance ?
        themeManager.currentTheme.appearance.buttonRadius : 5

    text: hexText ? picker.color.toString().toUpperCase() : picker.colorName

    implicitWidth: Math.max(row.implicitWidth + 12, 40)

    property color backgroundColor: themeManager.currentTheme && themeManager.currentTheme.colors ?
        themeManager.currentTheme.colors.controlColor : "#ffffff"

    background: Rectangle {
        anchors.fill: parent
        color: root.hovered ? (themeManager.currentTheme && themeManager.currentTheme.colors ?
            themeManager.currentTheme.colors.controlSecondaryColor : "#F9F9F9") : root.backgroundColor
        radius: root.buttonRadius
        border.width: 1
        border.color: themeManager.currentTheme && themeManager.currentTheme.colors ?
            themeManager.currentTheme.colors.controlBorderColor : "#000000"

        Behavior on color { ColorAnimation { duration: 150 } }
    }

    contentItem: Item {
        clip: true
        anchors.fill: parent

        Row {
            id: row
            spacing: 8
            anchors.centerIn: parent

            Item {
                id: preview
                width: 32
                height: 22

                Canvas {
                    anchors.fill: parent
                    property int cellSize: checkerboardCellSize

                    onPaint: {
                        var ctx = getContext("2d")
                        ctx.clearRect(0, 0, width, height)

                        var rows = Math.ceil(height / cellSize)
                        var cols = Math.ceil(width / cellSize)

                        for (var i = 0; i < rows; i++) {
                            for (var j = 0; j < cols; j++) {
                                ctx.fillStyle = ((i + j) % 2 === 0)
                                    ? Qt.rgba(1, 1, 1, 0)
                                    : Qt.rgba(0.5, 0.5, 0.5, 0.25)
                                ctx.fillRect(j * cellSize, i * cellSize, cellSize, cellSize)
                            }
                        }
                    }
                }

                Rectangle {
                    anchors.fill: parent
                    color: picker.color
                    radius: smallRadius
                }

                Rectangle {
                    anchors.fill: parent
                    color: "transparent"
                    border.width: 2
                    border.color: dividerBorderColor
                    radius: smallRadius
                }

                opacity: enabled ? 1 : 0.5
            }

            Text {
                id: colorText
                visible: textVisible
                font.pixelSize: 14
                text: root.text
                color: textColor
            }

            Rin.Icon {
                id: dropDownIcon
                size: 12
                name: "ic_fluent_chevron_down_20_regular"
                color: textSecondaryColor
            }
        }
    }

    Popup {
        id: flyout

        property int position: 0  // 0 = Top, 1 = Bottom

        property real posX: {
            switch (position) {
                case 0: // Position.Top
                case 1: // Position.Bottom
                    return (parent.width - flyout.width) / 2
                default:
                    return 0
            }
        }

        property real posY: {
            switch (position) {
                case 0: // Position.Top
                    return -flyout.height - 5
                case 1: // Position.Bottom
                    return parent.height + 5
                default:
                    return root.height
            }
        }

        x: posX
        y: posY

        padding: 16

        background: Rectangle {
            radius: buttonRadius
            color: themeManager.currentTheme && themeManager.currentTheme.colors ?
                themeManager.currentTheme.colors.backgroundAcrylicColor : "#F9F9F9"
            border.color: themeManager.currentTheme && themeManager.currentTheme.colors ?
                themeManager.currentTheme.colors.flyoutBorderColor : Qt.alpha("#000000", 0.06)
        }

        enter: Transition {
            ParallelAnimation {
                NumberAnimation {
                    target: flyout
                    property: "opacity"
                    from: 0
                    to: 1
                    duration: 200
                    easing.type: Easing.OutQuint
                }
                NumberAnimation {
                    target: flyout
                    property: "y"
                    from: posY + (position === 0 ? 15 : -15)
                    to: posY
                    duration: 250
                    easing.type: Easing.OutQuint
                }
            }
        }

        exit: Transition {
            NumberAnimation {
                target: flyout
                property: "opacity"
                from: 1
                to: 0
                duration: 150
                easing.type: Easing.OutQuint
            }
        }

        contentItem: Rin.ColorPicker {
            id: picker
        }
    }

    onClicked: {
        flyout.open()
    }

    opacity: !enabled ? 0.6 : 1
}
