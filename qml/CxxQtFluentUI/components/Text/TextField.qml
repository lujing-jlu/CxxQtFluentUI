import QtQuick 2.15
import Qt5Compat.GraphicalEffects
import QtQuick.Controls.Basic 2.15
import "../../themes"
import "../../utils"
import "../../components"

TextField {
    id: root

    property bool frameless: false
    property bool editable: true
    property color primaryColor: ThemeManager.currentTheme.colors.primaryColor
    property bool clearEnabled: true

    selectByMouse: true
    enabled: editable

    // Menu
    TextInputMenu {
        id: contextMenu
    }

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.RightButton
        propagateComposedEvents: false
        onPressed: (mouse) => {
            if (mouse.button === Qt.RightButton)
                contextMenu.popup(mouse.scenePosition)
            mouse.accepted = true
        }

        // 鼠标
        cursorShape: Qt.IBeamCursor
    }

    // 背景 / Background //
    background: Rectangle {
        id: background
        anchors.fill: parent
        radius: ThemeManager.currentTheme.appearance.buttonRadius
        color: frameless ? "transparent" : ThemeManager.currentTheme.colors.controlColor
        clip: true
        border.width: ThemeManager.currentTheme.appearance.borderWidth
        border.color: frameless ? root.activeFocus ? ThemeManager.currentTheme.colors.controlBorderColor : "transparent" :
            ThemeManager.currentTheme.colors.controlBorderColor

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
            height: root.activeFocus ? ThemeManager.currentTheme.appearance.borderWidth * 2 : ThemeManager.currentTheme.appearance.borderWidth
            color: root.activeFocus ? primaryColor : frameless ? "transparent" : ThemeManager.currentTheme.colors.textControlBorderColor

            Behavior on color { ColorAnimation { duration: Utils.animationSpeed; easing.type: Easing.OutQuint } }
            Behavior on height { NumberAnimation { duration: Utils.animationSpeed; easing.type: Easing.OutQuint } }
        }
    }

    Behavior on opacity { NumberAnimation { duration: Utils.animationSpeed; easing.type: Easing.OutQuint } }


    // 字体 / Font //
    font.pixelSize: ThemeManager.currentTheme.typography.bodySize
    font.family: Utils.fontFamily

    selectionColor: ThemeManager.currentTheme.colors.primaryColor
    color: ThemeManager.currentTheme.colors.textColor
    placeholderTextColor: ThemeManager.currentTheme.colors.textSecondaryColor

    leftPadding: 12
    rightPadding: (clearEnabled && clearBtn.visible ? 28 : 12)
    topPadding: 4
    bottomPadding: 7

    // 清空按钮
    Button {
        id: clearBtn
        anchors.right: parent.right
        anchors.margins: 4
        anchors.rightMargin: root.rightPadding - width + 2
        anchors.verticalCenter: parent.verticalCenter
        implicitWidth: 26
        implicitHeight: 22
        focusPolicy: Qt.NoFocus
        flat: true
        highlighted: true
        visible: clearEnabled && root.text && root.text.length > 0 && root.activeFocus
        onClicked: parent.text = ""
        contentItem: Icon {
            name: "ic_fluent_dismiss_20_regular"
            size: 14
            color: ThemeManager.currentTheme.colors.textTertialyColor
        }
        radius: ThemeManager.currentTheme.appearance.smallRadius
    }

    // 状态变化
    states: [
        State {
        name: "disabled"
            when: !enabled
            PropertyChanges {  // 禁用时禁止改变属性
                target: background;
                opacity: !editable ? 1 : 0.4
            }
        },
        State {
            name: "pressed&focused"
            when: activeFocus
            PropertyChanges {
                target: background;
                color: ThemeManager.currentTheme.colors.controlInputActiveColor
            }
        },
        State {
            name: "hovered"
            when: hovered
            PropertyChanges {
                target: background;
                color: ThemeManager.currentTheme.colors.controlSecondaryColor
            }
        }
    ]
}
