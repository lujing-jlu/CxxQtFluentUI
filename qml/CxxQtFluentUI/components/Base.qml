import QtQuick 2.15
import QtQuick.Controls 2.15
import "../themes"

Item {
    id: root
    implicitWidth: 100
    implicitHeight: 40

    // 公共属性 / Common Properties
    property color backgroundColor: ThemeManager.currentTheme && ThemeManager.currentTheme.colors ?
        ThemeManager.currentTheme.colors.controlColor : "#ffffff"
    property color borderColor: ThemeManager.currentTheme && ThemeManager.currentTheme.colors ?
        ThemeManager.currentTheme.colors.controlBorderColor : "#000000"
    property color textColor: ThemeManager.currentTheme && ThemeManager.currentTheme.colors ?
        ThemeManager.currentTheme.colors.textColor : "#1b1b1b"

    property real controlRadius: ThemeManager.currentTheme && ThemeManager.currentTheme.appearance ?
        ThemeManager.currentTheme.appearance.buttonRadius : 5

    property bool hovered: false
    property bool pressed: false
    property bool enabled: true

    // 启用 MouseArea / Enable MouseArea
    property bool interactive: true

    // Update
    onEnabledChanged: updateStyle()

    // 主题切换 / Theme Switching
    Connections {
        target: ThemeManager
        function onCurrentThemeChanged() {
            updateStyle()
        }
    }

    Component.onCompleted: updateStyle()

    function updateStyle() {
        if (ThemeManager.currentTheme && ThemeManager.currentTheme.colors) {
            backgroundColor = ThemeManager.currentTheme.colors.controlColor
            borderColor = ThemeManager.currentTheme.colors.controlBorderColor
            textColor = ThemeManager.currentTheme.colors.textColor
        }
        if (ThemeManager.currentTheme && ThemeManager.currentTheme.appearance) {
            controlRadius = ThemeManager.currentTheme.appearance.buttonRadius
        }
    }

    // 颜色动画 / Color Animation
    Behavior on backgroundColor { ColorAnimation { duration: 200; easing.type: Easing.OutQuart } }
    Behavior on textColor { ColorAnimation { duration: 200; easing.type: Easing.OutQuart } }
    Behavior on borderColor { ColorAnimation { duration: 200; easing.type: Easing.OutQuart } }

    // 交互 / Interaction
    MouseArea {
        id: mouseArea
        visible: interactive
        anchors.fill: parent
        hoverEnabled: true

        // hover状态 / Hover State
        onEntered: root.hovered = true
        onExited: root.hovered = false

        // 按下状态 / Pressed State
        onPressed: root.pressed = true
        onReleased: root.pressed = false

        onClicked: {
            if (!root.enabled) {
                mouse.accepted = true
                return
            }
            root.clicked()
        }
    }

    signal clicked()
}
