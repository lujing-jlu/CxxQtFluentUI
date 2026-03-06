import QtQuick 2.15
import QtQuick.Layouts 1.15
import "../components" as Rin

ControlPage {
    id: page
    title: qsTr("ProgressBar")

    Rin.Text {
        Layout.fillWidth: true
        wrapMode: Text.WordWrap
        text: qsTr(
            "The ProgressBar has two different visual representations:\n" +
            "Indeterminate - shows that a task is ongoing, but doesn't block user interaction.\n" +
            "Determinate - shows how much progress has been made on a known amount of work."
        )
    }

    Rin.Text {
        typography: Rin.Typography.BodyStrong
        text: qsTr("An indeterminate ProgressBar.")
    }

    ControlShowcase {
        Layout.fillWidth: true

        Column {
            width: parent.width
            padding: 36
            spacing: 4

            Rin.ProgressBar {
                width: parent.width
                indeterminate: true
                state: stateModel.get(statePicker.currentIndex).state
            }
        }

        showcase: [
            Rin.Text { text: qsTr("State") },
            Rin.ComboBox {
                id: statePicker
                model: stateModel
                textRole: "text"
                currentIndex: 0
            }
        ]
    }

    Rin.Text {
        typography: Rin.Typography.BodyStrong
        text: qsTr("A determinate ProgressBar.")
    }

    Rin.Frame {
        Layout.fillWidth: true
        padding: 24

        RowLayout {
            spacing: 8

            Rin.ProgressBar {
                Layout.fillWidth: true
                from: 0
                to: 100
                value: progress.value
                state: stateModel.get(statePicker.currentIndex).state
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
    }

    ListModel {
        id: stateModel
        ListElement { text: "Running"; state: Rin.ProgressBar.Running }
        ListElement { text: "Paused"; state: Rin.ProgressBar.Paused }
        ListElement { text: "Error"; state: Rin.ProgressBar.Error }
    }
}
