import QtQuick 2.15
import QtQuick.Layouts 1.15
import "../components" as Rin

DemoPage {
    title: qsTr("MenuBar")
    description: qsTr("Top-level menus.")

    Rin.Frame {
        Layout.fillWidth: true
        Layout.preferredHeight: 48

        Rin.MenuBar {
            anchors.fill: parent

            Rin.Menu {
                title: qsTr("File")
                Rin.MenuItem { text: qsTr("New") }
                Rin.MenuItem { text: qsTr("Open") }
                Rin.MenuSeparator {}
                Rin.MenuItem { text: qsTr("Exit") }
            }

            Rin.Menu {
                title: qsTr("Edit")
                Rin.MenuItem { text: qsTr("Cut") }
                Rin.MenuItem { text: qsTr("Copy") }
                Rin.MenuItem { text: qsTr("Paste") }
            }
        }
    }
}
