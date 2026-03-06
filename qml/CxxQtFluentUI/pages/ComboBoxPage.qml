import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../components" as Rin

ControlPage {
    id: page
    title: qsTr("ComboBox")

    Text {
        Layout.fillWidth: true
        wrapMode: Text.WordWrap
        text: qsTr("Use a ComboBox when you need to conserve on-screen space and when users select only one option at a time. A ComboBox shows only the currently selected item.")
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            text: qsTr("A ComboBox with items defined inline.")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        ControlShowcase {
            width: parent.width

            Rin.ComboBox {
                id: comboBox
                width: 200
                model: ["Blue", "Green", "Red", "Yellow"]
                currentIndex: -1
                placeholderText: qsTr("Pick a color")
                enabled: !comboBoxSwitch.checked
            }

            Rectangle {
                width: 100
                height: 30
                color: {
                    if (comboBox.currentIndex === 0) return "#0000FF"
                    if (comboBox.currentIndex === 1) return "#008000"
                    if (comboBox.currentIndex === 2) return "#FF0000"
                    if (comboBox.currentIndex === 3) return "#FFFF00"
                    return "transparent"
                }
            }

            showcase: [
                Rin.CheckBox { id: comboBoxSwitch; text: qsTr("Disable ComboBox") }
            ]
        }
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            text: qsTr("A ComboBox with its Model set.")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        ControlShowcase {
            width: parent.width
            spacing: 12

            Rin.ComboBox {
                id: comboBoxFont
                width: 200
                model: ["Arial", "Comic Sans MS", "Courier New", "Segoe UI", "Times New Roman"]
                currentIndex: 2
                placeholderText: qsTr("Pick a font")
                enabled: !comboBoxFontSwitch.checked
            }

            Text {
                text: qsTr("The quick brown fox jumps over the lazy dog")
                font.family: comboBoxFont.currentText
                font.pixelSize: 14
            }

            showcase: [
                Rin.CheckBox { id: comboBoxFontSwitch; text: qsTr("Disable ComboBox") }
            ]
        }
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            text: qsTr("An editable ComboBox with its Model set.")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        ControlShowcase {
            width: parent.width
            spacing: 12

            ListModel {
                id: sizeModel
                ListElement { value: 8 }
                ListElement { value: 9 }
                ListElement { value: 10 }
                ListElement { value: 11 }
                ListElement { value: 12 }
                ListElement { value: 14 }
                ListElement { value: 16 }
                ListElement { value: 18 }
                ListElement { value: 20 }
                ListElement { value: 24 }
                ListElement { value: 28 }
                ListElement { value: 36 }
                ListElement { value: 48 }
                ListElement { value: 72 }
            }

            Rin.ComboBox {
                id: comboBoxSize
                width: 200
                editable: true
                model: sizeModel
                textRole: "value"
                currentIndex: 2
                placeholderText: qsTr("Pick a size")
                enabled: !comboBoxSizeSwitch.checked

                onAccepted: {
                    if (find(editText) === -1) {
                        const num = Number(editText)
                        if (!isNaN(num)) {
                            sizeModel.append({ value: num })
                        } else {
                            warnDialog.open()
                        }
                    }
                }
            }

            Text {
                font.pixelSize: Number(comboBoxSize.currentText) || 14
                text: qsTr("The quick brown fox jumps over the lazy dog")
            }

            showcase: [
                Rin.CheckBox { id: comboBoxSizeSwitch; text: qsTr("Disable ComboBox") }
            ]
        }
    }

    Dialog {
        id: warnDialog
        modal: true
        standardButtons: Dialog.Ok
        contentItem: Text {
            width: 320
            wrapMode: Text.WordWrap
            text: qsTr("The font size must be a number.")
        }
    }
}

