import QtQuick 2.15

CategoryPage {
    title: qsTr("Text & Typography")
    description: qsTr("Text entry and typography.")

    items: [
        { title: qsTr("AutoSuggestBox"), page: "AutoSuggestBoxPage", icon: "ic_fluent_search_20_regular" },
        { title: qsTr("TextField"), page: "TextFieldPage", icon: "ic_fluent_text_field_20_regular" },
        { title: qsTr("TextArea"), page: "TextAreaPage", icon: "ic_fluent_note_20_regular" },
        { title: qsTr("SpinBox"), page: "SpinBoxPage", icon: "ic_fluent_arrow_sort_20_regular" }
    ]
}
