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

    // Get current theme colors object - direct load for reliability
    property var currentTheme: themeMode === light ? lightThemeInstance : darkThemeInstance

    // Light theme instance
    property var lightThemeInstance: null
    property var darkThemeInstance: null

    Component.onCompleted: {
        // Create theme instances
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

    // Sync primary color to themes
    function syncPrimaryColor() {
        if (lightThemeInstance && lightThemeInstance.colors) {
            lightThemeInstance.colors.primaryColor = primaryColor
        }
        if (darkThemeInstance && darkThemeInstance.colors) {
            darkThemeInstance.colors.primaryColor = primaryColor
        }
    }

    // Toggle between light and dark
    function toggleTheme() {
        themeMode = isDark ? light : dark
        syncPrimaryColor()
    }

    // Set theme mode (0=light, 1=dark)
    function setTheme(mode) {
        themeMode = mode
        syncPrimaryColor()
    }

    // Set primary color
    function setPrimaryColor(color) {
        primaryColor = color
        syncPrimaryColor()
    }
}
