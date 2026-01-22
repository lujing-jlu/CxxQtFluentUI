import QtQuick 2.15

CategoryPage {
    title: qsTr("Menus & Toolbars")
    description: qsTr("Commands and menus.")

    items: [
        { title: qsTr("CommandBar"), page: "CommandBarPage", icon: "ic_fluent_more_horizontal_20_regular" },
        { title: qsTr("Menu"), page: "MenuPage", icon: "ic_fluent_text_bullet_list_20_regular" },
        { title: qsTr("MenuBar"), page: "MenuBarPage", icon: "ic_fluent_table_simple_20_regular" }
    ]
}
