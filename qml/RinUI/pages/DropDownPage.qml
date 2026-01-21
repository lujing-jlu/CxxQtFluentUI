import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../components" as Rin

Item {
    id: root
    property var navigationView: null

    property var colors: themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors : null
    property var typography: themeManager.currentTheme ? themeManager.currentTheme.typography : null

    property string title: qsTr("Drop Down Button")

    ScrollView {
        anchors.fill: parent
        anchors.margins: 20
        clip: true

        Column {
            width: parent.width
            spacing: 24

            // Title
            Text {
                text: qsTr("Drop Down Button")
                font.pixelSize: 28
                font.weight: Font.Medium
                color: colors ? colors.textColor : "#1b1b1b"
            }

            // Description
            Text {
                width: parent.width
                text: qsTr("DropDownButtons display a menu of commands when clicked.")
                font.pixelSize: 14
                color: colors ? colors.textColor : "#1b1b1b"
                wrapMode: Text.WordWrap
            }

            // Basic DropDownButton
            Column {
                width: parent.width
                spacing: 16

                Text {
                    text: qsTr("Basic DropDownButton")
                    font.pixelSize: 18
                    font.weight: Font.Medium
                    color: colors ? colors.textColor : "#1b1b1b"
                }

                Rin.DropDownButton {
                    id: basicDropDown
                    text: qsTr("Options")

                    Rin.MenuItem {
                        text: qsTr("Option 1")
                        onTriggered: console.log("Option 1 selected")
                    }

                    Rin.MenuItem {
                        text: qsTr("Option 2")
                        onTriggered: console.log("Option 2 selected")
                    }

                    Rin.MenuItem {
                        text: qsTr("Option 3")
                        onTriggered: console.log("Option 3 selected")
                    }
                }
            }

            // Multiple DropDownButtons
            Column {
                width: parent.width
                spacing: 16

                Text {
                    text: qsTr("Multiple DropDownButtons")
                    font.pixelSize: 18
                    font.weight: Font.Medium
                    color: colors ? colors.textColor : "#1b1b1b"
                }

                Row {
                    spacing: 12

                    Rin.DropDownButton {
                        text: qsTr("File")

                        Rin.MenuItem {
                            text: qsTr("New")
                        }

                        Rin.MenuItem {
                            text: qsTr("Open")
                        }

                        Rin.MenuItem {
                            text: qsTr("Save")
                        }

                        Rin.MenuSeparator {}

                        Rin.MenuItem {
                            text: qsTr("Exit")
                        }
                    }

                    Rin.DropDownButton {
                        text: qsTr("Edit")

                        Rin.MenuItem {
                            text: qsTr("Cut")
                        }

                        Rin.MenuItem {
                            text: qsTr("Copy")
                        }

                        Rin.MenuItem {
                            text: qsTr("Paste")
                        }
                    }

                    Rin.DropDownButton {
                        text: qsTr("View")

                        Rin.MenuItem {
                            text: qsTr("Zoom In")
                        }

                        Rin.MenuItem {
                            text: qsTr("Zoom Out")
                        }

                        Rin.MenuItem {
                            text: qsTr("Reset")
                        }
                    }
                }
            }

            // Primary Style
            Column {
                width: parent.width
                spacing: 16

                Text {
                    text: qsTr("Primary Style")
                    font.pixelSize: 18
                    font.weight: Font.Medium
                    color: colors ? colors.textColor : "#1b1b1b"
                }

                Rin.DropDownButton {
                    text: qsTr("Primary Action")
                    isPrimary: true

                    Rin.MenuItem {
                        text: qsTr("Action 1")
                    }

                    Rin.MenuItem {
                        text: qsTr("Action 2")
                    }
                }
            }
        }
    }
}
