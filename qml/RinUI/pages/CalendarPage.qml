import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../themes"
import "../components" as Rin

ScrollView {
    id: root
    property var navigationView: null
    Layout.fillWidth: true
    Layout.fillHeight: true
    clip: true
    contentWidth: availableWidth

    ColumnLayout {
        width: parent.width
        spacing: 24

        // Header
        ColumnLayout {
            Layout.fillWidth: true
            Layout.margins: 40
            spacing: 8

            Text {
                text: "Calendar"
                font.pixelSize: 32
                font.weight: Font.Bold
                color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
            }

            Text {
                text: "Date selection and calendar display with various views"
                font.pixelSize: 14
                color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.textSecondaryColor : "#6c6c6c"
            }
        }

        // Basic Calendar
        ColumnLayout {
            Layout.fillWidth: true
            Layout.leftMargin: 40
            Layout.rightMargin: 40
            spacing: 16

            Text {
                text: "Basic Calendar"
                font.pixelSize: 18
                font.weight: Font.Medium
                color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 400
                radius: 8
                color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.cardColor : "#ffffff"
                border.width: 1
                border.color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.cardBorderColor : "#e5e5e5"

                Rin.Calendar {
                    id: calendar
                    anchors.centerIn: parent
                    frameVisible: true

                    onDateSelected: function(date) {
                        console.log("Selected date:", date.toDateString())
                    }
                }
            }
        }

        // Calendar Without Frame
        ColumnLayout {
            Layout.fillWidth: true
            Layout.leftMargin: 40
            Layout.rightMargin: 40
            spacing: 16

            Text {
                text: "Calendar Without Frame"
                font.pixelSize: 18
                font.weight: Font.Medium
                color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 380
                radius: 8
                color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.cardSecondaryColor : "#f5f5f5"
                border.width: 1
                border.color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.cardBorderColor : "#e5e5e5"

                Rin.Calendar {
                    id: calendarNoFrame
                    anchors.centerIn: parent
                    frameVisible: false

                    onDateSelected: function(date) {
                        console.log("Selected date:", date.toDateString())
                    }
                }
            }
        }

        // Selected Date Display
        ColumnLayout {
            Layout.fillWidth: true
            Layout.leftMargin: 40
            Layout.rightMargin: 40
            Layout.bottomMargin: 40
            spacing: 16

            Text {
                text: "Selected Date"
                font.pixelSize: 18
                font.weight: Font.Medium
                color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 80
                radius: 8
                color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.cardColor : "#ffffff"
                border.width: 1
                border.color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.cardBorderColor : "#e5e5e5"

                Text {
                    anchors.centerIn: parent
                    font.pixelSize: 18
                    color: themeManager.currentTheme && themeManager.currentTheme.colors
                        ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
                    text: calendar.selectedDate ?
                        calendar.selectedDate.toLocaleDateString() :
                        "No date selected"
                }
            }
        }
    }
}
