import QtQuick 2.15
import QtQuick.Layouts 1.15
import "../components" as Rin

ControlPage {
    id: page
    title: qsTr("Button")
    property bool disabled: false

    Text {
        Layout.fillWidth: true
        wrapMode: Text.WordWrap
        text: qsTr("Buttons let people take actions in your app. They can contain text and/or an icon.")
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            text: qsTr("Variants")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        ControlShowcase {
            width: parent.width
            showcaseWidth: 300

            RowLayout {
                spacing: 12
                Rin.Button { text: qsTr("Primary"); isPrimary: true; enabled: !page.disabled }
                Rin.Button { text: qsTr("Standard"); enabled: !page.disabled }
                Rin.Button { text: qsTr("Flat"); isFlat: true; enabled: !page.disabled }
            }

            showcase: [
                Rin.CheckBox {
                    text: qsTr("Disable Buttons")
                    checked: page.disabled
                    onToggled: page.disabled = checked
                }
            ]
        }
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            text: qsTr("With Icon")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        ControlShowcase {
            width: parent.width
            showcaseWidth: 300

            RowLayout {
                spacing: 12
                Rin.Button { text: qsTr("Add"); icon.name: "ic_fluent_add_20_regular"; enabled: !page.disabled }
                Rin.Button { text: qsTr("Search"); icon.name: "ic_fluent_search_20_regular"; enabled: !page.disabled }
            }
        }
    }
}
