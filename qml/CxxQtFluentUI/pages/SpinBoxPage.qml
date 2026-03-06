import QtQuick 2.15
import QtQuick.Layouts 1.15
import "../components" as Rin

ControlPage {
    id: page
    title: qsTr("SpinBox")

    Text {
        Layout.fillWidth: true
        wrapMode: Text.WordWrap
        text: qsTr("A number input control with increment and decrement buttons.")
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            text: qsTr("A default SpinBox (0–100).")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        ControlShowcase {
            width: parent.width

            Rin.SpinBox {
                from: 0
                to: 100
                value: 50
            }
        }
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            text: qsTr("A SpinBox with live value.")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        ControlShowcase {
            width: parent.width
            height: 120

            Rin.SpinBox {
                id: quantitySpinBox
                from: 1
                to: 99
                value: 1
            }

            showcase: [
                Text { text: qsTr("Selected quantity:") },
                Text { text: String(quantitySpinBox.value) }
            ]
        }
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            text: qsTr("A SpinBox with step size.")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        ControlShowcase {
            width: parent.width

            Rin.SpinBox {
                from: 0
                to: 100
                value: 0
                stepSize: 5
            }
        }
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            text: qsTr("A disabled SpinBox.")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        ControlShowcase {
            width: parent.width

            Rin.SpinBox {
                from: 0
                to: 100
                value: 42
                enabled: false
            }
        }
    }
}
