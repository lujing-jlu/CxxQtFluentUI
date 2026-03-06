import QtQuick 2.15
import QtQuick.Controls.Basic 2.15
import "../../utils"
import "../../themes"

ProgressBar {
    id: root

    // Use direct property access (参考上游实现)
    property color themePrimaryColor: ThemeManager.currentTheme && ThemeManager.currentTheme.colors ? ThemeManager.currentTheme.colors.primaryColor : "#0078D4"
    property color themeControlBorderStrongColor: ThemeManager.currentTheme && ThemeManager.currentTheme.colors ? ThemeManager.currentTheme.colors.controlBorderStrongColor : "#8a8a8a"
    property color themeSystemCautionColor: ThemeManager.currentTheme && ThemeManager.currentTheme.colors ? ThemeManager.currentTheme.colors.systemCautionColor : "#FFB900"
    property color themeSystemCriticalColor: ThemeManager.currentTheme && ThemeManager.currentTheme.colors ? ThemeManager.currentTheme.colors.systemCriticalColor : "#D13438"

    property color backgroundColor: indeterminate
        ? "transparent"
        : themeControlBorderStrongColor
    property color primaryColor: themePrimaryColor
    property int radius: 99
    enum ProgressState { Running, Paused, Error }
    property int state: 0

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
            color: root.state === root.Paused ? themeSystemCautionColor :
                   root.state === root.Error ? themeSystemCriticalColor :
                   root.primaryColor

            width: root.indeterminate
                ? root.state === root.Running ? root.width / 3 : parent.width
                : root.visualPosition * parent.width

            x: root.indeterminate
                ? (root.state === root.Running ? -indicator.width : 0)
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
                running: root.indeterminate && root.state === root.Running
            }
        }

        // Paused/Error → return animation
        SequentialAnimation {
            id: returnAnimation
            running: root.indeterminate && root.state !== root.Running
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
            if (state !== root.Running) {
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
            indicator.width = state === root.Running ? root.width / 3 : root.width
        }
    }
}
