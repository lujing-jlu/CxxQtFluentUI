pragma Singleton
import QtQuick 2.15

QtObject {
    // Navigation items configuration
    property var items: [
        {
            title: qsTr("Home"),
            page: "HomePage",
            icon: "ic_fluent_home_20_regular"
        },
        {
            title: qsTr("Buttons"),
            page: "ButtonsPage",
            icon: "ic_fluent_button_20_regular"
        },
        {
            title: qsTr("Inputs"),
            page: "InputsPage",
            icon: "ic_fluent_textbox_20_regular",
            subItems: [
                { title: qsTr("TextField"), page: "TextFieldPage", icon: "ic_fluent_text_field_20_regular" },
                { title: qsTr("ComboBox"), page: "ComboBoxPage", icon: "ic_fluent_chevron_down_20_regular" },
                { title: qsTr("TextArea"), page: "TextAreaPage", icon: "ic_fluent_note_20_regular" },
                { title: qsTr("SpinBox"), page: "SpinBoxPage", icon: "ic_fluent_arrow_sort_20_regular" }
            ]
        },
        {
            title: qsTr("Indicators"),
            page: "IndicatorsPage",
            icon: "ic_fluent_progress_circle_20_regular",
            subItems: [
                { title: qsTr("ProgressBar"), page: "ProgressPage", icon: "ic_fluent_circle_20_regular" },
                { title: qsTr("BusyIndicator"), page: "BusyPage", icon: "ic_fluent_spinner_off_20_regular" }
            ]
        },
        {
            title: qsTr("Components"),
            page: "",
            icon: "ic_fluent_apps_list_20_regular",
            subItems: [
                { title: qsTr("Avatar"), page: "AvatarPage", icon: "ic_fluent_person_20_regular" },
                { title: qsTr("Calendar"), page: "CalendarPage", icon: "ic_fluent_calendar_20_regular" },
                { title: qsTr("Expander"), page: "ExpanderPage", icon: "ic_fluent_chevron_down_20_regular" },
                { title: qsTr("Menu"), page: "MenuPage", icon: "ic_fluent_text_bullet_list_20_regular" }
            ]
        },
        {
            title: qsTr("Settings"),
            page: "SettingsPage",
            icon: "ic_fluent_settings_20_regular"
        }
    ]

    // Page title mapping
    property var pageTitles: {
        "HomePage": qsTr("Home"),
        "ButtonsPage": qsTr("Buttons"),
        "InputsPage": qsTr("Inputs"),
        "TextFieldPage": qsTr("TextField"),
        "ComboBoxPage": qsTr("ComboBox"),
        "TextAreaPage": qsTr("TextArea"),
        "SpinBoxPage": qsTr("SpinBox"),
        "IndicatorsPage": qsTr("Indicators"),
        "ProgressPage": qsTr("ProgressBar"),
        "BusyPage": qsTr("BusyIndicator"),
        "SettingsPage": qsTr("Settings")
    }

    // Get page title
    function getPageTitle(pageName) {
        return pageTitles[pageName] || pageName
    }

    // Pages directory
    property string pagesDirectory: "pages"
}
