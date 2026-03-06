import QtQuick 2.15
import "../assets"

CategoryPage {
    title: qsTr("Basic Input")
    description: qsTr("Buttons and common input controls.")

    items: ItemData.getItemsByType("basicInput")
}
