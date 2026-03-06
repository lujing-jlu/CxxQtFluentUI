import QtQuick 2.15
import "../assets"

CategoryPage {
    title: qsTr("Layout")
    description: qsTr("Layout and disclosure controls.")

    items: ItemData.getItemsByType("layout")
}
