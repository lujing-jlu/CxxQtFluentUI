import QtQuick 2.15
import "../assets"

CategoryPage {
    title: qsTr("Menus & Toolbars")
    description: qsTr("Commands and menus.")

    items: ItemData.getItemsByType("menus&toolbars")
}
