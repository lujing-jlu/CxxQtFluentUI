import QtQuick 2.15
import QtQuick.Layouts 1.15
import "../components" as Rin

DemoPage {
    title: qsTr("CalendarDatePicker")
    description: qsTr("Pick a date from a flyout calendar.")

    Rin.CalendarDatePicker {
        id: picker
    }

    Text {
        text: picker.selectedDate ? qsTr("Selected: %1").arg(Qt.formatDate(picker.selectedDate, "yyyy-MM-dd")) : qsTr("Selected: (none)")
    }
}
