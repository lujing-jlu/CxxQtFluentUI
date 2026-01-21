import QtQuick 2.15
import QtQuick.Layouts 1.15
import "../components" as Rin

DemoPage {
    title: qsTr("Iconography")
    description: qsTr("Fluent icons used by RinUI components.")

    GridLayout {
        columns: 6
        columnSpacing: 12
        rowSpacing: 12
        Layout.fillWidth: true

        Repeater {
            model: [
                "ic_fluent_home_20_regular",
                "ic_fluent_settings_20_regular",
                "ic_fluent_search_20_regular",
                "ic_fluent_add_20_regular",
                "ic_fluent_delete_20_regular",
                "ic_fluent_checkmark_20_regular",
                "ic_fluent_dismiss_20_regular",
                "ic_fluent_info_20_regular",
                "ic_fluent_warning_20_regular",
                "ic_fluent_calendar_20_regular",
                "ic_fluent_clock_20_regular",
                "ic_fluent_navigation_20_regular"
            ]
            delegate: Rin.Frame {
                Layout.fillWidth: true
                Layout.preferredHeight: 72

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 12
                    spacing: 6

                    Rin.Icon {
                        Layout.alignment: Qt.AlignHCenter
                        size: 22
                        name: modelData
                    }
                    Text {
                        Layout.fillWidth: true
                        font.pixelSize: 10
                        horizontalAlignment: Text.AlignHCenter
                        text: modelData
                        elide: Text.ElideRight
                    }
                }
            }
        }
    }
}
