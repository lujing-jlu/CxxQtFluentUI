pragma Singleton
import QtQuick 2.15
import "."

QtObject {
    id: themeManager

    // Theme modes
    readonly property int light: 0
    readonly property int dark: 1

    // Current theme mode
    property int themeMode: light

    // Primary color (customizable)
    property string primaryColor: "#0078D4"

    // Check if dark mode
    readonly property bool isDark: themeMode === dark

    // Current theme object
    property var currentTheme: themeMode === light ? lightThemeInstance : darkThemeInstance

    // Theme instances
    property var lightThemeInstance: null
    property var darkThemeInstance: null

    Component.onCompleted: {
        var lightComponent = Qt.createComponent("light.qml")
        if (lightComponent.status === Component.Ready) {
            lightThemeInstance = lightComponent.createObject(themeManager)
        }

        var darkComponent = Qt.createComponent("dark.qml")
        if (darkComponent.status === Component.Ready) {
            darkThemeInstance = darkComponent.createObject(themeManager)
        }

        syncPrimaryColor()
    }

    function syncPrimaryColor() {
        if (lightThemeInstance && lightThemeInstance.colors) {
            lightThemeInstance.colors.primaryColor = primaryColor
        }
        if (darkThemeInstance && darkThemeInstance.colors) {
            darkThemeInstance.colors.primaryColor = primaryColor
        }
    }

    function toggleTheme() {
        themeMode = isDark ? light : dark
        syncPrimaryColor()
    }

    function setTheme(mode) {
        themeMode = mode
        syncPrimaryColor()
    }

    function setPrimaryColor(color) {
        primaryColor = color
        syncPrimaryColor()
    }
}
