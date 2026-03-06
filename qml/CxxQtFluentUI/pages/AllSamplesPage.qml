import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15
import Qt5Compat.GraphicalEffects

import "../windows"
import "../components" as Rin
import "../assets"

FluentPage {
    id: page
    title: ""
    pageHorizontalPadding: 0
    wrapperWidth: width - 42 * 2
    padding: 0

    property var navigationView: null

    // Banner
    header: Item {
        width: parent.width
        height: 200

        Image {
            id: banner
            anchors.fill: parent
            source: "../assets/banner.png"
            fillMode: Image.PreserveAspectCrop
            verticalAlignment: Image.AlignTop
            horizontalAlignment: Image.AlignLeft

            layer.enabled: true
            layer.effect: OpacityMask {
                maskSource: Rectangle {
                    width: banner.width
                    height: banner.height
                    gradient: Gradient {
                        GradientStop { position: 0.25; color: "white" }
                        GradientStop { position: 1.0; color: "transparent" }
                    }
                }
            }
        }

        Column {
            anchors {
                top: parent.top
                left: parent.left
                leftMargin: 40
                topMargin: 90
            }
            spacing: 8

            Text {
                color: "#fff"
                font.pixelSize: 26
                font.weight: Font.Medium
                text: qsTr("All samples")
            }
        }
    }

    Grid {
        Layout.fillWidth: true
        columns: Math.floor(width / (360 + 12))
        rowSpacing: 12
        columnSpacing: 12
        layoutDirection: GridLayout.LeftToRight

        Repeater {
            model: ItemData.allControls
            delegate: ControlClip {
                navigationView: page.navigationView
            }
        }
    }
}
