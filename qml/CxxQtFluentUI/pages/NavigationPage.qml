import QtQuick 2.15
import "../assets"

CategoryPage {
    title: qsTr("Navigation")
    description: qsTr("Navigation patterns and related controls.")

    items: ItemData.getItemsByType("navigation")
}
