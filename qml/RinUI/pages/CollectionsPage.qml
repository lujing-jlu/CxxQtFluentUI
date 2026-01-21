import QtQuick 2.15

CategoryPage {
    title: qsTr("Collections")
    description: qsTr("List and data presentation controls.")

    items: [
        { title: qsTr("ListView"), page: "ListViewPage", icon: "ic_fluent_text_bullet_list_20_regular" },
        { title: qsTr("TableView"), page: "TableViewPage", icon: "ic_fluent_table_20_regular" },
        { title: qsTr("SettingCard"), page: "SettingCardPage", icon: "ic_fluent_settings_20_regular" }
    ]
}
