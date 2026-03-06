import QtQuick 2.15
import "../assets"

CategoryPage {
    title: qsTr("Collections")
    description: qsTr("List and data presentation controls.")

    items: ItemData.getItemsByType("collections")
}
