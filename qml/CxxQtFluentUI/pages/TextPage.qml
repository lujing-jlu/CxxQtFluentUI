import QtQuick 2.15
import "../assets"

CategoryPage {
    title: qsTr("Text & Typography")
    description: qsTr("Text entry and typography.")

    items: ItemData.getItemsByType("text")
}
