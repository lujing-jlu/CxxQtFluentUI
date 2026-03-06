import QtQuick 2.15
import "../assets"

CategoryPage {
    title: qsTr("Dialogs & Flyouts")
    description: qsTr("Modal dialogs and lightweight transient UI.")

    items: ItemData.getItemsByType("dialogs&flyouts")
}
