import QtQuick 2.15
import QtQuick.Layouts 1.15
import "../components" as Rin

ControlPage {
    id: page
    title: qsTr("PillButton")
    badgeText: qsTr("Extra")

    Text {
        Layout.fillWidth: true
        wrapMode: Text.WordWrap
        text: qsTr("A PillButton looks and works like a ToggleButton. It typically has two states, checked (on) or unchecked (off).")
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            text: qsTr("A simple PillButton.")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        ControlShowcase {
            width: parent.width

            Rin.PillButton {
                text: qsTr("PillButton")
                enabled: !disableSwitch.checked
            }

            showcase: [
                Rin.CheckBox {
                    id: disableSwitch
                    text: qsTr("Disable PillButton")
                }
            ]
        }
    }
}
