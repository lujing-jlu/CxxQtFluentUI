import QtQuick 2.15
import "../assets"

CategoryPage {
    title: qsTr("Date & Time")
    description: qsTr("Date and time picking controls.")

    items: ItemData.getItemsByType("date&time")
}
