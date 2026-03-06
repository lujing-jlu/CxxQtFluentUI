import QtQuick 2.15
import "../assets"
CategoryPage {
    title: qsTr("Status & Info")
    description: qsTr("Progress, busy indicators, badges, info bars, and toasts.")

    items: ItemData.getItemsByType("status&info")
}
