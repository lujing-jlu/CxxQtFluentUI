import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../components" as Rin

ControlPage {
    id: page
    title: qsTr("RadioButton")
    Text {
        Layout.fillWidth: true
        wrapMode: Text.WordWrap
        text: qsTr("Use RadioButtons to let a user choose between mutually exclusive, related options. Generally contained within a RadioButtons group.")
    }

    ButtonGroup { id: group }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            text: qsTr("A group of RadioButton controls.")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        ControlShowcase {
            width: parent.width

            Rin.RadioButton { text: qsTr("Option 1"); checked: true; ButtonGroup.group: group; enabled: !disableSwitch.checked }
            Rin.RadioButton { text: qsTr("Option 2"); ButtonGroup.group: group; enabled: !disableSwitch.checked }
            Rin.RadioButton { text: qsTr("Option 3"); ButtonGroup.group: group; enabled: !disableSwitch.checked }

            showcase: [
                Rin.CheckBox {
                    id: disableSwitch
                    text: qsTr("Disable RadioButtons")
                }
            ]
        }
    }
}
