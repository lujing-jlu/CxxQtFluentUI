import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../components" as Rin

Item {
    id: root
    property var navigationView: null

    property var colors: themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors : null
    property var typography: themeManager.currentTheme ? themeManager.currentTheme.typography : null

    property string title: qsTr("Settings")

    ScrollView {
        anchors.fill: parent
        anchors.margins: 20
        clip: true

        Column {
            width: parent.width
            spacing: 24

            // Section: Theme
            Text {
                text: qsTr("Theme")
                font.pixelSize: 18
                font.bold: true
                color: colors ? colors.textColor : "#1b1b1b"
            }

            Column {
                spacing: 12
                width: parent.width

                Rectangle {
                    width: parent.width
                    height: 60
                    radius: 8
                    color: colors ? colors.cardColor : "#ffffff"

                    Row {
                        anchors.centerIn: parent
                        spacing: 16

                        Rin.Icon {
                            anchors.verticalCenter: parent.verticalCenter
                            name: themeManager.isDark ? "ic_fluent_moon_20_regular" : "ic_fluent_weather_sunny_20_regular"
                            size: 20
                            color: colors ? colors.textColor : "#1b1b1b"
                        }

                        Text {
                            font.pixelSize: 16
                            color: colors ? colors.textColor : "#1b1b1b"
                            anchors.verticalCenter: parent.verticalCenter
                            text: themeManager.isDark ? qsTr("Dark Mode") : qsTr("Light Mode")
                        }

                        Rin.Button {
                            text: qsTr("Toggle Theme")
                            isPrimary: true
                            onClicked: themeManager.toggleTheme()
                        }
                    }
                }
            }

            // Section: Theme Selection
            Text {
                text: qsTr("Select Theme")
                font.pixelSize: 18
                font.bold: true
                color: colors ? colors.textColor : "#1b1b1b"
            }

            Row {
                spacing: 12

                Rin.Button {
                    text: qsTr("Light")
                    isPrimary: !themeManager.isDark
                    onClicked: themeManager.setTheme(themeManager.light)
                }

                Rin.Button {
                    text: qsTr("Dark")
                    isPrimary: themeManager.isDark
                    onClicked: themeManager.setTheme(themeManager.dark)
                }
            }

            // Section: Information
            Text {
                text: qsTr("Information")
                font.pixelSize: 18
                font.bold: true
                color: colors ? colors.textColor : "#1b1b1b"
            }

            Column {
                spacing: 8
                width: parent.width

                Text {
                    text: qsTr("CxxQt FluentUI Demo")
                    font.pixelSize: 16
                    font.bold: true
                    color: colors ? colors.textColor : "#1b1b1b"
                }

                Text {
                    text: qsTr("A Fluent Design UI library for CxxQt")
                    font.pixelSize: 14
                    color: colors ? colors.textSecondaryColor : Qt.alpha("#000000", 0.6)
                }

                Text {
                    text: qsTr("Based on Rin-UI design system")
                    font.pixelSize: 12
                    color: colors ? colors.textTertialyColor : Qt.alpha("#000000", 0.4)
                }
            }

            Item { height: 20 }
        }
    }
}
