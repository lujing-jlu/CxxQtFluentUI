import QtQuick 2.15
import QtQuick.Layouts 1.15
import "../components" as Rin

DemoPage {
    id: root
    title: qsTr("All Samples")
    description: qsTr("Browse all demo pages.")

    property string query: ""

    function flattenItems(items, categoryTitle) {
        let out = []
        for (let i = 0; i < items.length; i++) {
            const item = items[i]
            const title = item.title || categoryTitle || ""
            const page = item.page || ""
            const icon = item.icon || ""
            const subItems = item.subItems || []

            if (page && page !== "unexist/page") {
                out.push({ title: title, page: page, icon: icon, category: categoryTitle || "" })
            }
            if (subItems && subItems.length > 0) {
                out = out.concat(flattenItems(subItems, item.title || categoryTitle || ""))
            }
        }
        return out
    }

    function allSamples() {
        return flattenItems(Rin.NavigationConfig.items, "")
    }

    function filteredSamples() {
        const q = query.trim().toLowerCase()
        const items = allSamples()
        if (!q) return items
        return items.filter(function(it) {
            return String(it.title).toLowerCase().includes(q) || String(it.page).toLowerCase().includes(q)
        })
    }

    Rin.TextField {
        Layout.fillWidth: true
        placeholderText: qsTr("Search pages…")
        text: root.query
        onTextChanged: root.query = text
    }

    Repeater {
        model: root.filteredSamples()
        delegate: Rin.SettingCard {
            Layout.fillWidth: true
            title: modelData.title
            description: modelData.page
            icon.name: modelData.icon || ""

            Rin.Button {
                text: qsTr("Open")
                isFlat: true
                enabled: !!root.navigationView
                onClicked: root.navigationView.push(modelData.page)
            }
        }
    }
}
