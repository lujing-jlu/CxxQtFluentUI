import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../themes"
import "../components"
import "../windows"

FluentWindowBase {
    id: window
    width: 900
    height: 600
    minimumWidth: 400
    minimumHeight: 300
    titleEnabled: false
    titleBarHeight: ThemeManager.currentTheme && ThemeManager.currentTheme.appearance ?
        ThemeManager.currentTheme.appearance.windowTitleBarHeight : 48

    property alias navigationView: navigationView
    property alias navigationItems: navigationView.navigationItems
    property alias currentPage: navigationView.currentPage
    property alias defaultPage: navigationView.defaultPage
    property alias appLayerEnabled: navigationView.appLayerEnabled

    NavigationView {
        id: navigationView
        window: window
        anchors.fill: parent
    }
}
