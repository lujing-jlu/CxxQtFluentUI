import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../themes"
import "../components" as Rin

ScrollView {
    id: root
    Layout.fillWidth: true
    Layout.fillHeight: true
    clip: true
    contentWidth: availableWidth

    ColumnLayout {
        width: parent.width
        spacing: 24

        // Header
        ColumnLayout {
            Layout.fillWidth: true
            Layout.margins: 40
            spacing: 8

            Text {
                text: "Menu"
                font.pixelSize: 32
                font.weight: Font.Bold
                color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
            }

            Text {
                text: "Context menus and dropdown options"
                font.pixelSize: 14
                color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.textSecondaryColor : "#6c6c6c"
            }
        }

        // Context Menu
        ColumnLayout {
            Layout.fillWidth: true
            Layout.leftMargin: 40
            Layout.rightMargin: 40
            spacing: 16

            Text {
                text: "Context Menu (Right Click)"
                font.pixelSize: 18
                font.weight: Font.Medium
                color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 150
                radius: 8
                color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.cardColor : "#ffffff"
                border.width: 1
                border.color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.cardBorderColor : "#e5e5e5"

                Text {
                    anchors.centerIn: parent
                    text: "Right-click anywhere here to open context menu"
                    font.pixelSize: 14
                    color: themeManager.currentTheme && themeManager.currentTheme.colors
                        ? themeManager.currentTheme.colors.textSecondaryColor : "#6c6c6c"
                }

                Rin.ContextMenu {
                    id: contextMenu

                    Rin.MenuItem {
                        text: "New"
                        icon.name: "ic_fluent_add_20_regular"
                        onTriggered: console.log("New clicked")
                    }

                    Rin.MenuItem {
                        text: "Open"
                        icon.name: "ic_fluent_folder_open_20_regular"
                        onTriggered: console.log("Open clicked")
                    }

                    Rin.MenuSeparator {}

                    Rin.MenuItem {
                        text: "Save"
                        icon.name: "ic_fluent_save_20_regular"
                        onTriggered: console.log("Save clicked")
                    }

                    Rin.MenuItem {
                        text: "Save As..."
                        onTriggered: console.log("Save As clicked")
                    }

                    Rin.MenuSeparator {}

                    Rin.MenuItem {
                        text: "Exit"
                        icon.name: "ic_fluent_arrow_exit_20_regular"
                        onTriggered: console.log("Exit clicked")
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    acceptedButtons: Qt.RightButton
                    onClicked: contextMenu.popup()
                }
            }
        }

        // Dropdown Menus
        ColumnLayout {
            Layout.fillWidth: true
            Layout.leftMargin: 40
            Layout.rightMargin: 40
            spacing: 16

            Text {
                text: "Dropdown Buttons"
                font.pixelSize: 18
                font.weight: Font.Medium
                color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
            }

            RowLayout {
                Layout.fillWidth: true
                spacing: 16

                ColumnLayout {
                    Layout.fillWidth: true
                    spacing: 8

                    Text {
                        text: "Standard Menu"
                        font.pixelSize: 12
                        color: themeManager.currentTheme && themeManager.currentTheme.colors
                            ? themeManager.currentTheme.colors.textSecondaryColor : "#6c6c6c"
                    }

                    Rin.Button {
                        text: "File Menu"

                        onClicked: fileMenu.open()

                        Rin.Menu {
                            id: fileMenu

                            y: parent.height

                            Rin.MenuItem {
                                text: "New"
                                shortcut: "Ctrl+N"
                                icon.name: "ic_fluent_add_20_regular"
                                onTriggered: console.log("New")
                            }

                            Rin.MenuItem {
                                text: "Open"
                                shortcut: "Ctrl+O"
                                icon.name: "ic_fluent_folder_open_20_regular"
                                onTriggered: console.log("Open")
                            }

                            Rin.MenuSeparator {}

                            Rin.MenuItem {
                                text: "Save"
                                shortcut: "Ctrl+S"
                                onTriggered: console.log("Save")
                            }
                        }
                    }
                }

                ColumnLayout {
                    Layout.fillWidth: true
                    spacing: 8

                    Text {
                        text: "Icon Menu"
                        font.pixelSize: 12
                        color: themeManager.currentTheme && themeManager.currentTheme.colors
                            ? themeManager.currentTheme.colors.textSecondaryColor : "#6c6c6c"
                    }

                    Rin.Button {
                        text: "Options"

                        onClicked: optionsMenu.open()

                        Rin.Menu {
                            id: optionsMenu
                            y: parent.height

                            Rin.MenuItem {
                                text: "Settings"
                                icon.name: "ic_fluent_settings_20_regular"
                                onTriggered: console.log("Settings")
                            }

                            Rin.MenuItem {
                                text: "Preferences"
                                icon.name: "ic_fluent_slash_20_regular"
                                onTriggered: console.log("Preferences")
                            }

                            Rin.MenuSeparator {}

                            Rin.MenuItem {
                                text: "Help"
                                icon.name: "ic_fluent_question_20_regular"
                                onTriggered: console.log("Help")
                            }
                        }
                    }
                }
            }
        }

        // Menu with Radio Items
        ColumnLayout {
            Layout.fillWidth: true
            Layout.leftMargin: 40
            Layout.rightMargin: 40
            spacing: 16

            Text {
                text: "Menu with Radio Items"
                font.pixelSize: 18
                font.weight: Font.Medium
                color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 200
                radius: 8
                color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.cardColor : "#ffffff"
                border.width: 1
                border.color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.cardBorderColor : "#e5e5e5"

                ColumnLayout {
                    anchors.centerIn: parent
                    spacing: 16

                    Text {
                        text: "Select View Mode"
                        font.pixelSize: 14
                        color: themeManager.currentTheme && themeManager.currentTheme.colors
                            ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
                    }

                    Rin.Button {
                        text: "View Options"

                        onClicked: viewMenu.open()

                        Rin.MenuItemGroup {
                            id: viewGroup
                            exclusive: true
                        }

                        Rin.Menu {
                            id: viewMenu
                            y: parent.height

                            Rin.MenuItem {
                                text: "List View"
                                checkable: true
                                checked: true
                                group: viewGroup
                                onTriggered: console.log("List View")
                            }

                            Rin.MenuItem {
                                text: "Grid View"
                                checkable: true
                                group: viewGroup
                                onTriggered: console.log("Grid View")
                            }

                            Rin.MenuItem {
                                text: "Detail View"
                                checkable: true
                                group: viewGroup
                                onTriggered: console.log("Detail View")
                            }
                        }
                    }
                }
            }
        }

        // Menu Bar
        ColumnLayout {
            Layout.fillWidth: true
            Layout.leftMargin: 40
            Layout.rightMargin: 40
            Layout.bottomMargin: 40
            spacing: 16

            Text {
                text: "Menu Bar"
                font.pixelSize: 18
                font.weight: Font.Medium
                color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 200
                radius: 8
                color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.cardColor : "#ffffff"
                border.width: 1
                border.color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.cardBorderColor : "#e5e5e5"

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 16
                    spacing: 16

                    Text {
                        text: "Application Menu Bar"
                        font.pixelSize: 14
                        color: themeManager.currentTheme && themeManager.currentTheme.colors
                            ? themeManager.currentTheme.colors.textSecondaryColor : "#6c6c6c"
                    }

                    Rin.MenuBar {
                        Layout.fillWidth: true

                        Rin.Menu {
                            title: "File"

                            Rin.MenuItem {
                                text: "New"
                                onTriggered: console.log("New")
                            }

                            Rin.MenuItem {
                                text: "Open"
                                onTriggered: console.log("Open")
                            }

                            Rin.MenuItem {
                                text: "Save"
                                onTriggered: console.log("Save")
                            }

                            Rin.MenuSeparator {}

                            Rin.MenuItem {
                                text: "Exit"
                                onTriggered: console.log("Exit")
                            }
                        }

                        Rin.Menu {
                            title: "Edit"

                            Rin.MenuItem {
                                text: "Undo"
                                shortcut: "Ctrl+Z"
                                onTriggered: console.log("Undo")
                            }

                            Rin.MenuItem {
                                text: "Redo"
                                shortcut: "Ctrl+Y"
                                onTriggered: console.log("Redo")
                            }

                            Rin.MenuSeparator {}

                            Rin.MenuItem {
                                text: "Cut"
                                shortcut: "Ctrl+X"
                                onTriggered: console.log("Cut")
                            }

                            Rin.MenuItem {
                                text: "Copy"
                                shortcut: "Ctrl+C"
                                onTriggered: console.log("Copy")
                            }

                            Rin.MenuItem {
                                text: "Paste"
                                shortcut: "Ctrl+V"
                                onTriggered: console.log("Paste")
                            }
                        }

                        Rin.Menu {
                            title: "View"

                            Rin.MenuItem {
                                text: "Zoom In"
                                onTriggered: console.log("Zoom In")
                            }

                            Rin.MenuItem {
                                text: "Zoom Out"
                                onTriggered: console.log("Zoom Out")
                            }

                            Rin.MenuItem {
                                text: "Reset Zoom"
                                onTriggered: console.log("Reset Zoom")
                            }
                        }

                        Rin.Menu {
                            title: "Help"

                            Rin.MenuItem {
                                text: "Documentation"
                                onTriggered: console.log("Documentation")
                            }

                            Rin.MenuItem {
                                text: "About"
                                onTriggered: console.log("About")
                            }
                        }
                    }
                }
            }
        }
    }
}
