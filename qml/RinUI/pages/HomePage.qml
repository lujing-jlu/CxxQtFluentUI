import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../components" as Rin

Item {
    id: root

    property var colors: themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors : null
    property var typography: themeManager.currentTheme ? themeManager.currentTheme.typography : null

    property string title: qsTr("Home")

    Column {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 20

        // Welcome header
        Rectangle {
            width: parent.width
            height: 120
            radius: 8
            color: colors ? colors.primaryColor : "#0078D4"

            Column {
                anchors.centerIn: parent
                spacing: 8

                Text {
                    text: qsTr("CxxQt FluentUI")
                    font.pixelSize: 28
                    font.bold: true
                    color: "#ffffff"
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Text {
                    text: qsTr("A Fluent Design UI library for CxxQt")
                    font.pixelSize: 14
                    color: "#ffffff"
                    opacity: 0.9
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
        }

        // Quick links
        Text {
            text: qsTr("Quick Links")
            font.pixelSize: 20
            font.bold: true
            color: colors ? colors.textColor : "#1b1b1b"
        }

        Text {
            text: qsTr("Use the sidebar navigation to explore different pages:")
            font.pixelSize: 14
            color: colors ? colors.textSecondaryColor : Qt.alpha("#000000", 0.6)
            wrapMode: Text.WordWrap
            width: parent.width
        }

        Column {
            spacing: 12
            width: parent.width

            Repeater {
                model: [
                    { title: qsTr("Buttons"), desc: qsTr("Button controls") },
                    { title: qsTr("Inputs"), desc: qsTr("Input controls") },
                    { title: qsTr("Settings"), desc: qsTr("Application settings") },
                ]

                delegate: Rectangle {
                    width: parent.width
                    height: 50
                    radius: 6
                    color: colors ? colors.cardColor : "#ffffff"

                    Row {
                        anchors.fill: parent
                        anchors.leftMargin: 16
                        spacing: 12
                        anchors.verticalCenter: parent.verticalCenter

                        Column {
                            anchors.verticalCenter: parent.verticalCenter
                            spacing: 2

                            Text {
                                text: modelData.title
                                font.pixelSize: 14
                                font.bold: true
                                color: colors ? colors.textColor : "#1b1b1b"
                            }

                            Text {
                                text: modelData.desc
                                font.pixelSize: 12
                                color: colors ? colors.textSecondaryColor : Qt.alpha("#000000", 0.6)
                            }
                        }
                    }
                }
            }
        }

        Item { Layout.fillHeight: true }
    }
}
