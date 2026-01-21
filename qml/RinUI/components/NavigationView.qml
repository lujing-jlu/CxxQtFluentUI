import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../themes"
import "../utils"
import "."

Item {
    id: root

    // Properties
    property var navigationItems: NavigationConfig.items
    property string initialPage: "HomePage"
    property int expandWidth: 180
    property int collapsedWidth: 40
    property var floatLayer: null

    // Read-only
    property var currentStackView: internal.stackView
    property string currentPage: internal.navigationBar.currentPage

    // Signals
    signal pageChanged(string pageName)

    property int pushEnterFromY: height

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
            NavigationBar {
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
                clip: true
                initialItem: Item {}

                Component.onCompleted: {
                    internal.stackView = mainStackView
                    navigationBar.stackView = mainStackView
                    navigationBar.floatLayer = root.floatLayer
                    // Load initial page
                    navigationBar.push(root.initialPage)
                }

                // Page transitions (match Rin-UI behavior to avoid stacking)
                pushEnter: Transition {
                    PropertyAnimation {
                        property: "opacity"
                        from: 0
                        to: 1
                        duration: Utils.appearanceSpeed
                        easing.type: Easing.InOutQuad
                    }
                    PropertyAnimation {
                        property: "y"
                        from: root.pushEnterFromY
                        to: 0
                        duration: Utils.animationSpeedMiddle
                        easing.type: Easing.OutQuint
                    }
                }

                pushExit: Transition {
                    PropertyAnimation {
                        property: "opacity"
                        from: 1
                        to: 0
                        duration: Utils.animationSpeed
                        easing.type: Easing.InOutQuad
                    }
                }

                popExit: Transition {
                    SequentialAnimation {
                        PauseAnimation { duration: Utils.animationSpeedFaster * 0.6 }
                        PropertyAnimation {
                            property: "opacity"
                            from: 1
                            to: 0
                            duration: Utils.appearanceSpeed
                            easing.type: Easing.InOutQuad
                        }
                    }
                    PropertyAnimation {
                        property: "y"
                        from: 0
                        to: root.pushEnterFromY
                        duration: Utils.animationSpeed
                        easing.type: Easing.InQuint
                    }
                }

                popEnter: Transition {
                    SequentialAnimation {
                        PauseAnimation { duration: Utils.animationSpeed }
                        PropertyAnimation {
                            property: "opacity"
                            from: 0
                            to: 1
                            duration: 100
                            easing.type: Easing.InOutQuad
                        }
                    }
                }

                // Keep replace behavior consistent with push to avoid visual glitches
                replaceEnter: pushEnter
                replaceExit: pushExit
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
