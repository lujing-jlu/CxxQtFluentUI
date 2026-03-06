import QtQuick 2.15
import QtQuick.Layouts 1.15
import "../components" as Rin

ControlPage {
    id: page
    title: qsTr("DropDownButton")
    property bool disabled: false

    Text {
        Layout.fillWidth: true
        wrapMode: Text.WordWrap
        text: qsTr("A button that opens a menu of actions.")
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            text: qsTr("Basic")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        ControlShowcase {
            width: parent.width
            showcaseWidth: 300

            Rin.DropDownButton {
                text: qsTr("Email")
                enabled: !page.disabled

                Rin.MenuItem { text: qsTr("Send") }
                Rin.MenuItem { text: qsTr("Reply") }
                Rin.MenuItem { text: qsTr("Reply All") }
            }

            showcase: [
                Rin.CheckBox {
                    text: qsTr("Disable DropDownButton")
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
            text: qsTr("With Icons")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        Rin.Frame {
            Layout.fillWidth: true

            Rin.DropDownButton {
                iconName: "ic_fluent_mail_20_regular"
                text: qsTr("Email")
                enabled: !page.disabled

                Rin.MenuItem {
                    text: qsTr("Send")
                    icon.name: "ic_fluent_send_20_filled"
                }
                Rin.MenuItem {
                    text: qsTr("Reply")
                    icon.name: "ic_fluent_mail_arrow_up_20_regular"
                }
                Rin.MenuItem {
                    text: qsTr("Reply All")
                    icon.name: "ic_fluent_mail_arrow_double_back_20_regular"
                }
            }
        }
    }
}
