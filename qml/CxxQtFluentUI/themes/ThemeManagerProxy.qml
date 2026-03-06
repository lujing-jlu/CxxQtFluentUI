pragma Singleton
import QtQuick 2.15
import "."

// Compatibility alias: allow referencing `ThemeManager` (lowercase) everywhere,
// matching existing component bindings in this repo.
QtObject {
    readonly property int light: ThemeManager.light
    readonly property int dark: ThemeManager.dark
    readonly property bool isDark: ThemeManager.isDark
    readonly property var currentTheme: ThemeManager.currentTheme

    property string primaryColor: ThemeManager.primaryColor

    function toggleTheme() { ThemeManager.toggleTheme() }
    function setTheme(mode) { ThemeManager.setTheme(mode) }
    function setPrimaryColor(color) { ThemeManager.setPrimaryColor(color) }
    function syncPrimaryColor() { ThemeManager.syncPrimaryColor() }
}
