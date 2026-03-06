import QtQuick 2.15
import QtQuick.Layouts 1.15
import "../components" as Rin

ControlPage {
    id: page
    title: qsTr("ToggleButton")
    badgeText: qsTr("Extra")

    Text {
        Layout.fillWidth: true
        wrapMode: Text.WordWrap
        text: qsTr("A ToggleButton looks like a Button, but works like a CheckBox. It typically has two states, checked (on) or unchecked (off).")
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            text: qsTr("A simple ToggleButton with text content.")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        ControlShowcase {
            width: parent.width

            Rin.ToggleButton {
                text: qsTr("ToggleButton")
                enabled: !disableSwitch.checked
            }

            showcase: [
                Rin.CheckBox {
                    id: disableSwitch
                    text: qsTr("Disable ToggleButton")
                }
            ]
        }
    }
}
