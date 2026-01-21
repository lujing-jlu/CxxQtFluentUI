pragma Singleton
import QtQuick 2.15
import "../utils"

QtObject {
    // Navigation items configuration (match Rin-UI ordering)
    property var items: [
        {
            title: qsTr("Home"),
            page: "HomePage",
            icon: "ic_fluent_home_20_regular",
            position: Position.Top
        },
        {
            title: qsTr("Design guidance"),
            icon: "ic_fluent_design_ideas_20_regular",
            subItems: [
                {
                    title: qsTr("Iconography"),
                    page: "IconographyPage",
                    icon: "ic_fluent_symbols_20_regular"
                }
            ]
        },
        {
            title: qsTr("All Samples"),
            page: "AllSamplesPage",
            icon: "ic_fluent_apps_list_20_regular"
        },
        {
            title: qsTr("Basic Input"),
            page: "BasicInputPage",
            icon: "ic_fluent_checkbox_checked_20_regular",
            subItems: [
                { title: qsTr("Button"), page: "ButtonPage", icon: "ic_fluent_button_20_regular" },
                { title: qsTr("RoundButton"), page: "RoundButtonPage", icon: "ic_fluent_button_20_regular" },
                { title: qsTr("ToggleButton"), page: "ToggleButtonPage", icon: "ic_fluent_toggle_right_20_regular" },
                { title: qsTr("PillButton"), page: "PillButtonPage", icon: "ic_fluent_toggle_right_20_regular" },
                { title: qsTr("CheckBox"), page: "CheckBoxPage", icon: "ic_fluent_checkbox_checked_20_regular" },
                { title: qsTr("RadioButton"), page: "RadioButtonPage", icon: "ic_fluent_radio_button_20_regular" },
                { title: qsTr("Switch"), page: "SwitchPage", icon: "ic_fluent_toggle_left_20_regular" },
                { title: qsTr("Slider"), page: "SliderPage", icon: "ic_fluent_slider_20_regular" },
                { title: qsTr("ComboBox"), page: "ComboBoxPage", icon: "ic_fluent_chevron_down_20_regular" },
                { title: qsTr("DropDownButton"), page: "DropDownButtonPage", icon: "ic_fluent_caret_down_20_regular" },
                { title: qsTr("ColorPicker"), page: "ColorPickerPage", icon: "ic_fluent_color_20_regular" },
                { title: qsTr("Hyperlink"), page: "HyperlinkPage", icon: "ic_fluent_link_20_regular" }
            ]
        },
        {
            title: qsTr("Collections"),
            page: "CollectionsPage",
            icon: "ic_fluent_table_20_regular",
            subItems: [
                { title: qsTr("ListView"), page: "ListViewPage", icon: "ic_fluent_text_bullet_list_20_regular" },
                { title: qsTr("TableView"), page: "TableViewPage", icon: "ic_fluent_table_20_regular" },
                { title: qsTr("SettingCard"), page: "SettingCardPage", icon: "ic_fluent_settings_20_regular" }
            ]
        },
        {
            title: qsTr("Date & Time"),
            page: "DateAndTimePage",
            icon: "ic_fluent_calendar_clock_20_regular",
            subItems: [
                { title: qsTr("Calendar"), page: "CalendarPage", icon: "ic_fluent_calendar_20_regular" },
                { title: qsTr("CalendarDatePicker"), page: "CalendarDatePickerPage", icon: "ic_fluent_calendar_20_regular" },
                { title: qsTr("DatePicker"), page: "DatePickerPage", icon: "ic_fluent_calendar_20_regular" },
                { title: qsTr("TimePicker"), page: "TimePickerPage", icon: "ic_fluent_clock_20_regular" }
            ]
        },
        {
            title: qsTr("Dialogs & Flyouts"),
            page: "DialogsAndFlyoutsPage",
            icon: "ic_fluent_chat_20_regular",
            subItems: [
                { title: qsTr("Dialog"), page: "DialogPage", icon: "ic_fluent_chat_20_regular" },
                { title: qsTr("Flyout"), page: "FlyoutPage", icon: "ic_fluent_chat_20_regular" },
                { title: qsTr("Popup"), page: "PopupPage", icon: "ic_fluent_chat_20_regular" }
            ]
        },
        {
            title: qsTr("Layout"),
            page: "LayoutPage",
            icon: "ic_fluent_content_view_20_regular",
            subItems: [
                { title: qsTr("Expander"), page: "ExpanderPage", icon: "ic_fluent_chevron_down_20_regular" },
                { title: qsTr("SettingExpander"), page: "SettingExpanderPage", icon: "ic_fluent_chevron_down_20_regular" }
            ]
        },
        {
            title: qsTr("Media"),
            page: "MediaPage",
            icon: "ic_fluent_video_clip_20_regular",
            subItems: [
                { title: qsTr("Avatar"), page: "AvatarPage", icon: "ic_fluent_person_20_regular" }
            ]
        },
        {
            title: qsTr("Menus & Toolbars"),
            page: "MenusAndToolbarsPage",
            icon: "ic_fluent_save_20_regular",
            subItems: [
                { title: qsTr("Menu"), page: "MenuPage", icon: "ic_fluent_text_bullet_list_20_regular" },
                { title: qsTr("MenuBar"), page: "MenuBarPage", icon: "ic_fluent_table_simple_20_regular" }
            ]
        },
        {
            title: qsTr("Navigation"),
            page: "NavigationPage",
            icon: "ic_fluent_navigation_20_regular",
            subItems: [
                { title: qsTr("NavigationView"), page: "NavigationViewPage", icon: "ic_fluent_navigation_20_regular" },
                { title: qsTr("Segmented"), page: "SegmentedPage", icon: "ic_fluent_pivot_20_regular" },
                { title: qsTr("SelectorBar"), page: "SelectorBarPage", icon: "ic_fluent_pivot_20_regular" }
            ]
        },
        {
            title: qsTr("Status & Info"),
            page: "StatusAndInfoPage",
            icon: "ic_fluent_chat_multiple_minus_20_regular",
            subItems: [
                { title: qsTr("ProgressBar"), page: "ProgressPage", icon: "ic_fluent_circle_20_regular" },
                { title: qsTr("ProgressRing"), page: "ProgressRingPage", icon: "ic_fluent_circle_20_regular" },
                { title: qsTr("BusyIndicator"), page: "BusyPage", icon: "ic_fluent_spinner_off_20_regular" },
                { title: qsTr("InfoBadge"), page: "InfoBadgePage", icon: "ic_fluent_badge_20_regular" },
                { title: qsTr("InfoBar"), page: "InfoBarPage", icon: "ic_fluent_info_20_regular" },
                { title: qsTr("ToolTip"), page: "ToolTipPage", icon: "ic_fluent_info_20_regular" },
                { title: qsTr("Toast"), page: "ToastPage", icon: "ic_fluent_alert_20_regular" }
            ]
        },
        {
            title: qsTr("Text & Typography"),
            page: "TextPage",
            icon: "ic_fluent_text_font_20_regular",
            subItems: [
                { title: qsTr("AutoSuggestBox"), page: "AutoSuggestBoxPage", icon: "ic_fluent_search_20_regular" },
                { title: qsTr("TextField"), page: "TextFieldPage", icon: "ic_fluent_text_field_20_regular" },
                { title: qsTr("TextArea"), page: "TextAreaPage", icon: "ic_fluent_note_20_regular" },
                { title: qsTr("SpinBox"), page: "SpinBoxPage", icon: "ic_fluent_arrow_sort_20_regular" }
            ]
        },
        {
            title: qsTr("Error Interface Test"),
            page: "unexist/page",
            icon: "ic_fluent_document_error_20_regular"
        },
        {
            title: qsTr("Settings"),
            page: "SettingsPage",
            icon: "ic_fluent_settings_20_regular",
            position: Position.Bottom
        }
    ]

    function _pageTitleFromItems(list, pageName) {
        if (!list) return ""
        for (let i = 0; i < list.length; i++) {
            const item = list[i]
            if (!item) continue
            if (String(item.page) === String(pageName)) return item.title || ""
            const subItems = item.subItems || []
            const t = _pageTitleFromItems(subItems, pageName)
            if (t) return t
        }
        return ""
    }

    // Get page title
    function getPageTitle(pageName) {
        const t = _pageTitleFromItems(items, pageName)
        return t || pageName
    }

    // Pages directory
    property string pagesDirectory: "pages"
}
