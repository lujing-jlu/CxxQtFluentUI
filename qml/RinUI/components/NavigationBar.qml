import QtQuick 2.15
import QtQuick.Controls 2.15
import "../themes"
import "../components" as Rin

Item {
    id: navigationBar
    height: parent ? parent.height : 600

    property bool collapsed: false
    property var navigationItems: []
    property bool titleBarEnabled: false
    property int expandWidth: 180
    property int minimumExpandWidth: 900
    property string pagesDirectory: "pages"  // Pages directory

    property string windowTitle: ""
    property string titleText: ""
    property string baseUrl: ""
    property int windowWidth: minimumExpandWidth
    property var stackView: null
    property string currentPage: ""
    property bool collapsedByAutoResize: false
    property var floatLayer: null

    // Navigation history
    property var lastPages: []

    signal pageChanged(string page)

    function normalizePageKey(page) {
        var pageKey = String(page)
        if (pageKey.endsWith(".qml")) {
            pageKey = pageKey.replace(".qml", "")
        }
        return pageKey
    }

    function cleanPageName(page) {
        return String(page).replace(/^pages\//, "").replace(/\.qml$/, "")
    }

    function isNotOverMinimumWidth() {
        return windowWidth < minimumExpandWidth;
    }

    width: collapsed ? 40 : expandWidth

    Behavior on width {
        NumberAnimation {
            duration: 250
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
        anchors.top: parent.top
        width: 40
        height: 38
        flat: true
        iconName: "ic_fluent_navigation_20_regular"
        iconSize: 19
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
            return item.position === Rin.Position.Top
        });
    }

    function getMiddleItems() {
        return navigationItems.filter(function(item) {
            return item.position === undefined || item.position === null
                || (item.position !== Rin.Position.Top && item.position !== Rin.Position.Bottom)
        });
    }

    function getBottomItems() {
        return navigationItems.filter(function(item) {
            return item.position === Rin.Position.Bottom
        });
    }

    // Top navigation items
    Flickable {
        id: topFlickable
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: collapseButton.bottom
        anchors.topMargin: 4
        height: getTopItems().length > 0 ? Math.min(topNavigationColumn.implicitHeight, ((navigationBar.height || 600) - 52) * 0.2) : 0
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
        height: getBottomItems().length > 0 ? Math.min(bottomNavigationColumn.implicitHeight, ((navigationBar.height || 600) - 52) * 0.2) : 0
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

    function navigate(page, properties, addToHistory) {
        if (properties === undefined) properties = {}
        if (addToHistory === undefined) addToHistory = true

        var pageKey = normalizePageKey(page)
        if (String(currentPage) === String(pageKey)) return

        if (addToHistory && currentPage !== "") {
            if (lastPages.length < 2) {
                lastPages.push(currentPage)
            } else {
                lastPages.shift()
                lastPages.push(currentPage)
            }
        }

        currentPage = pageKey
        pageChanged(pageKey)

        if (stackView) {
            var pageUrl
            var cleanPage = cleanPageName(page)

            // Use configured pages directory
            pageUrl = Qt.resolvedUrl("../" + pagesDirectory + "/" + cleanPage + ".qml")
            var component = Qt.createComponent(pageUrl)
            if (component.status === Component.Ready) {
                if (properties.navigationView === undefined) properties.navigationView = navigationBar
                var pageInstance = component.createObject(stackView, properties)
                if (!pageInstance) {
                    console.error("Failed to create page instance:", cleanPage)
                    return
                }
                if (navigationBar.floatLayer && pageInstance.floatLayer !== undefined) {
                    pageInstance.floatLayer = navigationBar.floatLayer
                }
                if (stackView.currentItem) stackView.replace(stackView.currentItem, pageInstance)
                else stackView.push(pageInstance)
            } else {
                console.error("Failed to load page:", page, component.errorString())
                if (properties.navigationView === undefined) properties.navigationView = navigationBar
                var errorComponent = Qt.createComponent(Qt.resolvedUrl("Navigation/ErrorPage.qml"))
                if (errorComponent.status !== Component.Ready) {
                    console.error("Failed to load ErrorPage:", errorComponent.errorString())
                    return
                }
                var errorInstance = errorComponent.createObject(stackView, {
                    page: cleanPage,
                    errorMessage: component.errorString(),
                    navigationView: navigationBar
                })
                if (!errorInstance) {
                    console.error("Failed to create ErrorPage instance")
                    return
                }
                if (navigationBar.floatLayer && errorInstance.floatLayer !== undefined) {
                    errorInstance.floatLayer = navigationBar.floatLayer
                }
                if (stackView.currentItem) stackView.replace(stackView.currentItem, errorInstance)
                else stackView.push(errorInstance)
            }
        }
    }

    // Push function
    function push(page, properties) {
        navigate(page, properties, true)
    }

    // Pop function
    function pop() {
        if (lastPages.length > 0) {
            var prevPage = lastPages.pop()
            navigate(prevPage, {}, false)
        }
    }
}
