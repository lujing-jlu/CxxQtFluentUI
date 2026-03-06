import QtQuick 2.15
import QtQuick.Layouts 1.15
import "../components" as Rin

ControlPage {
    id: page
    title: qsTr("TextField")

    Text {
        Layout.fillWidth: true
        wrapMode: Text.WordWrap
        text: qsTr("A text input control for user input.")
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            text: qsTr("A default TextField.")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        ControlShowcase {
            width: parent.width

            Rin.TextField {
                width: 260
                placeholderText: qsTr("Enter text here…")
            }
        }
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            text: qsTr("A TextField with live preview.")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        ControlShowcase {
            width: parent.width
            height: 140

            Rin.TextField {
                id: nameTextField
                width: 260
                placeholderText: qsTr("Enter your name")
            }

            showcase: [
                Text { text: qsTr("You entered:") },
                Text {
                    width: parent ? parent.width : 160
                    wrapMode: Text.WordWrap
                    text: nameTextField.text.length ? nameTextField.text : qsTr("(empty)")
                }
            ]
        }
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            text: qsTr("A disabled TextField.")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        ControlShowcase {
            width: parent.width

            Rin.TextField {
                width: 260
                enabled: false
                text: qsTr("Disabled text field")
            }
        }
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            text: qsTr("A password TextField.")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        ControlShowcase {
            width: parent.width

            Rin.TextField {
                width: 260
                placeholderText: qsTr("Enter password")
                echoMode: TextInput.Password
            }
        }
    }
}
