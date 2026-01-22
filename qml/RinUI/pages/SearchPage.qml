import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../windows"
import "../themes"
import "../utils"
import "../components" as Rin

FluentPage {
    id: page
    title: qsTr("Search")

    property string query: ""

    header: Rin.Frame {
        width: parent.width
        height: 48

        RowLayout {
            anchors.fill: parent

            Rin.SelectorBar {
                Layout.fillHeight: true
                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
                Rin.SelectorBarItem {
                    text: qsTr("All")
                    checked: true
                }
            }
        }
    }

    // Content grid
    Grid {
        Layout.fillWidth: true
        columns: Math.floor(width / (360 + 6))
        rowSpacing: 12
        columnSpacing: 12
        layoutDirection: GridLayout.LeftToRight

        Repeater {
            model: ItemData.getItemsByTitle(query)
            delegate: ControlClip { }
        }
    }
}
