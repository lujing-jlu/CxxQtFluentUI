import QtQuick 2.15
import QtQuick.Layouts 1.15
import Qt.labs.qmlmodels 1.0
import "../components" as Rin

DemoPage {
    title: qsTr("TableView")
    description: qsTr("A styled table view for tabular data.")

    TableModel {
        id: model
        TableModelColumn { display: "name" }
        TableModelColumn { display: "value" }
        rows: [
            { "name": qsTr("Alpha"), "value": "1" },
            { "name": qsTr("Beta"), "value": "2" },
            { "name": qsTr("Gamma"), "value": "3" }
        ]
    }

    Rin.TableView {
        Layout.fillWidth: true
        Layout.preferredHeight: 220
        model: model
    }
}
