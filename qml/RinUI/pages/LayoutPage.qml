import QtQuick 2.15

CategoryPage {
    title: qsTr("Layout")
    description: qsTr("Layout and disclosure controls.")

    items: [
        { title: qsTr("Expander"), page: "ExpanderPage", icon: "ic_fluent_chevron_down_20_regular" },
        { title: qsTr("SettingExpander"), page: "SettingExpanderPage", icon: "ic_fluent_chevron_down_20_regular" }
    ]
}
