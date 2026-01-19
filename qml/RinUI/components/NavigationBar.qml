import QtQuick 2.15
import QtQuick.Controls 2.15
import "../themes"
import "../components" as Rin
import "../utils" as Utils

Item {
    id: navigationBar
    height: parent ? parent.height : 600

    property bool collapsed: false
    property var navigationItems: []
    property bool titleBarEnabled: false  // Disable title bar for now
    property int expandWidth: 280
    property int minimumExpandWidth: 900

    property string windowTitle: ""
    property string titleText: ""  // For backward compatibility
    property string baseUrl: ""  // For backward compatibility
    property int windowWidth: minimumExpandWidth
    property var stackView: null
    property string currentPage: ""
    property bool collapsedByAutoResize: false

    // Navigation history
    property var lastPages: []

    signal pageChanged(string page)

    function isNotOverMinimumWidth() {
        return windowWidth < minimumExpandWidth;
    }

    width: collapsed ? 48 : expandWidth

    Behavior on width {
        NumberAnimation {
            duration: Utils.animationSpeed
            easing.type: Easing.OutQuint
        }
    }

    // Background
    Rectangle {
        anchors.fill: parent
        color: themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors.cardColor : "#ffffff"

        Rectangle {
            anchors.right: parent.right
            width: 1
            height: parent.height
            color: themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors.cardBorderColor : "#e5e5e5"
        }
    }

    // Collapse button
    Rin.ToolButton {
        id: collapseButton
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        height: 48
        flat: true
        iconName: "ic_fluent_navigation_20_regular"
        iconSize: 20
        onClicked: {
            collapsed = !collapsed
            collapsedByAutoResize = false
        }

        ToolTip {
            visible: collapseButton.hovered
            delay: 500
            text: collapsed ? qsTr("Open Navigation") : qsTr("Close Navigation")
        }
    }

    // Data filtering
    function getTopItems() {
        return navigationItems.filter(function(item) {
            return item.position === 1; // Position.Top
        });
    }

    function getMiddleItems() {
        return navigationItems.filter(function(item) {
            return item.position === undefined || item.position === null || item.position === 0;
        });
    }

    function getBottomItems() {
        return navigationItems.filter(function(item) {
            return item.position === 2; // Position.Bottom
        });
    }

    // Top navigation items
    Flickable {
        id: topFlickable
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: collapseButton.bottom
        anchors.topMargin: 4
        height: getTopItems().length > 0 ? Math.min(topNavigationColumn.implicitHeight, (parent.height - 52) * 0.2) : 0
        contentWidth: parent.width
        contentHeight: topNavigationColumn.implicitHeight
        clip: true
        visible: getTopItems().length > 0

        Column {
            id: topNavigationColumn
            width: topFlickable.width
            spacing: 2

            Repeater {
                id: topRepeater
                model: navigationBar.getTopItems()
                delegate: Rin.NavigationItem {
                    id: topItem
                    itemData: modelData
                    navigationView: navigationBar
                    navBarCollapsed: navigationBar.collapsed
                }
            }
        }

        ScrollBar.vertical: ScrollBar {
            policy: ScrollBar.AsNeeded
        }
    }

    // Top Separator
    Rectangle {
        id: topSeparator
        anchors.top: topFlickable.bottom
        anchors.topMargin: topFlickable.visible ? 4 : 0
        anchors.left: parent.left
        anchors.right: parent.right
        height: 1
        color: themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors.dividerBorderColor : "#e0e0e0"
        visible: getTopItems().length > 0
    }

    // Middle navigation area
    Flickable {
        id: flickable
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: topSeparator.visible ? topSeparator.bottom : topFlickable.bottom
        anchors.topMargin: topSeparator.visible ? 4 : 0
        anchors.bottom: bottomSeparator.visible ? bottomSeparator.top : bottomFlickable.top
        anchors.bottomMargin: bottomSeparator.visible ? 4 : 0
        contentWidth: parent.width
        contentHeight: navigationColumn.implicitHeight
        clip: true

        Column {
            id: navigationColumn
            width: flickable.width
            spacing: 2

            Repeater {
                id: mainRepeater
                model: navigationBar.getMiddleItems()
                delegate: Rin.NavigationItem {
                    id: item
                    itemData: modelData
                    navigationView: navigationBar
                    navBarCollapsed: navigationBar.collapsed
                }
            }
        }

        ScrollBar.vertical: ScrollBar {
            policy: ScrollBar.AsNeeded
        }
    }

    // Bottom Separator
    Rectangle {
        id: bottomSeparator
        anchors.bottom: bottomFlickable.top
        anchors.bottomMargin: 4
        anchors.left: parent.left
        anchors.right: parent.right
        height: 1
        color: themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors.dividerBorderColor : "#e0e0e0"
        visible: getBottomItems().length > 0
    }

    // Bottom navigation items
    Flickable {
        id: bottomFlickable
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 0
        height: getBottomItems().length > 0 ? Math.min(bottomNavigationColumn.implicitHeight, (parent.height - 52) * 0.2) : 0
        contentWidth: parent.width
        contentHeight: bottomNavigationColumn.implicitHeight
        clip: true
        visible: getBottomItems().length > 0

        Column {
            id: bottomNavigationColumn
            width: bottomFlickable.width
            spacing: 2

            Repeater {
                id: bottomRepeater
                model: navigationBar.getBottomItems()
                delegate: Rin.NavigationItem {
                    id: bottomItem
                    itemData: modelData
                    navigationView: navigationBar
                    navBarCollapsed: navigationBar.collapsed
                }
            }
        }

        ScrollBar.vertical: ScrollBar {
            policy: ScrollBar.AsNeeded
        }
    }

    // Push function
    function push(page, properties) {
        if (properties === undefined) properties = {}

        if (currentPage !== "" && lastPages.length < 2) {
            lastPages.push(currentPage)
        } else if (lastPages.length >= 2) {
            lastPages.shift()
            lastPages.push(currentPage)
        }

        var pageKey = String(page)
        if (pageKey.endsWith(".qml")) {
            pageKey = pageKey.replace(".qml", "")
        }

        currentPage = pageKey
        pageChanged(pageKey)

        if (stackView) {
            var pageUrl
            var cleanPage = page.replace(/^pages\//, "").replace(/\.qml$/, "")

            // Always use the default pages directory
            pageUrl = "pages/" + cleanPage + ".qml"
            var component = Qt.createComponent(pageUrl)
            if (component.status === Component.Ready) {
                stackView.push(component, properties)
            } else {
                console.error("Failed to load page:", page, component.errorString())
            }
        }
    }

    // Pop function
    function pop() {
        if (lastPages.length > 0) {
            var prevPage = lastPages.pop()
            currentPage = String(prevPage)
            if (prevPage.endsWith(".qml")) {
                prevPage = prevPage.replace(".qml", "")
            }
            if (stackView && stackView.depth > 1) {
                stackView.pop()
            }
        }
    }
}
