import QtQuick 2.15
import QtQuick.Layouts 1.15
import "../components" as Rin

ControlPage {
    id: page
    title: qsTr("Calendar")

    Text {
        Layout.fillWidth: true
        wrapMode: Text.WordWrap
        text: qsTr("A control that presents a calendar for date selection.")
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            text: qsTr("A basic Calendar.")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        Rin.Frame {
            Layout.fillWidth: true
            height: 420

            Rin.Calendar {
                id: calendar
                anchors.centerIn: parent
                frameVisible: true
            }
        }
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            text: qsTr("Calendar without frame.")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        Rin.Frame {
            Layout.fillWidth: true
            height: 400
            color: themeManager.currentTheme && themeManager.currentTheme.colors
                ? themeManager.currentTheme.colors.cardSecondaryColor
                : "#f5f5f5"

            Rin.Calendar {
                id: calendarNoFrame
                anchors.centerIn: parent
                frameVisible: false
            }
        }
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            text: qsTr("Selected date.")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        Rin.Frame {
            Layout.fillWidth: true
            height: 80

            Text {
                anchors.centerIn: parent
                font.pixelSize: 16
                text: calendar.selectedDate ? Qt.formatDate(calendar.selectedDate, "yyyy-MM-dd") : qsTr("No date selected")
            }
        }
    }
}

