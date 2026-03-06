import QtQuick 2.15
import QtQuick.Controls.Basic 2.15
import QtQuick.Layouts 2.15
import Qt5Compat.GraphicalEffects
import "../../themes"
import "../../utils"
import "../../components"

Button {
    id: root
    property alias radius: background.radius

    property bool hoverable: true
    readonly property color roundBackgroundColor: highlighted
        ? primaryColor
        : (ThemeManager.currentTheme && ThemeManager.currentTheme.colors
            ? ThemeManager.currentTheme.colors.controlQuaternaryColor
            : Qt.alpha("#F3F3F3", 0.76))

    readonly property color roundHoverColor: !highlighted && !flat
        ? (ThemeManager.currentTheme && ThemeManager.currentTheme.colors
            ? ThemeManager.currentTheme.colors.controlSecondaryColor
            : "#F9F9F9")
        : roundBackgroundColor

    background: Rectangle {
        id: background
        anchors.fill: parent
        color: hovered ? roundHoverColor : roundBackgroundColor
        radius: height / 2

        border.width: ThemeManager.currentTheme.appearance.borderWidth  // 边框宽度 / Border Width
        border.color: flat ? "transparent" :
            enabled ? highlighted ? primaryColor : ThemeManager.currentTheme.colors.controlBorderColor :
            highlighted ? ThemeManager.currentTheme.colors.disabledColor : ThemeManager.currentTheme.colors.controlBorderColor

        Behavior on color { ColorAnimation { duration: Utils.appearanceSpeed; easing.type: Easing.OutQuart } }
        opacity: flat && !hovered || !hoverable ? 0 : 1
    }
}
