pragma Singleton
import QtQuick 2.15

QtObject {
    id: themeManager

    // Theme modes (lowercase for QML compliance)
    readonly property int light: 0
    readonly property int dark: 1

    // Current theme mode
    property int themeMode: light

    // Primary color (customizable)
    property string primaryColor: "#0078D4"

    // Get current theme colors object
    property var currentTheme: themeMode === light ? lightTheme : darkTheme

    // Get current theme name
    readonly property string themeName: themeMode === light ? "Light" : "Dark"

    // Check if dark mode
    readonly property bool isDark: themeMode === dark

    // Load light theme from QML file
    property var lightTheme: Loader {
        asynchronous: false
        source: "light.qml"
    }

    // Load dark theme from QML file
    property var darkTheme: Loader {
        asynchronous: false
        source: "dark.qml"
    }

    // Initialize and sync primary color
    Component.onCompleted: {
        syncPrimaryColor()
    }

    // Sync primary color to themes
    function syncPrimaryColor() {
        if (lightTheme.item) {
            lightTheme.item.colors.primaryColor = primaryColor
        }
        if (darkTheme.item) {
            darkTheme.item.colors.primaryColor = primaryColor
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

    // Get theme color by name (convenience function)
    function getColor(category, name) {
        var theme = currentTheme
        if (theme && theme.item && theme.item.colors) {
            var colorPath = category + name
            return theme.item.colors[colorPath]
        }
        return "transparent"
    }
}
