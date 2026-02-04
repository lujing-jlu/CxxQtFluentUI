import QtQuick 2.15
import QtQuick.Controls.Basic 2.15
import QtQuick.Layouts 2.15
import Qt5Compat.GraphicalEffects
import "../../themes"
import "../../components"

Button {
    id: root
    property color primaryColor: themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors.primaryColor : "#0078D4"
    property color textColor: themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
    property alias color: root.backgroundColor
    property color backgroundColor: flat ? themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors.subtleSecondaryColor : "#f3f3f3" :
        highlighted ? primaryColor : (themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors.controlColor : "#ffffff")
    property alias radius: background.radius

    property bool hoverable: true  // 是否可悬停
    property bool accessibliityIndicator: true  // 是否显示辅助提示
    property string suffixIconName: ""  // 后缀图标

    readonly property color hoverColor: !highlighted && !flat
        ? themeManager.currentTheme.colors.controlSecondaryColor : backgroundColor
    icon.width: font.pixelSize * 1.3
    icon.height: font.pixelSize * 1.3

    font: text.font

    // accessibility
    FocusIndicator {
        control: parent
        opacity: accessibliityIndicator
    }

    padding: 6
    topPadding: 5
    bottomPadding: 7

    background: Rectangle {
        id: background
        anchors.fill: parent
        color: hovered ? hoverColor : backgroundColor
        radius: themeManager.currentTheme.appearance.buttonRadius

        border.width: themeManager.currentTheme.appearance.borderWidth  // 边框宽度 / Border Width
        border.color: flat ? "transparent" :
            enabled ? highlighted ? primaryColor : themeManager.currentTheme.colors.controlBorderColor :
            highlighted ? themeManager.currentTheme.colors.disabledColor : themeManager.currentTheme.colors.controlBorderColor

        // 裁切
        layer.enabled: true
        layer.smooth: true
        layer.effect: OpacityMask {
            maskSource: Rectangle {
                width: background.width
                height: background.height
                radius: background.radius
            }
        }

        // 底部border
        Rectangle {
            id: indicator
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            height: themeManager.currentTheme.appearance.borderWidth

            color: flat ? "transparent" :
                enabled ? highlighted ? themeManager.currentTheme.colors.controlAccentBottomBorderColor
                        : themeManager.currentTheme.colors.controlBottomBorderColor
                    : "transparent"
        }

        Behavior on color { ColorAnimation { duration: 150; easing.type: Easing.OutQuart } }
        opacity: flat && !hovered || !hoverable ? 0 : 1
    }

    implicitWidth: Math.max(row.implicitWidth + 26, 40)
    implicitHeight: Math.max(text.height + 12, 32)

    contentItem: Item {
        clip: true
        anchors.fill: parent

        Row {
            id: row
            spacing: 8
            anchors.centerIn: parent
            IconWidget {
                id: iconWidget
                property bool isSetedIcon: icon || source.toString()
                width: isSetedIcon ? root.icon.width : 0
                height: isSetedIcon ? root.icon.height : 0
                icon: root.icon.name
                source: root.icon.source
                y: 0.25
                color: {
                    if (icon.color) return icon.color
                    if (!enabled) {
                        return flat
                            ? themeManager.currentTheme.colors.disabledColor
                            : (highlighted
                                ? themeManager.currentTheme.colors.textOnAccentColor
                                : themeManager.currentTheme.colors.textColor)
                    }
                    if (highlighted) {
                        return flat
                            ? themeManager.currentTheme.colors.textAccentColor
                            : themeManager.currentTheme.colors.textOnAccentColor
                    }
                    return themeManager.currentTheme.colors.textColor
                }
            }
            Text {
                id: text
                typography: Typography.Body
                text: root.text
                color: highlighted ? flat ? themeManager.currentTheme.colors.textAccentColor :
                    themeManager.currentTheme.colors.textOnAccentColor : themeManager.currentTheme.colors.textColor
            }
            // 后缀图标
            IconWidget {
                id: suffixIcon
                size: 12
                height: parent.height
                icon: root.suffixIconName
                color: themeManager.currentTheme.colors.textSecondaryColor
                visible: root.suffixIconName !== ""
            }
        }
    }

    Behavior on opacity { NumberAnimation { duration: 150; easing.type: Easing.OutQuart } }

    // 状态变化
    states: [
        State {
        name: "disabled"
            when: !enabled
            PropertyChanges {
                target: root
                opacity: 0.65
                backgroundColor: highlighted
                    ? themeManager.currentTheme.colors.disabledColor
                    : themeManager.currentTheme.colors.controlColor
            }
            PropertyChanges {
                target: text
                color: flat
                    ? themeManager.currentTheme.colors.disabledColor
                    : (highlighted
                        ? themeManager.currentTheme.colors.textOnAccentColor
                        : themeManager.currentTheme.colors.textColor)
            }
        },
        State {
            name: "pressed"
            when: pressed
            PropertyChanges {
                target: root;
                opacity: !highlighted && !flat ? 0.7 : 0.65
                backgroundColor:  !highlighted && !flat ? themeManager.currentTheme.colors.controlTertiaryColor : backgroundColor
            }
        },
        State {
            name: "hovered"
            when: hovered && hoverable
            PropertyChanges {
                target: root;
                opacity: !highlighted && !flat ? 1 : 0.875
            }
        }
    ]
}
