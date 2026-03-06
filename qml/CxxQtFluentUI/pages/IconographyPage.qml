import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15
import "../components" as Rin
import "../themes"
import "../utils" as RinUtils

DemoPage {
    id: page
    title: qsTr("Iconography")
    description: qsTr("Browse Fluent icon names and copy them for use in QML.")

    // Injected by NavigationBar if present
    property var floatLayer: null

    property var allIcons: Object.keys(RinUtils.Utils.fontIconIndex)
    property string searchText: ""
    property var filteredIcons: allIcons.filter(function(name) {
        return String(name).toLowerCase().indexOf(String(searchText).toLowerCase()) !== -1
    })

    function copyToClipboard(text) {
        if (Qt.application && Qt.application.clipboard && Qt.application.clipboard.setText) {
            Qt.application.clipboard.setText(text)
        }
        if (page.floatLayer && page.floatLayer.createInfoBar) {
            page.floatLayer.createInfoBar({ severity: Rin.Severity.Success, text: qsTr("Copied to clipboard") })
        } else {
            toast.show(qsTr("Copied"))
        }
    }

    ColumnLayout {
        Layout.fillWidth: true
        spacing: 12

        Rin.TextField {
            id: searchField
            width: 320
            placeholderText: qsTr("Search")
            onTextChanged: page.searchText = text
        }

        Rin.Frame {
            Layout.fillWidth: true
            Layout.preferredHeight: 600
            hoverable: false
            padding: 0

            RowLayout {
                anchors.fill: parent
                anchors.margins: 8
                spacing: 12

                GridView {
                    id: iconGrid
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    clip: true

                    model: page.filteredIcons
                    cellWidth: 100
                    cellHeight: 100
                    currentIndex: 0

                    ScrollBar.vertical: Rin.ScrollBar { policy: ScrollBar.AsNeeded }

                    delegate: Rin.Clip {
                        id: iconFrame
                        property bool isSelected: index === iconGrid.currentIndex

                        width: 92
                        height: 92
                        radius: ThemeManager.currentTheme.appearance.windowRadius
                        borderColor: isSelected ? ThemeManager.currentTheme.colors.primaryColor : "transparent"
                        borderWidth: isSelected ? 3 : 0

                        onClicked: {
                            iconGrid.currentIndex = index
                            page.copyToClipboard(modelData)
                        }

                        ColumnLayout {
                            anchors.fill: parent
                            anchors.margins: 8
                            spacing: 8

                            Rin.IconWidget {
                                Layout.fillHeight: true
                                Layout.alignment: Qt.AlignHCenter
                                size: 36
                                opacity: 0.9
                                icon: modelData
                            }

                            Text {
                                Layout.fillWidth: true
                                font.pixelSize: 10
                                horizontalAlignment: Text.AlignHCenter
                                color: ThemeManager.currentTheme.colors.textSecondaryColor
                                text: String(modelData).replace("ic_fluent_", "")
                                elide: Text.ElideRight
                            }
                        }
                    }
                }

                Rectangle {
                    Layout.preferredWidth: 300
                    Layout.fillHeight: true
                    radius: ThemeManager.currentTheme.appearance.smallRadius
                    color: ThemeManager.currentTheme.colors.systemAttentionBackgroundColor
                    border.width: 1
                    border.color: ThemeManager.currentTheme.colors.dividerBorderColor

                    ColumnLayout {
                        anchors.fill: parent
                        anchors.margins: 16
                        spacing: 12

                        Rin.IconWidget {
                            Layout.alignment: Qt.AlignHCenter
                            size: 88
                            icon: page.filteredIcons.length > 0 ? page.filteredIcons[iconGrid.currentIndex] : ""
                        }

                        Text {
                            Layout.fillWidth: true
                            horizontalAlignment: Text.AlignHCenter
                            font.pixelSize: 12
                            color: ThemeManager.currentTheme.colors.textSecondaryColor
                            text: page.filteredIcons.length > 0 ? page.filteredIcons[iconGrid.currentIndex] : qsTr("No icon selected")
                            wrapMode: Text.Wrap
                        }

                        Rectangle {
                            Layout.fillWidth: true
                            height: 1
                            color: ThemeManager.currentTheme.colors.dividerBorderColor
                        }

                        Text { text: qsTr("QML") }

                        RowLayout {
                            Layout.fillWidth: true
                            spacing: 8

                            Text {
                                id: qmlCode
                                Layout.fillWidth: true
                                wrapMode: Text.Wrap
                                color: ThemeManager.currentTheme.colors.textSecondaryColor
                                font.family: "Cascadia Mono"
                                text: page.filteredIcons.length > 0
                                    ? ("icon.name: \"" + page.filteredIcons[iconGrid.currentIndex] + "\"")
                                    : qsTr("No icon selected")
                            }

                            Rin.ToolButton {
                                iconName: "ic_fluent_copy_20_regular"
                                onClicked: page.copyToClipboard(qmlCode.text)
                            }
                        }
                    }
                }
            }
        }

        Rin.Toast {
            id: toast
            Layout.fillWidth: true
            severity: Rin.Severity.Success
            visible: false

            function show(msg) {
                title = qsTr("Iconography")
                text = msg
                visible = true
                closeTimer.restart()
            }

            Timer {
                id: closeTimer
                interval: 1000
                onTriggered: toast.visible = false
            }
        }
    }
}
