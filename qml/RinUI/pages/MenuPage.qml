import QtQuick 2.15
import QtQuick.Layouts 1.15
import "../components" as Rin

ControlPage {
    id: page
    title: qsTr("Menu")

    Text {
        Layout.fillWidth: true
        wrapMode: Text.WordWrap
        text: qsTr("A Menu displays lightweight commands and is dismissed when clicking outside.")
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            text: qsTr("A menu with MenuItems and MenuSeparator.")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        Rin.Frame {
            Layout.fillWidth: true
            height: 100

            Rin.Button {
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 16
                text: qsTr("Sort")
                isFlat: true
                icon.name: "ic_fluent_arrow_sort_20_regular"
                onClicked: sortMenu.open()
            }

            Rin.Menu {
                id: sortMenu
                Rin.MenuItem { text: qsTr("By rating") }
                Rin.MenuItem { text: qsTr("By match") }
                Rin.MenuItem { text: qsTr("By distance") }
            }
        }
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            text: qsTr("A menu with toggles.")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        Rin.Frame {
            Layout.fillWidth: true
            height: 100

            Rin.Button {
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 16
                text: qsTr("Options")
                onClicked: toggleMenu.open()
            }

            Rin.Menu {
                id: toggleMenu
                Rin.MenuItem { text: qsTr("Reset") }
                Rin.MenuSeparator { }
                Rin.MenuItem { text: qsTr("Repeat"); checkable: true; checked: true }
                Rin.MenuItem { text: qsTr("Shuffle"); checkable: true; checked: false }
            }
        }
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            text: qsTr("A menu with cascading submenus.")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        Rin.Frame {
            Layout.fillWidth: true
            height: 100

            Rin.Button {
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 16
                text: qsTr("File Options")
                onClicked: cascadingMenu.open()
            }

            Rin.Menu {
                id: cascadingMenu
                Rin.MenuItem { text: qsTr("Open") }
                Rin.Menu {
                    title: qsTr("Send to")
                    Rin.MenuItem { text: qsTr("Bluetooth") }
                    Rin.MenuItem { text: qsTr("Desktop (shortcut)") }
                    Rin.Menu {
                        title: qsTr("Compressed file")
                        Rin.MenuItem { text: qsTr("Compress and email") }
                        Rin.MenuItem { text: qsTr("Compress to .7z") }
                        Rin.MenuItem { text: qsTr("Compress to .zip") }
                    }
                }
            }
        }
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            text: qsTr("A menu with icons.")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        Rin.Frame {
            Layout.fillWidth: true
            height: 100

            Rin.Button {
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 16
                text: qsTr("Edit Options")
                onClicked: iconMenu.open()
            }

            Rin.Menu {
                id: iconMenu
                Rin.MenuItem { icon.name: "ic_fluent_share_20_regular"; text: qsTr("Share") }
                Rin.MenuItem { icon.name: "ic_fluent_copy_20_regular"; text: qsTr("Copy") }
                Rin.MenuItem { icon.name: "ic_fluent_delete_20_regular"; text: qsTr("Delete") }
                Rin.MenuSeparator { }
                Rin.MenuItem { text: qsTr("Rename") }
                Rin.MenuItem { text: qsTr("Select") }
            }
        }
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            text: qsTr("A menu with keyboard accelerators (shortcuts).")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        Rin.Frame {
            Layout.fillWidth: true
            height: 100

            Rin.Button {
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 16
                text: qsTr("Shortcuts")
                onClicked: shortcutMenu.open()
            }

            Rin.Menu {
                id: shortcutMenu
                Rin.MenuItem { icon.name: "ic_fluent_share_20_regular"; text: qsTr("Share"); shortcut: "Ctrl+S" }
                Rin.MenuItem { icon.name: "ic_fluent_copy_20_regular"; text: qsTr("Copy"); shortcut: "Ctrl+C" }
                Rin.MenuItem { icon.name: "ic_fluent_delete_20_regular"; text: qsTr("Delete"); shortcut: "Del" }
                Rin.MenuSeparator { }
                Rin.MenuItem { text: qsTr("Rename") }
            }
        }
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            text: qsTr("Radio menu items with MenuItemGroup.")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        Rin.Frame {
            Layout.fillWidth: true
            height: 100

            Rin.MenuItemGroup { id: radioGroup; exclusive: true }

            Rin.Button {
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 16
                text: qsTr("Choose one")
                onClicked: radioMenu.open()
            }

            Rin.Menu {
                id: radioMenu
                Rin.MenuItem { text: qsTr("Option A"); group: radioGroup }
                Rin.MenuItem { text: qsTr("Option B"); group: radioGroup }
                Rin.MenuItem { text: qsTr("Option C"); group: radioGroup }
            }
        }
    }
}

