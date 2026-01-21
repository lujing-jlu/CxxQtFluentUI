import QtQuick 2.15
import QtQuick.Layouts 1.15
import "../components" as Rin

ControlPage {
    id: page
    title: qsTr("ProgressRing")

    Text {
        Layout.fillWidth: true
        wrapMode: Text.WordWrap
        text: qsTr("The ProgressRing has two different visual representations: Indeterminate and Determinate.")
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            text: qsTr("Indeterminate")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        ControlShowcase {
            width: parent.width
            showcaseWidth: 320

            Column {
                spacing: 12
                padding: 24

                Rin.ProgressRing {
                    indeterminate: true
                    state: stateModel.get(statePicker.currentIndex).state
                    backgroundColor: colorModel.get(colorPicker.currentIndex).value
                }
            }

            showcase: [
                Text { text: qsTr("State") },
                Rin.ComboBox {
                    id: statePicker
                    model: stateModel
                    textRole: "text"
                    currentIndex: 0
                },
                Text { text: qsTr("Background") },
                Rin.ComboBox {
                    id: colorPicker
                    model: colorModel
                    textRole: "text"
                    currentIndex: 0
                }
            ]
        }
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            text: qsTr("Determinate")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        ControlShowcase {
            width: parent.width
            showcaseWidth: 320

            RowLayout {
                spacing: 12
                Layout.alignment: Qt.AlignVCenter

                Rin.ProgressRing {
                    from: 0
                    to: 100
                    value: progress.value
                    state: stateModel.get(statePicker.currentIndex).state
                    backgroundColor: colorModel2.get(colorPicker2.currentIndex).value
                }

                Text { text: qsTr("Progress") }

                Rin.SpinBox {
                    id: progress
                    from: 0
                    to: 100
                    stepSize: 1
                    value: 50
                }
            }

            showcase: [
                Text { text: qsTr("Background") },
                Rin.ComboBox {
                    id: colorPicker2
                    model: colorModel2
                    textRole: "text"
                    currentIndex: 0
                }
            ]
        }
    }

    ListModel {
        id: stateModel
        ListElement { text: "Running"; state: Rin.ProgressRing.Running }
        ListElement { text: "Paused"; state: Rin.ProgressRing.Paused }
        ListElement { text: "Error"; state: Rin.ProgressRing.Error }
    }

    ListModel {
        id: colorModel
        ListElement { text: "Transparent"; value: "transparent" }
        ListElement { text: "Light Gray"; value: "lightgray" }
    }

    ListModel {
        id: colorModel2
        ListElement { text: "Transparent"; value: "transparent" }
        ListElement { text: "Light Gray"; value: "lightgray" }
    }
}

