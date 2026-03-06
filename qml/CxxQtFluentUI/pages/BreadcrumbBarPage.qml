import QtQuick 2.15
import QtQuick.Layouts 2.15
import "../components" as Rin

DemoPage {
    id: root
    title: qsTr("BreadcrumbBar")
    description: qsTr("Shows the current location within a hierarchical structure.")

    property var pathModel: [
        { text: qsTr("Home"), icon: "ic_fluent_home_20_regular" },
        { text: qsTr("Library"), icon: "ic_fluent_library_20_regular" },
        { text: qsTr("Documents"), icon: "ic_fluent_document_20_regular" },
        { text: qsTr("Report.pdf"), icon: "ic_fluent_document_20_regular" }
    ]

    Rin.Frame {
        Layout.fillWidth: true
        padding: 12

        ColumnLayout {
            anchors.fill: parent
            spacing: 12

            Rin.BreadcrumbBar {
                Layout.fillWidth: true
                model: root.pathModel
                onCrumbClicked: function(i) {
                    // Trim to clicked location to mimic navigation.
                    root.pathModel = root.pathModel.slice(0, i + 1)
                }
            }

            RowLayout {
                Layout.fillWidth: true
                spacing: 8

                Rin.Button {
                    text: qsTr("Go deeper")
                    onClicked: {
                        const next = qsTr("Level %1").arg(root.pathModel.length + 1)
                        root.pathModel = root.pathModel.concat([{ text: next, icon: "ic_fluent_folder_20_regular" }])
                    }
                }

                Rin.Button {
                    text: qsTr("Reset")
                    isFlat: true
                    onClicked: root.pathModel = root.pathModel.slice(0, 1)
                }
            }
        }
    }
}

