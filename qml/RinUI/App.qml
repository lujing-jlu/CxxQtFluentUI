import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import "themes" as Themes
import "utils" as Utils
import "components" as Rin

Window {
    id: window
    visible: true
    width: 1000
    height: 700
    minimumWidth: 800
    minimumHeight: 600
    title: qsTr("CxxQt FluentUI")

    property var themeManager: Themes.ThemeManager

    Rin.FloatLayer {
        id: floatLayer
        anchors.fill: parent
        z: 999
    }

    // Main navigation view - simplified usage
    Rin.NavigationView {
        id: navigationView
        anchors.fill: parent
        expandWidth: 180
        initialPage: (Qt.application && Qt.application.arguments && Qt.application.arguments.length > 1)
            ? Qt.application.arguments[1]
            : "HomePage"
        floatLayer: floatLayer

        onPageChanged: function(pageName) {
            let pageTitle = Rin.NavigationConfig.getPageTitle(pageName)
            window.title = qsTr("CxxQt FluentUI - ") + pageTitle
        }
    }

    // Theme toggle button (floating)
    Rin.ToolButton {
        anchors.top: parent.top
        anchors.topMargin: 12
        anchors.right: parent.right
        anchors.rightMargin: 12
        width: 36
        height: 36
        flat: true
        iconName: themeManager.isDark ? "ic_fluent_moon_20_regular" : "ic_fluent_weather_sunny_20_regular"
        iconSize: 16
        onClicked: themeManager.toggleTheme()

        ToolTip {
            visible: parent.hovered
            delay: 500
            text: themeManager.isDark ? qsTr("Switch to Light Mode") : qsTr("Switch to Light Mode")
        }
    }
}
