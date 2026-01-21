import QtQuick 2.15
import Qt5Compat.GraphicalEffects
import QtQuick.Controls.Basic 2.15
import "../../themes"
import "../../utils"
import "../../components"


SpinBox {
    id: root
    editable: true

    property color primaryColor: themeManager.currentTheme.colors.primaryColor

    contentItem: TextInput {
        selectByMouse: true
        text: root.textFromValue(root.value, root.locale)
        horizontalAlignment: Qt.AlignLeft
        verticalAlignment: Qt.AlignVCenter

        readOnly: !root.editable
        validator: root.validator
        inputMethodHints: Qt.ImhFormattedNumbersOnly
    }

    implicitWidth: Math.max(implicitWidth + upBtn.width + downBtn.width + 8, 124)

    // 背景 / Background //
    background: Rectangle {
        id: background
        anchors.fill: parent
        radius: themeManager.currentTheme.appearance.buttonRadius
        color: themeManager.currentTheme.colors.controlColor
        clip: true
        border.width: themeManager.currentTheme.appearance.borderWidth
        border.color: themeManager.currentTheme.colors.controlBorderColor

        layer.enabled: true
        layer.smooth: true
        layer.effect: OpacityMask {
            maskSource: Rectangle {
                width: background.width
                height: background.height
                radius: background.radius
            }
        }

        // 底部指示器 / indicator //
        Rectangle {
            id: indicator
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            radius: 999
            height: root.activeFocus ? themeManager.currentTheme.appearance.borderWidth * 2 : themeManager.currentTheme.appearance.borderWidth
            color: root.activeFocus ? primaryColor : themeManager.currentTheme.colors.textControlBorderColor

            Behavior on color { ColorAnimation { duration: Utils.animationSpeed; easing.type: Easing.OutQuint } }
            Behavior on height { NumberAnimation { duration: Utils.animationSpeed; easing.type: Easing.OutQuint } }
        }
    }

    up.indicator: ToolButton {
        id: upBtn
        flat: true
        z: 9
        focusPolicy: editable ? Qt.StrongFocus : Qt.NoFocus
        implicitWidth: 32
        implicitHeight: 24
        anchors.top: parent.top
        anchors.right: downBtn.left
        anchors.bottom: parent.bottom
        anchors.margins: 4
        anchors.bottomMargin: 6
        icon.name: "ic_fluent_chevron_up_20_regular"
        size: 16
        color: themeManager.currentTheme.colors.textSecondaryColor
        hoverable: editable
        onClicked: increase()
    }

    down.indicator: ToolButton {
        id: downBtn
        z: 9
        flat: true
        focusPolicy: editable ? Qt.StrongFocus : Qt.NoFocus
        implicitWidth: 32
        implicitHeight: 24
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 4
        anchors.bottomMargin: 6
        icon.name: "ic_fluent_chevron_down_20_regular"
        size: 16
        color: themeManager.currentTheme.colors.textSecondaryColor
        hoverable: editable
        onClicked: decrease()
    }

    leftPadding: 12
    rightPadding: 12
    topPadding: 5
    bottomPadding: 7

    Behavior on opacity { NumberAnimation { duration: Utils.animationSpeed; easing.type: Easing.OutQuint } }

    // 恢复滚轮调整数值
    WheelHandler {
        id: wheelHandler
        target: root
        onWheel: (event) => {
            if (!root.focus) {
                return; // 如果没有焦点，则不处理滚轮事件
            }
            if (event.angleDelta.y > 0) {
                root.value += root.stepSize;
            } else if (event.angleDelta.y < 0) {
                root.value -= root.stepSize;
            }
            event.accepted = true; // 阻止事件继续冒泡
        }
    }

    // 状态变化
    states: [
        State {
        name: "disabled"
            when: !enabled
            PropertyChanges {  // 禁用时禁止改变属性
                target: root;
                opacity: !editable ? 1 : 0.4
            }
        },
        State {
            name: "pressed&focused"
            when: activeFocus
            PropertyChanges {
                target: background;
                color: themeManager.currentTheme.colors.controlInputActiveColor
            }
        },
        State {
            name: "hovered"
            when: hovered
            PropertyChanges {
                target: background;
                color: themeManager.currentTheme.colors.controlSecondaryColor
            }
        }
    ]
}
