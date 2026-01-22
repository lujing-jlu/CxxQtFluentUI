import QtQuick 2.15
import QtQuick.Layouts 2.15
import "../windows"
import "../themes"
import "../utils"
import "../components" as Rin

FluentPage {
    id: root
    title: ""

    property var navigationView: null

    wrapperWidth: width - Utils.pageMargin * 2
    pageHorizontalPadding: 0
    contentSpacing: Utils.sectionSpacing

    contentHeader: Item {
        width: parent.width
        height: 220

        Rectangle {
            anchors.fill: parent
            radius: 12
            color: themeManager.currentTheme && themeManager.currentTheme.colors
                ? themeManager.currentTheme.colors.primaryColor
                : "#0078D4"

            RowLayout {
                anchors.fill: parent
                anchors.margins: 28
                spacing: 24

                ColumnLayout {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    spacing: 10

                    Text {
                        text: qsTr("CxxQt FluentUI")
                        font.pixelSize: 34
                        font.weight: Font.Bold
                        color: "#ffffff"
                    }

                    Text {
                        text: qsTr("A modern Fluent Design UI library for CxxQt")
                        font.pixelSize: 16
                        color: Qt.alpha("#ffffff", 0.92)
                        Layout.fillWidth: true
                        wrapMode: Text.WordWrap
                    }

                    Item { Layout.fillHeight: true }

                    RowLayout {
                        spacing: 12

                        Rin.Button {
                            text: qsTr("Get Started")
                            isPrimary: true
                            onClicked: {
                                if (root.navigationView) root.navigationView.push("AllSamplesPage")
                            }
                        }

                        Rin.Button {
                            text: qsTr("All Samples")
                            isFlat: true
                            onClicked: {
                                if (root.navigationView) root.navigationView.push("AllSamplesPage")
                            }
                        }
                    }
                }
            }
        }
    }

    ColumnLayout {
        Layout.fillWidth: true
        spacing: 16

        Text {
            text: qsTr("Features")
            font.pixelSize: 20
            font.weight: Font.DemiBold
        }

        GridLayout {
            Layout.fillWidth: true
            columns: Math.max(1, Math.floor(width / 320))
            columnSpacing: 12
            rowSpacing: 12

            Repeater {
                model: [
                    { title: qsTr("Fluent Design"), desc: qsTr("Microsoft Fluent-inspired visuals"), icon: "ic_fluent_design_ideas_20_regular" },
                    { title: qsTr("Dark Mode"), desc: qsTr("Full dark theme support"), icon: "ic_fluent_weather_moon_20_regular" },
                    { title: qsTr("Navigation"), desc: qsTr("Built-in navigation patterns"), icon: "ic_fluent_navigation_20_regular" },
                    { title: qsTr("Components"), desc: qsTr("Rich set of QML controls"), icon: "ic_fluent_apps_list_20_regular" },
                    { title: qsTr("Animations"), desc: qsTr("Consistent motion and transitions"), icon: "ic_fluent_play_20_regular" },
                    { title: qsTr("CxxQt"), desc: qsTr("Designed for Rust + Qt via CxxQt"), icon: "ic_fluent_code_20_regular" }
                ]

                delegate: Rin.Frame {
                    Layout.fillWidth: true
                    implicitHeight: 110

                    RowLayout {
                        anchors.fill: parent
                        anchors.margins: 16
                        spacing: 12

                        Rin.Icon {
                            size: 22
                            name: modelData.icon
                            color: themeManager.currentTheme && themeManager.currentTheme.colors
                                ? themeManager.currentTheme.colors.primaryColor
                                : "#0078D4"
                        }

                        ColumnLayout {
                            Layout.fillWidth: true
                            spacing: 2

                            Text {
                                text: modelData.title
                                font.pixelSize: 14
                                font.weight: Font.DemiBold
                                elide: Text.ElideRight
                            }

                            Text {
                                text: modelData.desc
                                font.pixelSize: 12
                                opacity: 0.8
                                wrapMode: Text.WordWrap
                                Layout.fillWidth: true
                            }
                        }
                    }
                }
            }
        }
    }
}

