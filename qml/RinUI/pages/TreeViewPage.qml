import QtQuick 2.15
import QtQuick.Layouts 2.15
import "../components" as Rin

DemoPage {
    id: root
    title: qsTr("TreeView")
    description: qsTr("Displays hierarchical data with expandable nodes.")

    property var sampleTree: [
        {
            text: qsTr("Documents"),
            children: [
                { text: qsTr("Invoices"), children: [ { text: qsTr("2024") }, { text: qsTr("2025") } ] },
                { text: qsTr("Reports"), children: [ { text: qsTr("Q1") }, { text: qsTr("Q2") } ] }
            ]
        },
        {
            text: qsTr("Pictures"),
            children: [
                { text: qsTr("Vacation") },
                { text: qsTr("Family") }
            ]
        },
        { text: qsTr("Downloads") }
    ]

    RowLayout {
        Layout.fillWidth: true
        spacing: 8

        Rin.Button {
            text: qsTr("Expand all")
            isFlat: true
            onClicked: tree.expandAll()
        }

        Rin.Button {
            text: qsTr("Collapse all")
            isFlat: true
            onClicked: tree.collapseAll()
        }
    }

    Rin.TreeView {
        id: tree
        Layout.fillWidth: true
        Layout.preferredHeight: 360
        treeModel: root.sampleTree
    }
}

