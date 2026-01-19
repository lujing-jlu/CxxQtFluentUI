import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../components" as Rin

Item {
    id: root

    readonly property var colors: themeManager.currentTheme.item ? themeManager.currentTheme.item.colors : null
    readonly property var typography: themeManager.currentTheme.item ? themeManager.currentTheme.item.typography : null

    property string title: qsTr("Buttons")

    ScrollView {
        anchors.fill: parent
        anchors.margins: 20
        clip: true

        Column {
            width: parent.width
            spacing: 24

            // Section: Button Styles
            Text {
                text: qsTr("Button Styles")
                font.pixelSize: 18
                font.bold: true
                color: colors ? colors.textColor : "#1b1b1b"
            }

            Column {
                spacing: 12
                width: parent.width

                Row {
                    spacing: 12

                    Rin.Button {
                        text: qsTr("Primary")
                        isPrimary: true
                    }

                    Rin.Button {
                        text: qsTr("Standard")
                    }

                    Rin.Button {
                        text: qsTr("Flat")
                        isFlat: true
                    }

                    Rin.Button {
                        text: qsTr("Disabled")
                        enabled: false
                    }
                }
            }

            // Section: Button Sizes
            Text {
                text: qsTr("Button Sizes")
                font.pixelSize: 18
                font.bold: true
                color: colors ? colors.textColor : "#1b1b1b"
            }

            Column {
                spacing: 12
                width: parent.width

                Row {
                    spacing: 12
                    Rin.Button {
                        text: qsTr("Small")
                        icon.name: "ic_fluent_arrow_fit_16_regular"
                    }

                    Rin.Button {
                        text: qsTr("Medium")
                        icon.name: "ic_fluent_arrow_fit_20_regular"
                    }

                    Rin.Button {
                        text: qsTr("Large")
                        icon.name: "ic_fluent_arrow_fit_24_regular"
                    }
                }
            }

            // Section: Icon Buttons
            Text {
                text: qsTr("Icon Buttons")
                font.pixelSize: 18
                font.bold: true
                color: colors ? colors.textColor : "#1b1b1b"
            }

            Column {
                spacing: 12
                width: parent.width

                Row {
                    spacing: 12

                    Rin.Button {
                        text: qsTr("With Icon")
                        icon.name: "ic_fluent_add_20_regular"
                    }

                    Rin.Button {
                        text: qsTr("Icon Only")
                        icon.name: "ic_fluent_search_20_regular"
                    }
                }
            }

            // Section: Toggle Button
            Text {
                text: qsTr("Toggle Button")
                font.pixelSize: 18
                font.bold: true
                color: colors ? colors.textColor : "#1b1b1b"
            }

            Row {
                spacing: 12

                Rin.Button {
                    text: qsTr("Toggle")
                    isFlat: true
                    checked: true
                }

                Rin.Button {
                    text: qsTr("Toggle Off")
                    isFlat: true
                    checked: false
                }
            }

            Item { height: 20 }
        }
    }
}
