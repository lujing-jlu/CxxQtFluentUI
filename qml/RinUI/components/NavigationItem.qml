import QtQuick 2.15
import QtQuick.Controls 2.15
import "../themes"
import "../components" as Rin
import "../utils" as Utils

Item {
    id: root
    property var itemData: ({})
    property var navigationView: null
    property bool navBarCollapsed: false  // Passed from NavigationBar

    readonly property bool subItem: itemData.subItems ? true : false
    property bool highlighted: {
        if (!navigationView || !navigationView.currentPage) return false
        return String(navigationView.currentPage) === String(itemData.page)
    }
    property bool subItemHighlighted: {
        if (!subItem || !navigationView) return false
        var currentPage = navigationView.currentPage
        if (itemData.subItems) {
            for (let i = 0; i < itemData.subItems.length; i++) {
                if (String(itemData.subItems[i].page) === String(currentPage)) {
                    return true
                }
            }
        }
        return false
    }
    property bool collapsed: true  // Sub-menu collapse state

    height: 38 + (!collapsed && subItem ? subItemsColumn.height : 0)
    width: parent ? parent.width : 200

    Behavior on height {
        NumberAnimation { duration: Utils.animationSpeed || 250; easing.type: Easing.OutQuint }
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
        height: 38
        flat: true
        leftPadding: 10  // Match collapse button icon position (centered at 20 in 40px width)
        rightPadding: 10

        contentItem: Item {
            // Content container - icon stays at same position, only text fades in/out
            Item {
                id: contentContainer
                anchors.left: parent.left
                anchors.leftMargin: 0  // Icon position (all the way to the left)
                anchors.verticalCenter: parent.verticalCenter
                width: parent.width - 11
                height: 24

                Rin.Icon {
                    id: icon
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    size: (itemData.size !== undefined && itemData.size !== null) ? itemData.size : (itemData.icon ? 19 : 0)
                    name: itemData.icon || ""
                    color: (root.highlighted && !navBarCollapsed) ?
                        (themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors.primaryColor : "#0078D4") :
                        (themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors.textColor : "#1b1b1b")
                }

                Text {
                    id: text
                    anchors.left: icon.right
                    anchors.leftMargin: 16
                    anchors.verticalCenter: parent.verticalCenter
                    text: itemData.title || ""
                    font.pixelSize: 14
                    color: (root.highlighted && !navBarCollapsed) ?
                        (themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors.primaryColor : "#0078D4") :
                        (themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors.textColor : "#1b1b1b")
                    opacity: navBarCollapsed ? 0 : 1
                    visible: opacity > 0

                    Behavior on opacity {
                        NumberAnimation { duration: Utils.appearanceSpeed || 150 }
                    }
                }
            }
        }

        background: Rectangle {
            anchors.fill: parent
            radius: 4
            color: (root.highlighted && !navBarCollapsed) ?
                (themeManager.currentTheme && themeManager.currentTheme.colors ? Qt.alpha(themeManager.currentTheme.colors.primaryColor, 0.1) : Qt.alpha("#0078D4", 0.1)) :
                (itemBtn.hovered ? (themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors.subtleSecondaryColor : Qt.alpha("#000000", 0.06)) : "transparent")
            opacity: ((root.highlighted && !navBarCollapsed) || itemBtn.hovered) ? 1 : 0
        }

        ToolTip {
            visible: navBarCollapsed && itemBtn.hovered
            delay: 500
            text: itemData.title || ""
        }

        // Highlight indicator
        Rectangle {
            id: indicator
            anchors.left: parent.left
            anchors.leftMargin: 4
            anchors.verticalCenter: parent.verticalCenter
            width: 3
            height: 20
            radius: 1
            color: themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors.primaryColor : "#0078D4"
            visible: root.highlighted && !navBarCollapsed
        }

        // Expand button
        Item {
            id: expandBtn
            anchors.right: parent.right
            anchors.rightMargin: 8
            width: 28
            height: parent.height
            visible: subItem && !navBarCollapsed
            opacity: 0.7

            Rin.Icon {
                anchors.centerIn: parent
                size: 14
                name: "ic_fluent_chevron_down_20_filled"
                color: root.highlighted ?
                    (themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors.primaryColor : "#0078D4") :
                    (themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors.textColor : "#1b1b1b")

                transform: Rotation {
                    angle: collapsed ? 0 : 180
                    origin.x: 7  // Center of 14px icon
                    origin.y: 7  // Center of 14px icon
                    Behavior on angle { NumberAnimation { duration: Utils.animationSpeed || 250; easing.type: Easing.OutQuint } }
                }
            }

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    collapsed = !collapsed
                }
            }
        }

        onClicked: {
            if (subItem && !navBarCollapsed) {
                collapsed = !collapsed
            }
            if (itemData.page && navigationView) {
                navigationView.push(itemData.page)
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

        Behavior on opacity {
            NumberAnimation { duration: Utils.animationSpeed || 250; easing.type: Easing.OutQuint }
        }

        Repeater {
            model: subItem && itemData.subItems ? itemData.subItems : []
            delegate: Rin.NavigationSubItem {
                itemData: modelData
                navigationView: root.navigationView
                highlighted: root.navigationView && String(root.navigationView.currentPage) === String(modelData.page)
            }
        }
    }
}
