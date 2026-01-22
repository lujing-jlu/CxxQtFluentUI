import QtQuick 2.15
import QtQuick.Layouts 1.15
import "../components" as Rin

ControlPage {
    id: page
    title: qsTr("Calendar")

    // Format date helper
    function fmtDate(d) {
        if (!d) return ""
        const y = d.getFullYear()
        const m = ("0" + (d.getMonth() + 1)).slice(-2)
        const day = ("0" + d.getDate()).slice(-2)
        return y + "-" + m + "-" + day
    }

    // Intro
    Rin.Text {
        Layout.fillWidth: true
        wrapMode: Text.WordWrap
        text: qsTr(
            "Calendar shows a month grid with Mon-first toggle. " +
            "Supports selecting a single date, and clicking twice to select a range, " +
            "and marking dates as highlighted or disabled."
        )
    }

    // Simple Calendar demo
    Column {
        Layout.fillWidth: true
        spacing: 4

        Rin.Text {
            text: qsTr("A basic Calendar.")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        ControlShowcase {
            width: parent.width
            padding: 18

            Rin.Calendar {
                id: cal1
                useISOWeek: isoSwitch.checked
                selectionMode: modeSwitch.checked ? "range" : "single"
            }

            showcase: [
                Rin.CheckBox {
                    id: isoSwitch
                    text: qsTr("Use ISO Week")
                    checked: true
                },
                Rin.Switch {
                    id: modeSwitch
                    checkedText: qsTr("Range")
                    uncheckedText: qsTr("Single")
                    onToggled: {
                        cal1.selectionMode = checked ? "range" : "single"
                        if (!checked) {
                            cal1.rangeStart = null
                            cal1.rangeEnd = null
                        }
                    }
                },
                Rin.Button {
                    text: qsTr("Today")
                    onClicked: cal1.resetToToday()
                },
                Rin.Button {
                    text: qsTr("Highlight Today")
                    onClicked: cal1.highlightedDates = [new Date()]
                },
                Rin.Button {
                    text: qsTr("Disable 1st and 15th")
                    onClicked: {
                        const y = cal1.displayYear
                        const m = cal1.displayMonth - 1
                        cal1.disabledDates = [new Date(y, m, 1), new Date(y, m, 15)]
                    }
                },
                Rin.Text {
                    id: selText
                    text: qsTr("Selected: none")
                },
                Rin.Text { text: qsTr("Minimum Date") },
                Rin.CalendarDatePicker {
                    onDateSelected: function(d) { cal1.minimumDate = d }
                },
                Rin.Text { text: qsTr("Maximum Date") },
                Rin.CalendarDatePicker {
                    onDateSelected: function(d) { cal1.maximumDate = d }
                }
            ]
        }
    }

    // CalendarDatePicker section
    Column {
        Layout.fillWidth: true
        spacing: 4

        Rin.Text {
            text: qsTr("CalendarDatePicker (Button popup)")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        Rin.Frame {
            Layout.fillWidth: true
            padding: 18

            RowLayout {
                spacing: 8
                Rin.Text { text: qsTr("CalendarDatePicker") }
                Rin.CalendarDatePicker {
                    id: datePicker
                    useISOWeek: isoSwitch.checked
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
        }
    }

    // Calendar without frame
    Column {
        Layout.fillWidth: true
        spacing: 4

        Rin.Text {
            text: qsTr("Calendar without frame.")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        Rin.Frame {
            Layout.fillWidth: true
            height: 400

            Rin.Calendar {
                id: calendarNoFrame
                anchors.centerIn: parent
                frameVisible: false
            }
        }
    }
}
