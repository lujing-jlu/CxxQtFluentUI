import QtQuick 2.15
import QtQuick.Layouts 1.15
import "../components" as Rin

ControlPage {
    id: page
    title: qsTr("RoundButton")
    property bool disabled: false

    Text {
        Layout.fillWidth: true
        wrapMode: Text.WordWrap
        text: qsTr("A RoundButton looks like a Button, except that it has a radius property which allows the corners to be rounded without customizing the background.")
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            text: qsTr("A simple RoundButton.")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        ControlShowcase {
            width: parent.width
            showcaseWidth: 300

            Rin.RoundButton {
                text: qsTr("RoundButton")
                enabled: !page.disabled
            }

            showcase: [
                Rin.CheckBox {
                    text: qsTr("Disable Button")
                    checked: page.disabled
                    onToggled: page.disabled = checked
                }
            ]
        }
    }
}
