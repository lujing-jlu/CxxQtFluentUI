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
    // FluentWindow compatibility (gallery-style API)
    property alias defaultPage: root.initialPage
    property int expandWidth: 180
    property alias navExpandWidth: root.expandWidth
    property int collapsedWidth: 40
    property var floatLayer: null
    property var window: null
    property bool appLayerEnabled: false
    property alias navigationBar: navigationBar

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
        color: ThemeManager.currentTheme && ThemeManager.currentTheme.colors
            ? ThemeManager.currentTheme.colors.backgroundColor
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
                    navigationBar.navigationViewRoot = root
                    navigationBar.floatLayer = root.floatLayer
                    // Load initial page
                    navigationBar.push(root.initialPage)
                }

                // Page transitions (avoid stacking)
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

    function push(page, properties) {
        if (internal.navigationBar) {
            internal.navigationBar.push(page, properties)
        }
    }

    function pop() {
        if (internal.navigationBar) {
            internal.navigationBar.pop()
        }
    }

    // Best-effort push that tolerates `.qml` suffix and file URLs.
    function safePush(page, properties) {
        if (!page) return
        const pageStr = String(page)
        // If a file URL is passed, try to map it back to a pages/ relative key.
        // Examples: file:///.../qml/CxxQtFluentUI/pages/HomePage.qml -> HomePage
        const marker = "/qml/CxxQtFluentUI/pages/"
        const idx = pageStr.indexOf(marker)
        if (idx !== -1) {
            let rel = pageStr.substring(idx + marker.length)
            rel = rel.replace(/\\.qml$/i, "")
            push(rel, properties)
            return
        }
        push(pageStr.replace(/\\.qml$/i, ""), properties)
    }

    function toggleNavigation() {
        if (internal.navigationBar) {
            internal.navigationBar.collapsed = !internal.navigationBar.collapsed
        }
    }
}
