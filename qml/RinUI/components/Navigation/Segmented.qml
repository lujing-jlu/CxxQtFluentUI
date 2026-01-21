import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../themes"

TabBar {
    id: root
    implicitWidth: contentWidth

    property color primaryColor: themeManager.currentTheme && themeManager.currentTheme.colors ?
        themeManager.currentTheme.colors.primaryColor : "#0078D4"
    property color controlBorderColor: themeManager.currentTheme && themeManager.currentTheme.colors ?
        themeManager.currentTheme.colors.controlBorderColor : "#000000"
    property color controlAltSecondaryColor: themeManager.currentTheme && themeManager.currentTheme.colors ?
        themeManager.currentTheme.colors.controlAltSecondaryColor : "#F3F3F3"
    property real buttonRadius: themeManager.currentTheme && themeManager.currentTheme.appearance ?
        themeManager.currentTheme.appearance.buttonRadius : 5
    property real borderWidth: themeManager.currentTheme && themeManager.currentTheme.appearance ?
        themeManager.currentTheme.appearance.borderWidth : 1

    background: Rectangle {
        border.width: root.borderWidth
        border.color: root.controlBorderColor
        radius: root.buttonRadius
        color: root.controlAltSecondaryColor
    }
}
