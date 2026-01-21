import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../components" as Rin

Item {
    id: root
    property var navigationView: null

    property var colors: themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors : null
    property var typography: themeManager.currentTheme ? themeManager.currentTheme.typography : null

    property string title: qsTr("Segmented Control")

    ScrollView {
        anchors.fill: parent
        anchors.margins: 20
        clip: true

        Column {
            width: parent.width
            spacing: 24

            // Title
            Text {
                text: qsTr("Segmented Control")
                font.pixelSize: 28
                font.weight: Font.Medium
                color: colors ? colors.textColor : "#1b1b1b"
            }

            // Description
            Text {
                width: parent.width
                text: qsTr("Segmented controls are used to display mutually exclusive options.")
                font.pixelSize: 14
                color: colors ? colors.textColor : "#1b1b1b"
                wrapMode: Text.WordWrap
            }

            // Basic Segmented
            Column {
                width: parent.width
                spacing: 16

                Text {
                    text: qsTr("Basic Segmented")
                    font.pixelSize: 18
                    font.weight: Font.Medium
                    color: colors ? colors.textColor : "#1b1b1b"
                }

                Rin.Segmented {
                    id: segmented
                    width: 300
                    height: 32

                    Rin.SegmentedItem {
                        text: qsTr("Day")
                    }

                    Rin.SegmentedItem {
                        text: qsTr("Week")
                    }

                    Rin.SegmentedItem {
                        text: qsTr("Month")
                    }

                    Rin.SegmentedItem {
                        text: qsTr("Year")
                    }
                }

                Text {
                    text: qsTr("Selected index: ") + segmented.currentIndex
                    font.pixelSize: 14
                    color: colors ? colors.textSecondaryColor : "#606060"
                }
            }

            // SelectorBar
            Column {
                width: parent.width
                spacing: 16

                Text {
                    text: qsTr("SelectorBar")
                    font.pixelSize: 18
                    font.weight: Font.Medium
                    color: colors ? colors.textColor : "#1b1b1b"
                }

                Rin.SelectorBar {
                    id: selectorBar
                    width: 300
                    height: 32

                    Rin.SelectorBarItem {
                        text: qsTr("All")
                    }

                    Rin.SelectorBarItem {
                        text: qsTr("Unread")
                    }

                    Rin.SelectorBarItem {
                        text: qsTr("Mentions")
                    }
                }

                Text {
                    text: qsTr("SelectorBar has no background - only indicators are shown.")
                    font.pixelSize: 12
                    color: colors ? colors.textSecondaryColor : "#606060"
                }
            }
        }
    }
}
