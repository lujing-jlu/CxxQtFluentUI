import QtQuick 2.15
import "../themes"

Item {
    id: root
    anchors.fill: parent
    z: 9999

    required property Item control
    property bool forceVisible: false

    property var themeColors: themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors : null
    property var themeAppearance: themeManager.currentTheme ? themeManager.currentTheme.appearance : null

    readonly property real radius: themeAppearance ? themeAppearance.buttonRadius : 5
    readonly property color focusBorderOuter: themeColors ? themeColors.focusBorderOuter : Qt.alpha("#000000", 0.8956)
    readonly property color focusBorderInner: themeColors ? themeColors.focusBorderInner : "#ffffff"

    visible: forceVisible || (control.activeFocus &&
         (control.focusReason === Qt.TabFocusReason ||
          control.focusReason === Qt.BacktabFocusReason))

    Rectangle {
        anchors.fill: parent
        anchors.margins: -(2 + 1) + (themeAppearance ? themeAppearance.borderWidth : 1)
        color: "transparent"
        border.width: 2
        border.color: focusBorderOuter
        radius: root.radius

        // inner
        Rectangle {
            anchors.fill: parent
            anchors.margins: parent.border.width
            radius: root.radius
            color: "transparent"
            border.color: focusBorderInner
        }
    }
}
