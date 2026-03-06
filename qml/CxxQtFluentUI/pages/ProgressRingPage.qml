import QtQuick 2.15
import QtQuick.Layouts 1.15
import "../components" as Rin

ControlPage {
    id: page
    title: qsTr("ProgressRing")

    Rin.Text {
        Layout.fillWidth: true
        wrapMode: Text.WordWrap
        text: qsTr(
            "The ProgressRing has two different visual representations:\n" +
            "Indeterminate - shows that a task is ongoing, but doesn't block user interaction.\n" +
            "Determinate - shows how much progress has been made on a known amount of work."
        )
    }

    Rin.Text {
        typography: Rin.Typography.BodyStrong
        text: qsTr("An indeterminate ProgressRing.")
    }

    ControlShowcase {
        Layout.fillWidth: true

        Column {
            width: parent.width
            padding: 36
            spacing: 4

            Rin.ProgressRing {
                indeterminate: true
                state: stateModel.get(statePicker.currentIndex).state
                backgroundColor: colorPicker.currentIndex >= 0
                    ? colorModel.get(colorPicker.currentIndex).value
                    : "transparent"
            }
        }

        showcase: [
            Rin.Text { text: qsTr("State") },
            Rin.ComboBox {
                id: statePicker
                model: stateModel
                textRole: "text"
                currentIndex: 0
            },
            Rin.Text { text: qsTr("Background Color") },
            Rin.ComboBox {
                id: colorPicker
                model: colorModel
                textRole: "text"
                currentIndex: -1
                placeholderText: qsTr("Pick a color")
            }
        ]
    }

    Rin.Text {
        typography: Rin.Typography.BodyStrong
        text: qsTr("A determinate ProgressRing.")
    }

    ControlShowcase {
        Layout.fillWidth: true
        padding: 24

        RowLayout {
            spacing: 8

            Rin.ProgressRing {
                from: 0
                to: 100
                value: progress.value
                state: stateModel.get(statePicker.currentIndex).state
                backgroundColor: colorPicker2.currentIndex >= 0
                    ? colorModel2.get(colorPicker2.currentIndex).value
                    : "transparent"
            }

            Item { width: 16 }

            Rin.Text { text: qsTr("Progress") }

            Rin.SpinBox {
                id: progress
                from: 0
                to: 100
                stepSize: 1
                value: 50
            }
        }

        showcase: [
            Rin.Text { text: qsTr("Background Color") },
            Rin.ComboBox {
                id: colorPicker2
                model: colorModel2
                textRole: "text"
                currentIndex: -1
                placeholderText: qsTr("Pick a color")
            }
        ]
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
