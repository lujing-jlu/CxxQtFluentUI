import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../components" as Rin

DemoPage {
    title: qsTr("SelectorBar")
    description: qsTr("A tab-like selection control.")

    ColumnLayout {
        spacing: 12

        Rin.SelectorBar {
            id: bar
            currentIndex: 0

            Rin.SelectorBarItem { text: qsTr("One") }
            Rin.SelectorBarItem { text: qsTr("Two") }
            Rin.SelectorBarItem { text: qsTr("Three") }
        }

        Text { text: qsTr("Current index: %1").arg(bar.currentIndex) }
    }
}
