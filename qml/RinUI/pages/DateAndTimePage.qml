import QtQuick 2.15

CategoryPage {
    title: qsTr("Date & Time")
    description: qsTr("Date and time picking controls.")

    items: [
        { title: qsTr("Calendar"), page: "CalendarPage", icon: "ic_fluent_calendar_20_regular" },
        { title: qsTr("CalendarDatePicker"), page: "CalendarDatePickerPage", icon: "ic_fluent_calendar_20_regular" },
        { title: qsTr("DatePicker"), page: "DatePickerPage", icon: "ic_fluent_calendar_20_regular" },
        { title: qsTr("TimePicker"), page: "TimePickerPage", icon: "ic_fluent_clock_20_regular" }
    ]
}
