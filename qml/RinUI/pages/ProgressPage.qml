import QtQuick 2.15
import QtQuick.Layouts 1.15
import "../components" as Rin

ControlPage {
    id: page
    title: qsTr("ProgressBar")

    Text {
        Layout.fillWidth: true
        wrapMode: Text.WordWrap
        text: qsTr("The ProgressBar has two different visual representations: Indeterminate and Determinate.")
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

                Rin.ProgressBar {
                    Layout.fillWidth: true
                    indeterminate: true
                    state: stateModel.get(statePicker.currentIndex).state
                }
            }

            showcase: [
                Text { text: qsTr("State") },
                Rin.ComboBox {
                    id: statePicker
                    model: stateModel
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

        Rin.Frame {
            Layout.fillWidth: true
            padding: 24

            RowLayout {
                spacing: 12

                Rin.ProgressBar {
                    Layout.fillWidth: true
                    from: 0
                    to: 100
                    value: progress.value
                    state: stateModel.get(statePicker.currentIndex).state
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
        }
    }

    ListModel {
        id: stateModel
        ListElement { text: "Running"; state: Rin.ProgressBar.Running }
        ListElement { text: "Paused"; state: Rin.ProgressBar.Paused }
        ListElement { text: "Error"; state: Rin.ProgressBar.Error }
    }
}

