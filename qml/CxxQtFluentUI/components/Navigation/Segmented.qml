import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../themes"

TabBar {
    id: root
    implicitWidth: contentWidth

    property color primaryColor: ThemeManager.currentTheme && ThemeManager.currentTheme.colors ?
        ThemeManager.currentTheme.colors.primaryColor : "#0078D4"
    property color controlBorderColor: ThemeManager.currentTheme && ThemeManager.currentTheme.colors ?
        ThemeManager.currentTheme.colors.controlBorderColor : "#000000"
    property color controlAltSecondaryColor: ThemeManager.currentTheme && ThemeManager.currentTheme.colors ?
        ThemeManager.currentTheme.colors.controlAltSecondaryColor : "#F3F3F3"
    property real buttonRadius: ThemeManager.currentTheme && ThemeManager.currentTheme.appearance ?
        ThemeManager.currentTheme.appearance.buttonRadius : 5
    property real borderWidth: ThemeManager.currentTheme && ThemeManager.currentTheme.appearance ?
        ThemeManager.currentTheme.appearance.borderWidth : 1

    background: Rectangle {
        border.width: root.borderWidth
        border.color: root.controlBorderColor
        radius: root.buttonRadius
        color: root.controlAltSecondaryColor
    }
}
