import QtQuick 2.15
import QtQuick.Layouts 2.15
import "../windows"
import "../themes"
import "../utils"

FluentPage {
    id: root

    // Navigation plumbing (set by NavigationBar)
    property var navigationView: null

    // Optional page description shown under the title.
    property string description: ""

    wrapperWidth: parent ? (parent.width - Utils.pageMargin * 2) : 1000
    pageHorizontalPadding: 0
    contentSpacing: 16

    Text {
        Layout.fillWidth: true
        visible: root.description.length > 0
        wrapMode: Text.WordWrap
        font.pixelSize: 14
        color: themeManager.currentTheme && themeManager.currentTheme.colors
            ? themeManager.currentTheme.colors.textSecondaryColor
            : "#6c6c6c"
        text: root.description
    }
}

