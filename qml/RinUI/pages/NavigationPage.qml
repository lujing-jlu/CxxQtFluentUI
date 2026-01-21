import QtQuick 2.15

CategoryPage {
    title: qsTr("Navigation")
    description: qsTr("Navigation patterns and related controls.")

    items: [
        { title: qsTr("NavigationView"), page: "NavigationViewPage", icon: "ic_fluent_navigation_20_regular" },
        { title: qsTr("Segmented"), page: "SegmentedPage", icon: "ic_fluent_pivot_20_regular" },
        { title: qsTr("SelectorBar"), page: "SelectorBarPage", icon: "ic_fluent_pivot_20_regular" }
    ]
}
