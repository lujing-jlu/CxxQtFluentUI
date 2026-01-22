import QtQuick 2.15

CategoryPage {
    title: qsTr("Dialogs & Flyouts")
    description: qsTr("Modal dialogs and lightweight transient UI.")

    items: [
        { title: qsTr("Dialog"), page: "DialogPage", icon: "ic_fluent_document_20_regular" },
        { title: qsTr("Flyout"), page: "FlyoutPage", icon: "ic_fluent_chat_20_regular" },
        { title: qsTr("TeachingTip"), page: "TeachingTipPage", icon: "ic_fluent_lightbulb_20_regular" },
        { title: qsTr("Popup"), page: "PopupPage", icon: "ic_fluent_window_20_regular" }
    ]
}
