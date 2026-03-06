import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15
import Qt5Compat.GraphicalEffects
import "../themes"

import "../windows"
import "../components" as Rin
import "../assets"

FluentPage {
    id: page
    title: ""
    pageHorizontalPadding: 0
    wrapperWidth: width - 42 * 2

    property var navigationView: null

    // Banner
    contentHeader: Item {
        width: parent.width
        height: Math.max(page.height * 0.35, 200)

        Image {
            id: banner
            anchors.fill: parent
            source: "../assets/banner.png"
            fillMode: Image.PreserveAspectCrop
            verticalAlignment: Image.AlignTop

            layer.enabled: true
            layer.effect: OpacityMask {
                maskSource: Rectangle {
                    width: banner.width
                    height: banner.height
                    gradient: Gradient {
                        GradientStop { position: 0.7; color: "white" }
                        GradientStop { position: 1.0; color: "transparent" }
                    }
                }
            }
        }

        Column {
            anchors {
                top: parent.top
                left: parent.left
                leftMargin: 56
                topMargin: 38
            }
            spacing: 8

            Text {
                color: "#fff"
                font.pixelSize: 16
                text: qsTr("A Fluent Design-like UI library for CxxQt / Qt Quick")
            }

            Text {
                color: "#fff"
                font.pixelSize: 32
                font.weight: Font.DemiBold
                text: qsTr("CxxQtFluentUI Gallery")
            }
        }
    }

    // Link cards
    Flickable {
        width: parent.width
        implicitWidth: parent.width
        height: linkRow.height
        contentWidth: linkRow.width
        clip: true

        Row {
            id: linkRow
            spacing: 12

            Repeater {
                model: [
                    {
                        title: qsTr("Getting Started"),
                        desc: qsTr("Get started with CxxQtFluentUI and explore detailed documentation."),
                        icon: Qt.resolvedUrl("../assets/gallery.png"),
                        url: "https://github.com/lujing-jlu/CxxQtFluentUI#readme"
                    },
                    {
                        title: qsTr("Documentation"),
                        desc: qsTr("Explore the comprehensive documentation for components."),
                        icon: Qt.resolvedUrl("../assets/controls/RichTextBlock.png"),
                        url: "https://github.com/lujing-jlu/CxxQtFluentUI#readme"
                    },
                    {
                        title: qsTr("Source Code"),
                        desc: qsTr("Explore the source code and repository."),
                        icon: ThemeManager.isDark ? Qt.resolvedUrl("../assets/github_light.svg")
                                                  : Qt.resolvedUrl("../assets/github.svg"),
                        url: "https://github.com/lujing-jlu/CxxQtFluentUI"
                    },
                ]
                delegate: LinkClip { }
            }
        }
    }

    Rin.InfoBar {
        Layout.fillWidth: true
        severity: Rin.Severity.Success
        closable: false
        title: qsTr("🎉 Congratulations!")
        text: qsTr("Congratulations! The gallery refactor is now <b>complete</b>.")
    }

    Column {
        Layout.fillWidth: true
        spacing: 8

        Text {
            font.pixelSize: 18
            font.weight: Font.DemiBold
            text: qsTr("Recently added samples")
        }

        Grid {
            width: parent.width
            columns: Math.floor(width / (360 + 6))
            rowSpacing: 12
            columnSpacing: 12
            layoutDirection: GridLayout.LeftToRight

            Repeater {
                model: ItemData.recentlyAddedItems
                delegate: ControlClip {
                    navigationView: page.navigationView
                }
            }
        }
    }

    Column {
        Layout.fillWidth: true
        spacing: 8

        Text {
            font.pixelSize: 18
            font.weight: Font.DemiBold
            text: qsTr("Recently updated samples")
        }

        Grid {
            width: parent.width
            columns: Math.floor(width / (360 + 6))
            rowSpacing: 12
            columnSpacing: 12
            layoutDirection: GridLayout.LeftToRight

            Repeater {
                model: ItemData.recentlyUpdatedItems
                delegate: ControlClip {
                    navigationView: page.navigationView
                }
            }
        }
    }
}
