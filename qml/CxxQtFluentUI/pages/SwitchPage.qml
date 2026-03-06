import QtQuick 2.15
import QtQuick.Layouts 1.15
import "../components" as Rin

ControlPage {
    id: page
    title: qsTr("Switch")

    Text {
        Layout.fillWidth: true
        wrapMode: Text.WordWrap
        text: qsTr("Use Switch controls to present users with exactly two mutually exclusive options (like on/off), where choosing an option results in an immediate commit.")
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            text: qsTr("A simple Switch.")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        ControlShowcase {
            width: parent.width

            Rin.Switch {
                enabled: !disableSwitch.checked
            }

            showcase: [
                Rin.CheckBox {
                    id: disableSwitch
                    text: qsTr("Disable Switch")
                }
            ]
        }
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            text: qsTr("A Switch controlling an indeterminate ProgressBar.")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        Rin.Frame {
            Layout.fillWidth: true
            height: 120

            padding: 20

            ColumnLayout {
                anchors.fill: parent
                spacing: 16

                Text { text: qsTr("Toggle work") }

                RowLayout {
                    spacing: 32

                    Rin.Switch {
                        id: toggleWorkSwitch
                        checked: true
                        checkedText: qsTr("Working")
                        uncheckedText: qsTr("Do work")
                    }

                    Rin.ProgressBar {
                        Layout.preferredWidth: 220
                        indeterminate: true
                        visible: toggleWorkSwitch.checked
                    }
                }
            }
        }
    }
}
