import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "themes" as Themes
import "utils" as Utils
import "components" as Rin
import "pages" as Pages

Window {
    id: window
    visible: true
    width: 1000
    height: 700
    minimumWidth: 800
    minimumHeight: 600
    title: qsTr("CxxQt FluentUI")

    property var themeManager: Themes.ThemeManager
    property var fontIconLoader: Utils.FontIconLoader

    // Navigation items configuration
    property var navigationItems: [
        {
            title: qsTr("Home"),
            page: "pages/HomePage.qml",
            icon: "ic_fluent_home_20_regular"
        },
        {
            title: qsTr("Buttons"),
            page: "pages/ButtonsPage.qml",
            icon: "ic_fluent_button_20_regular"
        },
        {
            title: qsTr("Inputs"),
            page: "pages/InputsPage.qml",
            icon: "ic_fluent_textbox_20_regular",
            subItems: [
                { title: qsTr("TextField"), page: "pages/TextFieldPage.qml", icon: "ic_fluent_text_field_20_regular" },
                { title: qsTr("ComboBox"), page: "pages/ComboBoxPage.qml", icon: "ic_fluent_chevron_down_20_regular" },
                { title: qsTr("TextArea"), page: "pages/TextAreaPage.qml", icon: "ic_fluent_note_20_regular" },
                { title: qsTr("SpinBox"), page: "pages/SpinBoxPage.qml", icon: "ic_fluent_arrow_sort_20_regular" }
            ]
        },
        {
            title: qsTr("Indicators"),
            page: "pages/IndicatorsPage.qml",
            icon: "ic_fluent_progress_circle_20_regular",
            subItems: [
                { title: qsTr("ProgressBar"), page: "pages/ProgressPage.qml", icon: "ic_fluent_circle_20_regular" },
                { title: qsTr("BusyIndicator"), page: "pages/BusyPage.qml", icon: "ic_fluent_spinner_off_20_regular" }
            ]
        },
        {
            title: qsTr("Settings"),
            page: "pages/SettingsPage.qml",
            icon: "ic_fluent_settings_20_regular"
        }
    ]

    Rectangle {
        anchors.fill: parent
        color: themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors.backgroundColor : "#F3F3F3"

        RowLayout {
            anchors.fill: parent
            spacing: 0

            // Navigation sidebar
            Rin.NavigationBar {
                id: navigationBar
                Layout.fillHeight: true
                Layout.preferredWidth: width  // Sync width with RowLayout
                navigationItems: window.navigationItems
                collapsed: false
                titleText: "CxxQt FluentUI"
                // Don't set baseUrl - use default pages directory

                onPageChanged: function(page) {
                    var pageTitle = page.charAt(0).toUpperCase() + page.slice(1);
                    if (page === "homepage") window.title = qsTr("CxxQt FluentUI - Home");
                    else window.title = qsTr("CxxQt FluentUI - ") + pageTitle;
                }
            }

            // Main content area with StackView
            StackView {
                id: mainStackView
                Layout.fillWidth: true
                Layout.fillHeight: true
                initialItem: Pages.HomePage {}

                // Simple show/hide transitions (无动画)
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

    // Theme toggle button (floating)
    Rin.ToolButton {
        anchors.top: parent.top
        anchors.topMargin: 12
        anchors.right: parent.right
        anchors.rightMargin: 12
        width: 36
        height: 36
        flat: true
        iconName: themeManager.isDark ? "ic_fluent_moon_20_regular" : "ic_fluent_weather_sunny_20_regular"
        iconSize: 16
        onClicked: themeManager.toggleTheme()

        ToolTip {
            visible: parent.hovered
            delay: 500
            text: themeManager.isDark ? qsTr("Switch to Light Mode") : qsTr("Switch to Dark Mode")
        }
    }

    Component.onCompleted: {
        // Pass the StackView to NavigationBar
        navigationBar.stackView = mainStackView
        // Initialize with home page
        navigationBar.push("pages/HomePage.qml")
    }
}
