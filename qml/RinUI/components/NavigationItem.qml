import QtQuick 2.15
import QtQuick.Controls 2.15
import "../themes"
import "../components" as Rin
import "../utils"

Item {
    id: root
    property var itemData: ({})
    property var navigationView: null
    property bool navBarCollapsed: false  // Passed from NavigationBar

    readonly property bool subItem: itemData.subItems ? true : false
    property bool highlighted: {
        if (!navigationView) return false
        return String(navigationView.currentPage) === String(itemData.page) || (collapsed && subItemHighlighted)
    }
    property bool subItemHighlighted: {
        if (!subItem || !navigationView) return false
        for (let i = 0; i < itemData.subItems.length; i++) {
            if (String(itemData.subItems[i].page) === String(navigationView.currentPage)) {
                return true
            }
        }
        return false
    }
    property bool collapsed: true  // Sub-menu collapse state

    height: 40 + (!collapsed && subItem ? subItemsColumn.height : 0)
    width: parent ? parent.width : 200

    Behavior on height {
        NumberAnimation { duration: Utils.animationSpeed; easing.type: Easing.OutQuint }
    }

    // Auto-collapse sub menus when nav bar collapses
    onNavBarCollapsedChanged: {
        if (navBarCollapsed) {
            collapsed = true
        }
    }

    Rin.Button {
        id: itemBtn
        width: parent.width
        height: 37
        y: 2
        flat: true
        clip: true

        background: Rectangle {
            id: background
            anchors.fill: parent
            radius: themeManager.currentTheme ? themeManager.currentTheme.appearance.buttonRadius : 4
            color: root.highlighted
                ? (themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors.subtleSecondaryColor : Qt.alpha("#000000", 0.06))
                : (themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors.subtleColor : "transparent")
            opacity: root.highlighted ? 1 : itemBtn.hovered ? 1 : 0

            Behavior on opacity { NumberAnimation { duration: Utils.appearanceSpeed; easing.type: Easing.InOutQuart } }
            Behavior on color { ColorAnimation { duration: Utils.appearanceSpeed; easing.type: Easing.InOutQuart } }
        }

        Rin.FocusIndicator {
            control: itemBtn
            anchors.margins: 2
        }

        contentItem: Item {
            anchors.fill: parent

            Row {
                id: left
                spacing: 16
                anchors.left: parent.left
                anchors.verticalCenter: parent.verticalCenter
                anchors.leftMargin: 11
                anchors.topMargin: 6
                anchors.bottomMargin: 8

                Rin.Icon {
                    id: icon
                    anchors.verticalCenter: parent.verticalCenter
                    size: (itemData.size !== undefined && itemData.size !== null) ? itemData.size : (itemData.icon ? 19 : 0)
                    name: itemData.icon || ""
                    color: root.highlighted
                        ? (themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors.primaryColor : "#0078D4")
                        : (themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors.textColor : "#1b1b1b")
                }

                Text {
                    id: text
                    anchors.verticalCenter: parent.verticalCenter
                    text: itemData.title || ""
                    font.pixelSize: 14
                    color: icon.color
                    clip: true
                    opacity: navBarCollapsed ? 0 : 1
                    visible: opacity > 0
                    wrapMode: Text.NoWrap
                    horizontalAlignment: Text.AlignLeft
                    elide: Text.ElideRight
                    width: itemBtn.width - left.anchors.leftMargin - x - (expandBtn.visible ? expandBtn.width : 0) - 10

                    Behavior on opacity { NumberAnimation { duration: Utils.appearanceSpeed } }
                }
            }
        }

        ToolTip {
            visible: navBarCollapsed && itemBtn.hovered
            delay: 500
            text: itemData.title || ""
        }

        Rin.Indicator {
            id: indicator
            x: left.x - 11
            y: (itemBtn.height + 3) / 2 - indicator.height / 2 - 2
            currentItemHeight: itemBtn.height + 3
            visible: root.highlighted ? 1 : 0
            width: 3
        }

        Rin.ToolButton {
            id: expandBtn
            flat: true
            hoverable: false
            focusPolicy: Qt.NoFocus
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter
            width: parent.height
            height: parent.height
            iconName: "ic_fluent_chevron_down_20_filled"
            iconSize: 14
            iconColor: root.highlighted
                ? (themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors.primaryColor : "#0078D4")
                : (themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors.textColor : "#1b1b1b")

            opacity: 0.7
            visible: subItem && !navBarCollapsed

            transform: Rotation {
                angle: collapsed ? 0 : 180
                origin.x: itemBtn.height / 2
                origin.y: itemBtn.height / 2
                Behavior on angle { NumberAnimation { duration: Utils.animationSpeed; easing.type: Easing.OutQuint } }
            }

            onClicked: {
                collapsed = !collapsed
                if (navigationView && typeof navigationView.requestLayoutUpdate === "function") {
                    Qt.callLater(navigationView.requestLayoutUpdate)
                }
            }
        }

        onClicked: {
            if (subItem) {
                if (!navBarCollapsed) {
                    collapsed = !collapsed
                    if (navigationView && typeof navigationView.requestLayoutUpdate === "function") {
                        Qt.callLater(navigationView.requestLayoutUpdate)
                    }
                } else {
                    subMenu.open()
                }
            }
            if (itemData.page && navigationView && String(navigationView.currentPage) !== String(itemData.page)) {
                navigationView.push(itemData.page)
            }
        }
    }

    Rin.Menu {
        id: subMenu
        position: Rin.Position.Right
        Repeater {
            model: subItem && itemData.subItems ? itemData.subItems : []
            delegate: Rin.MenuItem {
                text: modelData.title || ""
                onTriggered: {
                    if (modelData.page && navigationView) {
                        navigationView.push(modelData.page)
                    }
                }
            }
        }
    }

    // Sub items column
    Column {
        id: subItemsColumn
        opacity: !collapsed && subItem
        visible: opacity > 0
        spacing: 2
        anchors.top: itemBtn.bottom
        width: parent.width
        anchors.topMargin: 1
        anchors.leftMargin: 16

        Behavior on opacity {
            NumberAnimation { duration: 250; easing.type: Easing.OutQuint }
        }

        Repeater {
            model: subItem && itemData.subItems ? itemData.subItems : []
            delegate: Rin.NavigationSubItem {
                itemData: modelData
                navigationView: root.navigationView
                highlighted: root.navigationView && String(root.navigationView.currentPage) === String(modelData.page)
            }
        }

        Item {
            width: parent.width
            height: 1
        }
    }
}
