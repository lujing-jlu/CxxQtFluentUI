import QtQuick 2.15
import "../assets"

CategoryPage {
    title: qsTr("Media")
    description: qsTr("Media and identity controls.")

    items: ItemData.getItemsByType("media")
}
