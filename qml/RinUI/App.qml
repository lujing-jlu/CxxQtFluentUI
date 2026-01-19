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

    // Access theme manager singleton
    readonly property var themeManager: Themes.ThemeManager
    // Load font icon loader to ensure font is loaded
    readonly property var fontIconLoader: Utils.FontIconLoader
    property int currentPageIndex: 0

    // Main content - toolbar + sidebar + content area
    ColumnLayout {
        anchors.fill: parent
        spacing: 0

        // Top toolbar with theme toggle
        Rectangle {
            Layout.fillWidth: true
            height: 48
            color: themeManager.currentTheme.item ? themeManager.currentTheme.item.colors.backgroundColor : "#F3F3F3"

            Row {
                anchors.right: parent.right
                anchors.rightMargin: 12
                anchors.verticalCenter: parent.verticalCenter
                spacing: 8

                Rin.Button {
                    text: themeManager.isDark ? "" : ""
                    isFlat: true
                    onClicked: themeManager.toggleTheme()
                    Rin.Icon {
                        anchors.centerIn: parent
                        name: themeManager.isDark ? "ic_fluent_moon_20_regular" : "ic_fluent_weather_sunny_20_regular"
                        size: 16
                        color: themeManager.currentTheme.item ? themeManager.currentTheme.item.colors.textColor : "#1b1b1b"
                    }
                }
            }

            Text {
                anchors.left: parent.left
                anchors.leftMargin: 16
                anchors.verticalCenter: parent.verticalCenter
                text: currentPageIndex === 0 ? qsTr("Home") :
                      currentPageIndex === 1 ? qsTr("Buttons") :
                      currentPageIndex === 2 ? qsTr("Inputs") : qsTr("Settings")
                font.pixelSize: 16
                font.bold: true
                color: themeManager.currentTheme.item ? themeManager.currentTheme.item.colors.textColor : "#1b1b1b"
            }
        }

        // Sidebar and content area
        RowLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: 0

            // Sidebar navigation
            Rectangle {
                Layout.preferredWidth: 220
                Layout.fillHeight: true
                color: themeManager.currentTheme.item ? themeManager.currentTheme.item.colors.cardColor : "#ffffff"

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 8
                    spacing: 4

                    // Navigation items
                    Repeater {
                        model: ListModel {
                            ListElement { title: "Home"; page: "HomePage.qml"; icon: "ic_fluent_home_20_regular" }
                            ListElement { title: "Buttons"; page: "ButtonsPage.qml"; icon: "ic_fluent_button_20_regular" }
                            ListElement { title: "Inputs"; page: "InputsPage.qml"; icon: "ic_fluent_textbox_20_regular" }
                            ListElement { title: "Settings"; page: "SettingsPage.qml"; icon: "ic_fluent_settings_20_regular" }
                        }
                        delegate: Rectangle {
                            width: parent.width - 16
                            height: 40
                            radius: 6
                            color: currentPageIndex === index
                                ? (themeManager.currentTheme.item ? themeManager.currentTheme.item.colors.primaryColor : "#0078D4")
                                : "transparent"

                            Row {
                                anchors.fill: parent
                                anchors.leftMargin: 12
                                spacing: 8
                                anchors.verticalCenter: parent.verticalCenter

                                Rin.Icon {
                                    anchors.verticalCenter: parent.verticalCenter
                                    name: model.icon
                                    size: 16
                                    color: currentPageIndex === index
                                        ? "#ffffff"
                                        : (themeManager.currentTheme.item ? themeManager.currentTheme.item.colors.textColor : "#1b1b1b")
                                }

                                Text {
                                    text: model.title
                                    font.pixelSize: 14
                                    color: currentPageIndex === index
                                        ? "#ffffff"
                                        : (themeManager.currentTheme.item ? themeManager.currentTheme.item.colors.textColor : "#1b1b1b")
                                    anchors.verticalCenter: parent.verticalCenter
                                }
                            }

                            MouseArea {
                                anchors.fill: parent
                                onClicked: {
                                    currentPageIndex = index
                                }
                            }
                        }
                    }

                    Item {
                        Layout.fillHeight: true
                    }
                }
            }

            // Main content area (page view)
            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                color: themeManager.currentTheme.item ? themeManager.currentTheme.item.colors.backgroundColor : "#F3F3F3"

                StackView {
                    id: mainView
                    anchors.fill: parent
                    initialItem: Pages.HomePage {}

                    onCurrentItemChanged: {
                        // Update page title when item changes
                    }
                }
            }
        }
    }

    // Page switching
    onCurrentPageIndexChanged: {
        switch(currentPageIndex) {
        case 0:
            mainView.replace(null, Qt.resolvedUrl("pages/HomePage.qml"));
            break;
        case 1:
            mainView.replace(null, Qt.resolvedUrl("pages/ButtonsPage.qml"));
            break;
        case 2:
            mainView.replace(null, Qt.resolvedUrl("pages/InputsPage.qml"));
            break;
        case 3:
            mainView.replace(null, Qt.resolvedUrl("pages/SettingsPage.qml"));
            break;
        }
    }
}
