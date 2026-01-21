import QtQuick 2.15
import QtQuick.Layouts 1.15
import "../components" as Rin

ControlPage {
    id: page
    title: qsTr("Popup")

    Text {
        Layout.fillWidth: true
        wrapMode: Text.WordWrap
        text: qsTr("The Popup control allows your app to display temporary content above other UI elements.")
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            text: qsTr("A simple Popup")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        ControlShowcase {
            width: parent.width
            showcaseWidth: 320

            Rin.Button {
                id: openBtn
                text: qsTr("Open Popup")
                onClicked: popup.open()

                Rin.Popup {
                    id: popup
                    anchorItem: openBtn
                    position: positionModel.get(positionPicker.currentIndex).pos
                    modal: modalSwitch.checked
                    padding: 16

                    ColumnLayout {
                        spacing: 10
                        Text { text: qsTr("Hello from Popup") }
                        Rin.Button { text: qsTr("Close"); isPrimary: true; onClicked: popup.close() }
                    }
                }
            }

            showcase: [
                Text { text: qsTr("Position") },
                Rin.ComboBox {
                    id: positionPicker
                    model: positionModel
                    textRole: "text"
                    currentIndex: 1
                },
                Rin.CheckBox {
                    id: modalSwitch
                    text: qsTr("Enable modal")
                }
            ]
        }
    }

    ListModel {
        id: positionModel
        ListElement { text: "Top"; pos: Rin.Position.Top }
        ListElement { text: "Bottom"; pos: Rin.Position.Bottom }
        ListElement { text: "Left"; pos: Rin.Position.Left }
        ListElement { text: "Center"; pos: Rin.Position.Center }
        ListElement { text: "Right"; pos: Rin.Position.Right }
    }
}

