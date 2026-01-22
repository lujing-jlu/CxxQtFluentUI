import QtQuick 2.15
import QtQuick.Layouts 2.15
import "../components" as Rin
import "../utils"

DemoPage {
    id: root
    title: qsTr("TabView")
    description: qsTr("Organize content into tabs with optional add/close actions.")

    property int nextTabId: 4
    property var tabsModel: [
        { title: qsTr("Home"), icon: "ic_fluent_home_20_regular", closable: false },
        { title: qsTr("Files"), icon: "ic_fluent_folder_20_regular", closable: true },
        { title: qsTr("Settings"), icon: "ic_fluent_settings_20_regular", closable: true }
    ]

    function addTab() {
        const id = root.nextTabId
        root.nextTabId += 1
        const newTab = { title: qsTr("Tab %1").arg(id), icon: "ic_fluent_tab_20_regular", closable: true }
        root.tabsModel = root.tabsModel.concat([newTab])
        tabView.currentIndex = root.tabsModel.length - 1
    }

    function closeTab(index) {
        if (index < 0 || index >= root.tabsModel.length) return
        root.tabsModel = root.tabsModel.filter(function(_, i) { return i !== index })
        if (tabView.currentIndex >= root.tabsModel.length) {
            tabView.currentIndex = root.tabsModel.length - 1
        }
    }

    Rin.TabView {
        id: tabView
        Layout.fillWidth: true
        Layout.preferredHeight: 360
        addButtonVisible: true
        tabs: root.tabsModel

        fallbackComponent: Component {
            Rin.Frame {
                anchors.fill: parent
                padding: 16
                property var tabData: null

                ColumnLayout {
                    anchors.fill: parent
                    spacing: 8

                    Rin.Text {
                        typography: Rin.Typography.Subtitle
                        text: tabData && tabData.title ? String(tabData.title) : qsTr("Tab")
                    }

                    Rin.Text {
                        color: themeManager.currentTheme.colors.textSecondaryColor
                        text: qsTr("This is demo content rendered by TabView.fallbackComponent.")
                        wrapMode: Text.WordWrap
                    }

                    Rin.Button {
                        text: qsTr("Add Tab")
                        onClicked: root.addTab()
                    }
                }
            }
        }

        onAddRequested: root.addTab()
        onCloseRequested: function(index) { root.closeTab(index) }
    }
}

