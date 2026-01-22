import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15
import "../../themes"
import "../../utils"

Item {
    id: root

    property var tabs: []
    property int currentIndex: 0
    property bool addButtonVisible: false

    // Used when a tab object doesn't provide `component` or `source`.
    property Component fallbackComponent: null

    signal addRequested()
    signal closeRequested(int index)

    implicitWidth: 400
    implicitHeight: 300

    function _clampIndex() {
        const count = (tabs && tabs.length) ? tabs.length : 0
        if (count <= 0) {
            root.currentIndex = -1
            return
        }
        if (root.currentIndex < 0) root.currentIndex = 0
        if (root.currentIndex >= count) root.currentIndex = count - 1
    }

    onTabsChanged: _clampIndex()
    onCurrentIndexChanged: {
        _clampIndex()
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: 8

        Rectangle {
            Layout.fillWidth: true
            Layout.preferredHeight: 44
            radius: themeManager.currentTheme && themeManager.currentTheme.appearance
                ? themeManager.currentTheme.appearance.buttonRadius
                : 5
            color: themeManager.currentTheme && themeManager.currentTheme.colors
                ? themeManager.currentTheme.colors.layerColor
                : Qt.alpha("#ffffff", 0.5)

            RowLayout {
                anchors.fill: parent
                anchors.margins: 4
                spacing: 6

                Flickable {
                    id: headerFlick
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    clip: true
                    contentWidth: tabBar.implicitWidth
                    contentHeight: tabBar.implicitHeight
                    interactive: contentWidth > width
                    boundsBehavior: Flickable.StopAtBounds
                    flickableDirection: Flickable.HorizontalFlick

                    TabBar {
                        id: tabBar
                        height: parent.height
                        width: implicitWidth
                        currentIndex: root.currentIndex
                        onCurrentIndexChanged: root.currentIndex = currentIndex
                        background: Item {}

                        Repeater {
                            model: root.tabs || []
                            delegate: TabViewTabButton {
                                text: modelData && modelData.title ? String(modelData.title) : ""
                                iconName: modelData && modelData.icon ? String(modelData.icon) : ""
                                closable: modelData && modelData.closable === true
                                onCloseClicked: root.closeRequested(index)
                            }
                        }
                    }
                }

                TabViewTabButton {
                    visible: root.addButtonVisible
                    text: ""
                    iconName: "ic_fluent_tab_add_20_regular"
                    closable: false
                    implicitWidth: 40
                    onClicked: root.addRequested()
                }
            }
        }

        Loader {
            Layout.fillWidth: true
            Layout.fillHeight: true
            active: root.currentIndex >= 0 && root.currentIndex < (root.tabs ? root.tabs.length : 0)

            property var tabData: (root.currentIndex >= 0 && root.tabs && root.currentIndex < root.tabs.length)
                ? root.tabs[root.currentIndex]
                : null

            sourceComponent: {
                if (!tabData) return null
                if (tabData.component) return tabData.component
                if (tabData.source) return null
                return root.fallbackComponent
            }

            source: {
                if (!tabData) return ""
                if (tabData.component) return ""
                if (tabData.source) return String(tabData.source)
                return ""
            }

            onLoaded: function() {
                if (!item) return
                if (item.hasOwnProperty("tabData")) {
                    item.tabData = tabData
                }
            }
        }

        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true
            visible: (root.tabs ? root.tabs.length : 0) === 0

            Text {
                anchors.centerIn: parent
                font.pixelSize: 14
                color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.textSecondaryColor
                    : "#6c6c6c"
                text: qsTr("No tabs")
            }
        }
    }
}
