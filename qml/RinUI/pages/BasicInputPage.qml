import QtQuick 2.15

CategoryPage {
    title: qsTr("Basic Input")
    description: qsTr("Buttons and common input controls.")

    items: [
        { title: qsTr("Button"), page: "ButtonPage", icon: "ic_fluent_button_20_regular" },
        { title: qsTr("RoundButton"), page: "RoundButtonPage", icon: "ic_fluent_button_20_regular" },
        { title: qsTr("ToggleButton"), page: "ToggleButtonPage", icon: "ic_fluent_toggle_right_20_regular" },
        { title: qsTr("PillButton"), page: "PillButtonPage", icon: "ic_fluent_toggle_right_20_regular" },
        { title: qsTr("CheckBox"), page: "CheckBoxPage", icon: "ic_fluent_checkbox_checked_20_regular" },
        { title: qsTr("RadioButton"), page: "RadioButtonPage", icon: "ic_fluent_radio_button_20_regular" },
        { title: qsTr("Switch"), page: "SwitchPage", icon: "ic_fluent_toggle_left_20_regular" },
        { title: qsTr("Slider"), page: "SliderPage", icon: "ic_fluent_slider_20_regular" },
        { title: qsTr("RatingControl"), page: "RatingControlPage", icon: "ic_fluent_star_20_regular" },
        { title: qsTr("ComboBox"), page: "ComboBoxPage", icon: "ic_fluent_chevron_down_20_regular" },
        { title: qsTr("DropDownButton"), page: "DropDownButtonPage", icon: "ic_fluent_caret_down_20_regular" },
        { title: qsTr("ColorPicker"), page: "ColorPickerPage", icon: "ic_fluent_color_20_regular" },
        { title: qsTr("Hyperlink"), page: "HyperlinkPage", icon: "ic_fluent_link_20_regular" }
    ]
}
