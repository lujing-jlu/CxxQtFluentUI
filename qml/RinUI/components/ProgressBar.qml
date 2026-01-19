import QtQuick 2.15
import QtQuick.Controls.Basic 2.15
import "../utils" as Utils

ProgressBar {
    id: root

    readonly property var colors: themeManager.currentTheme.item ? themeManager.currentTheme.item.colors : QtObject {
        property color primaryColor: "#0078D4"
        property color controlBorderStrongColor: "#8a8a8a"
        property color systemCautionColor: "#FFB900"
        property color systemCriticalColor: "#D13438"
    }

    property color backgroundColor: indeterminate
        ? "transparent"
        : colors.controlBorderStrongColor
    property color primaryColor: colors.primaryColor
    property int radius: 99
    property int state: ProgressBar.Running

    enum State {
        Running,
        Paused,
        Error
    }

    implicitHeight: 4

    // Background track
    background: Rectangle {
        anchors.verticalCenter: parent.verticalCenter
        width: parent.width
        height: 2
        radius: root.radius
        color: backgroundColor
    }

    // Progress content
    contentItem: Item {
        id: content
        implicitWidth: 200
        implicitHeight: 4
        clip: true

        Rectangle {
            id: indicator
            height: parent.height
            radius: root.radius
            color: root.state === ProgressBar.Paused ? colors.systemCautionColor :
                   root.state === ProgressBar.Error ? colors.systemCriticalColor :
                   root.primaryColor

            width: root.indeterminate
                ? root.state === ProgressBar.Running ? root.width / 3 : parent.width
                : root.visualPosition * parent.width

            x: root.indeterminate
                ? (root.state === ProgressBar.Running ? -indicator.width : 0)
                : 0

            Behavior on width {
                enabled: !root.indeterminate
                NumberAnimation {
                    duration: 150
                    easing.type: Easing.OutCubic
                }
            }

            Behavior on color {
                ColorAnimation {
                    duration: 150
                    easing.type: Easing.OutCubic
                }
            }

            // Indeterminate animation (Running)
            NumberAnimation on x {
                from: -indicator.width
                to: root.width
                duration: 2000
                loops: Animation.Infinite
                easing.type: Easing.InOutQuart
                running: root.indeterminate && root.state === ProgressBar.Running
            }
        }

        // Paused/Error → return animation
        SequentialAnimation {
            id: returnAnimation
            running: root.indeterminate && root.state !== ProgressBar.Running
            NumberAnimation {
                target: indicator
                property: "width"
                from: indicator.width
                to: root.width / 10
                duration: 150
                easing.type: Easing.InQuart
            }
            NumberAnimation {
                target: indicator
                property: "width"
                from: 0
                to: root.width
                duration: 300
                easing.type: Easing.OutQuint
            }
        }
    }

    onStateChanged: {
        if (indeterminate) {
            if (state !== ProgressBar.Running) {
                indicator.x = 0
            } else {
                indicator.width = root.width / 3
            }
        }
    }

    Component.onCompleted: {
        if (!indeterminate) {
            indicator.width = root.visualPosition * root.width
        } else {
            indicator.width = state === ProgressBar.Running ? root.width / 3 : root.width
        }
    }
}
