import QtQuick 2.15
import QtQuick.Layouts 1.15
import "../components" as Rin

ControlPage {
    id: page
    title: qsTr("SettingCard")

    Text {
        Layout.fillWidth: true
        wrapMode: Text.WordWrap
        text: qsTr("Setting cards help organize settings and configuration pages.")
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            text: qsTr("Basic SettingCards.")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        Rin.Frame {
            Layout.fillWidth: true

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 12
                spacing: 8

                Rin.SettingCard {
                    Layout.fillWidth: true
                    title: qsTr("Enable Notifications")
                    description: qsTr("Receive notifications about important events")
                    Rin.Switch { checked: true }
                }

                Rin.SettingCard {
                    Layout.fillWidth: true
                    title: qsTr("Auto Save")
                    description: qsTr("Automatically save your work every 5 minutes")
                    Rin.Switch { checked: false }
                }

                Rin.SettingCard {
                    Layout.fillWidth: true
                    title: qsTr("Dark Mode")
                    description: qsTr("Use dark theme for the application")
                    Rin.Switch { checked: false }
                }
            }
        }
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            text: qsTr("SettingCards with icons.")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        Rin.Frame {
            Layout.fillWidth: true

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 12
                spacing: 8

                Rin.SettingCard {
                    Layout.fillWidth: true
                    title: qsTr("Wi‑Fi")
                    description: qsTr("Connected to Home Network")
                    icon.name: "ic_fluent_wifi_20_regular"
                    Rin.Switch { checked: true }
                }

                Rin.SettingCard {
                    Layout.fillWidth: true
                    title: qsTr("Bluetooth")
                    description: qsTr("Discoverable as \"My Device\"")
                    icon.name: "ic_fluent_bluetooth_20_regular"
                    Rin.Switch { checked: true }
                }

                Rin.SettingCard {
                    Layout.fillWidth: true
                    title: qsTr("Location Services")
                    description: qsTr("Allow apps to access your location")
                    icon.name: "ic_fluent_location_20_regular"
                    Rin.Switch { checked: false }
                }
            }
        }
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            text: qsTr("SettingCards with actions.")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        Rin.Frame {
            Layout.fillWidth: true

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 12
                spacing: 8

                Rin.SettingCard {
                    Layout.fillWidth: true
                    title: qsTr("Account")
                    description: qsTr("user@example.com")
                    Rin.Button { text: qsTr("Manage"); isFlat: true }
                }

                Rin.SettingCard {
                    Layout.fillWidth: true
                    title: qsTr("Storage")
                    description: qsTr("45.2 GB of 128 GB used")
                    Rin.Button { text: qsTr("Clean Up"); isFlat: true }
                }
            }
        }
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            text: qsTr("SettingCards with selections.")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        Rin.Frame {
            Layout.fillWidth: true

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: 12
                spacing: 8

                Rin.SettingCard {
                    Layout.fillWidth: true
                    title: qsTr("Theme")
                    description: qsTr("Choose your preferred theme")
                    Rin.ComboBox {
                        implicitWidth: 150
                        model: [qsTr("Light"), qsTr("Dark"), qsTr("System")]
                        currentIndex: 0
                    }
                }

                Rin.SettingCard {
                    Layout.fillWidth: true
                    title: qsTr("Font Size")
                    description: qsTr("Adjust the text size")
                    Rin.ComboBox {
                        implicitWidth: 150
                        model: [qsTr("Small"), qsTr("Medium"), qsTr("Large")]
                        currentIndex: 1
                    }
                }
            }
        }
    }
}

