import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../themes"
import "../utils" as Utils

Item {
    id: root

    // Properties
    property var navigationItems: NavigationConfig.items
    property string initialPage: "HomePage"
    property int expandWidth: 180
    property int collapsedWidth: 40

    // Read-only
    property var currentStackView: internal.stackView
    property string currentPage: internal.navigationBar.currentPage

    // Signals
    signal pageChanged(string pageName)

    QtObject {
        id: internal

        property var stackView: null
        property var navigationBar: null
    }

    Rectangle {
        anchors.fill: parent
        color: themeManager.currentTheme && themeManager.currentTheme.colors
            ? themeManager.currentTheme.colors.backgroundColor
            : "#F3F3F3"

        RowLayout {
            anchors.fill: parent
            spacing: 0

            // Navigation sidebar
            Rin.NavigationBar {
                id: navigationBar
                Layout.fillHeight: true
                Layout.preferredWidth: width
                expandWidth: root.expandWidth
                navigationItems: root.navigationItems

                Component.onCompleted: {
                    internal.navigationBar = navigationBar
                }

                onPageChanged: function(page) {
                    let pageTitle = NavigationConfig.getPageTitle(page)
                    root.pageChanged(page)
                }
            }

            // Main content area with StackView
            StackView {
                id: mainStackView
                Layout.fillWidth: true
                Layout.fillHeight: true

                Component.onCompleted: {
                    internal.stackView = mainStackView
                    navigationBar.stackView = mainStackView
                    // Load initial page
                    navigationBar.push(root.initialPage)
                }

                // Simple show/hide transitions
                pushEnter: Transition {
                    PropertyAnimation {
                        property: "opacity"
                        from: 0
                        to: 1
                        duration: 0
                    }
                }
                pushExit: Transition {
                    PropertyAnimation {
                        property: "opacity"
                        from: 1
                        to: 0
                        duration: 0
                    }
                }
                popEnter: Transition {
                    PropertyAnimation {
                        property: "opacity"
                        from: 0
                        to: 1
                        duration: 0
                    }
                }
                popExit: Transition {
                    PropertyAnimation {
                        property: "opacity"
                        from: 1
                        to: 0
                        duration: 0
                    }
                }
            }
        }
    }

    // Public API
    function navigateTo(pageName) {
        if (internal.navigationBar) {
            internal.navigationBar.push(pageName)
        }
    }

    function navigateBack() {
        if (internal.navigationBar) {
            internal.navigationBar.pop()
        }
    }

    function toggleNavigation() {
        if (internal.navigationBar) {
            internal.navigationBar.collapsed = !internal.navigationBar.collapsed
        }
    }
}
