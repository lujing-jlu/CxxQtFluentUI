import QtQuick 2.15
import QtQuick.Layouts 1.15
import "../components" as Rin

DemoPage {
    title: qsTr("ListView")
    description: qsTr("A styled list view with Fluent-like animations.")

    Rin.ListView {
        Layout.fillWidth: true
        Layout.preferredHeight: 320
        model: [
            qsTr("First item"),
            qsTr("Second item"),
            qsTr("Third item"),
            qsTr("Fourth item"),
            qsTr("Fifth item")
        ]
    }
}
