import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import FluentUI 1.0

Window {
    id: window
    width: 1000
    height: 700
    minimumWidth: 600
    minimumHeight: 400
    visible: true
    title: "CxxQtFluentUI"

    // Theme colors
    readonly property int darkModeLight: 1
    readonly property int darkModeDark: 2

    property int darkMode: darkModeLight
    readonly property bool isDark: darkMode === darkModeDark

    // Light theme colors
    readonly property color primaryColor: "#0060DF"
    readonly property color backgroundColor: "#FFFFFF"
    readonly property color windowBackgroundColor: "#EDEDED"
    readonly property color fontPrimaryColor: "#070707"
    readonly property color fontSecondaryColor: "#666666"
    readonly property color fontTertiaryColor: "#999999"

    // Dark theme colors
    readonly property color darkPrimaryColor: "#1850CE"
    readonly property color darkBackgroundColor: "#000000"
    readonly property color darkWindowBackgroundColor: "#202020"
    readonly property color darkFontPrimaryColor: "#F8F8F8"
    readonly property color darkFontSecondaryColor: "#DEDEDE"
    readonly property color darkFontTertiaryColor: "#C8C8C8"

    // Get colors based on theme
    function getPrimaryColor() { return isDark ? darkPrimaryColor : primaryColor }
    function getBackgroundColor() { return isDark ? darkBackgroundColor : backgroundColor }
    function getWindowBackgroundColor() { return isDark ? darkWindowBackgroundColor : windowBackgroundColor }
    function getFontPrimaryColor() { return isDark ? darkFontPrimaryColor : fontPrimaryColor }
    function getFontSecondaryColor() { return isDark ? darkFontSecondaryColor : fontSecondaryColor }
    function getFontTertiaryColor() { return isDark ? darkFontTertiaryColor : fontTertiaryColor }

    // Main layout
    RowLayout {
        anchors.fill: parent
        spacing: 0

        // Navigation sidebar
        Rectangle {
            Layout.preferredWidth: 240
            Layout.fillHeight: true
            color: getWindowBackgroundColor()

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 10
                spacing: 5

                // Logo area
                Text {
                    text: "CxxQtFluentUI"
                    font.pixelSize: 18
                    font.bold: true
                    color: getFontPrimaryColor()
                    Layout.margins: 10
                }

                Rectangle {
                    Layout.fillWidth: true
                    height: 1
                    color: isDark ? "#404040" : "#E0E0E0"
                }

                // Navigation items
                Repeater {
                    model: ListModel {
                        ListElement { title: "Home"; icon: "Home" }
                        ListElement { title: "Buttons"; icon: "Button" }
                        ListElement { title: "Inputs"; icon: "TextBox" }
                        ListElement { title: "Navigation"; icon: "Navigation" }
                    }
                    delegate: ItemDelegate {
                        width: parent.width
                        height: 40
                        contentItem: Row {
                            spacing: 10
                            Text {
                                text: model.title
                                font.pixelSize: 14
                                color: window.getFontPrimaryColor()
                                anchors.verticalCenter: parent.verticalCenter
                            }
                        }
                        background: Rectangle {
                            color: "transparent"
                        }
                        onClicked: {
                            console.log("Clicked:", model.title)
                        }
                    }
                }

                Item {
                    Layout.fillHeight: true
                }

                // Theme toggle at bottom
                Button {
                    text: isDark ? "Light Mode" : "Dark Mode"
                    onClicked: {
                        darkMode = isDark ? darkModeLight : darkModeDark
                    }
                    Layout.fillWidth: true
                }
            }
        }

        // Main content area
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: getBackgroundColor()

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 20
                spacing: 20

                // Title
                Text {
                    text: "Welcome to CxxQtFluentUI"
                    font.pixelSize: 28
                    font.bold: true
                    color: getFontPrimaryColor()
                }

                // Info cards
                RowLayout {
                    spacing: 20
                    Layout.fillWidth: true

                    // Platform info card
                    Rectangle {
                        width: 200
                        height: 100
                        color: getWindowBackgroundColor()
                        radius: 8
                        Layout.fillWidth: false

                        Column {
                            anchors.centerIn: parent
                            Text {
                                text: "Platform"
                                font.pixelSize: 14
                                color: getFontSecondaryColor()
                            }
                            Text {
                                text: FluTools.is_macos ? "macOS" : (FluTools.is_windows ? "Windows" : "Linux")
                                font.pixelSize: 24
                                font.bold: true
                                color: getPrimaryColor()
                            }
                        }
                    }

                    // Dark mode card
                    Rectangle {
                        width: 200
                        height: 100
                        color: getWindowBackgroundColor()
                        radius: 8
                        Layout.fillWidth: false

                        Column {
                            anchors.centerIn: parent
                            Text {
                                text: "Theme"
                                font.pixelSize: 14
                                color: getFontSecondaryColor()
                            }
                            Text {
                                text: isDark ? "Dark" : "Light"
                                font.pixelSize: 24
                                font.bold: true
                                color: getPrimaryColor()
                            }
                        }
                    }
                }

                Item {
                    Layout.fillHeight: true
                }
            }
        }
    }
}
