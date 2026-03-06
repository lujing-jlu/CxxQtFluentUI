import QtQuick 2.15
import QtQuick.Layouts 1.15
import "../components" as Rin

ControlPage {
    id: page
    title: qsTr("CalendarDatePicker")

    // Intro
    Rin.Text {
        Layout.fillWidth: true
        wrapMode: Text.WordWrap
        text: qsTr("Pick a date from a flyout calendar.")
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Rin.Text {
            text: qsTr("Basic CalendarDatePicker.")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        ControlShowcase {
            width: parent.width
            padding: 18

            RowLayout {
                spacing: 8

                Rin.CalendarDatePicker {
                    id: datePicker
                    useISOWeek: isoSwitch.checked
                    onDateSelected: (d) => {
                        selText.text = qsTr("Selected: %1").arg(Qt.formatDate(d, "yyyy-MM-dd"))
                    }
                }

                Rin.CheckBox {
                    id: isoSwitch
                    text: qsTr("Use ISO Week")
                    checked: true
                }

                Rin.CheckBox {
                    text: qsTr("Show week numbers")
                    checked: datePicker.weekNumbersVisible
                    onToggled: datePicker.weekNumbersVisible = checked
                }

                Rin.Button {
                    text: qsTr("Today")
                    onClicked: datePicker.resetToToday()
                }
            }

            showcase: [
                Rin.Text {
                    id: selText
                    text: qsTr("Selected: none")
                }
            ]
        }
    }

    // Multiple date pickers
    Column {
        Layout.fillWidth: true
        spacing: 4

        Rin.Text {
            text: qsTr("Multiple CalendarDatePickers with different settings.")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        Rin.Frame {
            Layout.fillWidth: true
            padding: 18

            GridLayout {
                columns: 2
                columnSpacing: 16
                rowSpacing: 12
                width: parent.width

                Rin.Text { text: qsTr("Basic:") }
                Rin.CalendarDatePicker { }

                Rin.Text { text: qsTr("With placeholder:") }
                Rin.CalendarDatePicker { placeholderText: qsTr("Select a date") }

                Rin.Text { text: qsTr("ISO week:") }
                Rin.CalendarDatePicker { useISOWeek: true }

                Rin.Text { text: qsTr("Week numbers:") }
                Rin.CalendarDatePicker { weekNumbersVisible: true }
            }
        }
    }
}
