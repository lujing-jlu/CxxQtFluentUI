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
        : (themeManager.currentTheme && themeManager.currentTheme.colors
            ? themeManager.currentTheme.colors.controlQuaternaryColor
            : Qt.alpha("#F3F3F3", 0.76))

    readonly property color roundHoverColor: !highlighted && !flat
        ? (themeManager.currentTheme && themeManager.currentTheme.colors
            ? themeManager.currentTheme.colors.controlSecondaryColor
            : "#F9F9F9")
        : roundBackgroundColor

    background: Rectangle {
        id: background
        anchors.fill: parent
        color: hovered ? roundHoverColor : roundBackgroundColor
        radius: height / 2

        border.width: themeManager.currentTheme.appearance.borderWidth  // 边框宽度 / Border Width
        border.color: flat ? "transparent" :
            enabled ? highlighted ? primaryColor : themeManager.currentTheme.colors.controlBorderColor :
            highlighted ? themeManager.currentTheme.colors.disabledColor : themeManager.currentTheme.colors.controlBorderColor

        Behavior on color { ColorAnimation { duration: Utils.appearanceSpeed; easing.type: Easing.OutQuart } }
        opacity: flat && !hovered || !hoverable ? 0 : 1
    }
}
