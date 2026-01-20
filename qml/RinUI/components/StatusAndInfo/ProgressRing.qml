import QtQuick 2.15
import QtQuick.Controls.Basic 2.15 as QQC
import "../../utils" as Utils
import "../../components" as Rin

QQC.ProgressBar {
    id: root

    property color themePrimaryColor: themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors.primaryColor : "#0078D4"
    property color themeSystemCautionColor: themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors.systemCautionColor : "#FFB900"
    property color themeSystemCriticalColor: themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors.systemCriticalColor : "#D13438"

    property int state: ProgressRing.Running

    enum State {
        Running,
        Paused,
        Error
    }

    implicitWidth: 56
    implicitHeight: 56

    property int strokeWidth: 6
    property int size: 56
    property real radius: (Math.min(width, height) - strokeWidth) / 2

    property color backgroundColor: "transparent"
    property color primaryColor: themePrimaryColor

    property color _ringColor: state === ProgressRing.Paused
        ? themeSystemCautionColor
        : state === ProgressRing.Error
        ? themeSystemCriticalColor
        : primaryColor

    property real _progress: (to - from) === 0
        ? 0
        : Math.max(0, Math.min(1, (value - from) / (to - from)))

    background: Item {}

    contentItem: Canvas {
        id: canvas
        anchors.fill: parent
        antialiasing: true
        renderTarget: Canvas.Image

        property real startAngle: 0
        property real sweepAngle: 270

        onPaint: {
            var ctx = getContext("2d")
            ctx.clearRect(0, 0, width, height)
            ctx.lineWidth = root.strokeWidth
            ctx.lineCap = "round"

            var centerX = width / 2
            var centerY = height / 2

            // Background ring
            ctx.strokeStyle = root.backgroundColor
            ctx.beginPath()
            ctx.arc(centerX, centerY, root.radius, 0, 2 * Math.PI)
            ctx.stroke()

            // Foreground ring
            ctx.strokeStyle = root._ringColor
            ctx.beginPath()
            if (root.indeterminate) {
                ctx.arc(centerX, centerY, root.radius,
                    Math.PI * (startAngle - 90) / 180,
                    Math.PI * (startAngle - 90 + sweepAngle) / 180)
            } else {
                ctx.arc(centerX, centerY, root.radius,
                    -Math.PI / 2,
                    -Math.PI / 2 + root._progress * 2 * Math.PI)
            }
            ctx.stroke()
        }

        onStartAngleChanged: requestPaint()
        onSweepAngleChanged: requestPaint()
        onWidthChanged: requestPaint()
        onHeightChanged: requestPaint()

        Component.onCompleted: requestPaint()

        // Rotation animation (Running)
        SequentialAnimation on startAngle {
            running: root.indeterminate && root.state === ProgressRing.Running
            loops: Animation.Infinite
            PropertyAnimation { from: 0; to: 450; duration: 2000 }
            PropertyAnimation { from: 450; to: 1080; duration: 2000 }
        }
        SequentialAnimation on sweepAngle {
            running: root.indeterminate && root.state === ProgressRing.Running
            loops: Animation.Infinite
            PropertyAnimation { from: 0; to: 180; duration: 2000 }
            PropertyAnimation { from: 180; to: 0; duration: 2000 }
        }

        // Fill animation (Paused/Error)
        SequentialAnimation on startAngle {
            running: root.indeterminate && root.state !== ProgressRing.Running
            PropertyAnimation {
                from: 0;  to: 0; duration: 300; easing.type: Easing.InOutCubic
            }
        }
        SequentialAnimation on sweepAngle {
            running: root.indeterminate && root.state !== ProgressRing.Running
            PropertyAnimation {
                from: 0; to: 360; duration: 300; easing.type: Easing.InOutCubic
            }
        }
    }

    // Animation
    Behavior on _progress {
        NumberAnimation {
            duration: 150
            easing.type: Easing.InOutQuad
        }
    }

    Behavior on _ringColor {
        ColorAnimation {
            duration: 150
            easing.type: Easing.OutCubic
        }
    }

    onStateChanged: {
        if (!indeterminate)
            canvas.requestPaint()
    }
    on_ProgressChanged: {
        if (!indeterminate)
            canvas.requestPaint()
    }
    on_RingColorChanged: {
        canvas.requestPaint()
    }
}
