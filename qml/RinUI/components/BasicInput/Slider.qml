import QtQuick 2.15
import QtQuick.Controls.Basic
import "../../themes"
import "../../components"

Slider {
    id: root
    // size properties
    property real handleSize: Theme.currentTheme.appearance.sliderHandleSize
    property real borderWidth: 3
    property int ticksPadding: 4
    property real trackHeight: 4
    property bool showTooltip: true
    property bool tickmarks: false
    property real tickFrequency: 0
    property color primaryColor: Theme.currentTheme.colors.primaryColor

    // accessibility
    FocusIndicator {
        control: parent
    }

    // auto enable snap
    snapMode: Slider.SnapAlways

    // adaptive height and width
    implicitHeight: orientation === Qt.Horizontal ? 32 : 150
    implicitWidth: orientation === Qt.Horizontal ? 150 : 32

    // background
    background: Rectangle {
        anchors.centerIn: parent
        width: root.orientation === Qt.Horizontal ? parent.width - handle.width : trackHeight
        height: root.orientation === Qt.Horizontal ? trackHeight : parent.height - handle.width
        radius: 99
        color: Theme.currentTheme.colors.controlStrongColor

        Behavior on color {
            ColorAnimation {
                duration: Utils.appearanceSpeed
                easing.type: Easing.OutQuart
            }
        }

        // progress bar
        Rectangle {
            width: root.orientation === Qt.Horizontal ? root.visualPosition * parent.width : trackHeight
            height: root.orientation === Qt.Horizontal ? trackHeight : (1 - root.visualPosition) * parent.height
            anchors.bottom: root.orientation === Qt.Vertical ? parent.bottom : undefined
            radius: 99
            color: Theme.currentTheme.colors.primaryColor

            Behavior on width {
                NumberAnimation {
                    duration: Utils.animationSpeedFaster
                    easing.type: Easing.OutCubic
                }
            }
            Behavior on color {
                ColorAnimation {
                    duration: Utils.appearanceSpeed
                    easing.type: Easing.OutQuart
                }
            }
            Behavior on height {
                NumberAnimation {
                    duration: Utils.animationSpeedFaster
                    easing.type: Easing.OutCubic
                }
            }
        }

        // tickmarks
        Repeater {
            model: (to - from) / (tickFrequency !== 0 ? tickFrequency : stepSize)

            delegate: Column {
                x: root.orientation === Qt.Horizontal ?
                    index * parent.width / (to - from) * (tickFrequency !== 0 ? tickFrequency : stepSize) - width / 2
                    : ticksPadding + trackHeight
                y: root.orientation === Qt.Vertical ?
                    index * parent.height / (to - from) * (tickFrequency !== 0 ? tickFrequency : stepSize) - height / 2
                    : ticksPadding + trackHeight
                spacing: 2
                Rectangle {
                    anchors.horizontalCenter: parent.horizontalCenter
                    width: root.orientation === Qt.Horizontal ? 1 : 4
                    height: root.orientation === Qt.Horizontal ? 4 : 1
                    color: Theme.currentTheme.colors.controlStrongColor

                    visible: root.tickmarks && index !== 0 && index !== ((to - from) / stepSize)
                }
            }
        }
    }

    // handle
    handle: Item {
        id: handle
        property bool hovered: false
        width: handleSize + 2
        height: handleSize + 2

        // dynamic handle position
        x: root.orientation === Qt.Horizontal
           ? root.visualPosition * (root.width - width)
           : (parent.width - width) / 2
        y: root.orientation === Qt.Vertical
           ? (root.visualPosition) * (root.height - height)
           : (parent.height - height) / 2

        ToolTip {
            text: root.value.toString()
            visible: root.showTooltip ? (handle.hovered || root.pressed)  : false
            delay: 50
        }

        // MouseArea
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            acceptedButtons: Qt.NoButton
            onEntered: handle.hovered = true
            onExited: handle.hovered = false
        }

        // border
        Rectangle {
            anchors.fill: parent
            radius: width / 2
            color: Theme.currentTheme.colors.controlQuaternaryColor
        }

        // middle border
        Rectangle {
            anchors.centerIn: parent
            width: handleSize
            height: handleSize
            radius: width / 2
            color: Theme.currentTheme.colors.controlSolidColor

            Behavior on color {
                ColorAnimation {
                    duration: Utils.appearanceSpeed
                    easing.type: Easing.OutQuart
                }
            }
        }

        // dot with primary color
        Rectangle {
            id: dot
            anchors.centerIn: parent
            width: Math.round(handleSize * 0.55) & ~1
            height: Math.round(handleSize * 0.55) & ~1
            radius: width / 2

            scale: root.pressed ? 0.83 :
                handle.hovered ? 1.16 : 1.0
            color: root.pressed ? Qt.alpha(Theme.currentTheme.colors.primaryColor, 0.8) :
                handle.hovered ? Qt.alpha(Theme.currentTheme.colors.primaryColor, 0.9) : Theme.currentTheme.colors.primaryColor

            Behavior on color {
                ColorAnimation {
                    duration: Utils.appearanceSpeed
                    easing.type: Easing.OutCubic
                }
            }
            Behavior on scale {
                NumberAnimation {
                    duration: Utils.animationSpeed
                    easing.type: Easing.OutBack
                }
            }
        }

        Behavior on x {
            NumberAnimation {
                duration: Utils.animationSpeedFaster
                easing.type: Easing.OutCubic
            }
        }
        Behavior on y {
            NumberAnimation {
                duration: Utils.animationSpeedFaster
                easing.type: Easing.OutCubic
            }
        }
    }

    // states
    states: [
        State {
            name: "disabled"
            when: !root.enabled
            PropertyChanges {
                target: handle
                color: Theme.currentTheme.colors.textDisabled
                opacity: 0.6
            }
        }
    ]
}
