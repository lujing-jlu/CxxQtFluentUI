import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../themes"
import "../components" as Rin

ScrollView {
    id: root
    property var navigationView: null
    Layout.fillWidth: true
    Layout.fillHeight: true
    clip: true
    contentWidth: availableWidth

    ColumnLayout {
        width: parent.width
        spacing: 24

        // Header
        ColumnLayout {
            Layout.fillWidth: true
            Layout.margins: 40
            spacing: 8

            Text {
                text: "SettingCard"
                font.pixelSize: 32
                font.weight: Font.Bold
                color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
            }

            Text {
                text: "Setting cards for organized settings and configuration pages"
                font.pixelSize: 14
                color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.textSecondaryColor : "#6c6c6c"
            }
        }

        // Basic Setting Cards
        ColumnLayout {
            Layout.fillWidth: true
            Layout.leftMargin: 40
            Layout.rightMargin: 40
            spacing: 16

            Text {
                text: "Basic Setting Cards"
                font.pixelSize: 18
                font.weight: Font.Medium
                color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
            }

            ColumnLayout {
                Layout.fillWidth: true
                spacing: 8

                Rin.SettingCard {
                    Layout.fillWidth: true
                    title: "Enable Notifications"
                    description: "Receive notifications about important events"

                    Rin.Switch {
                        checked: true
                    }
                }

                Rin.SettingCard {
                    Layout.fillWidth: true
                    title: "Auto Save"
                    description: "Automatically save your work every 5 minutes"

                    Rin.Switch {
                        checked: false
                    }
                }

                Rin.SettingCard {
                    Layout.fillWidth: true
                    title: "Dark Mode"
                    description: "Use dark theme for the application"

                    Rin.Switch {
                        checked: false
                    }
                }
            }
        }

        // With Icon
        ColumnLayout {
            Layout.fillWidth: true
            Layout.leftMargin: 40
            Layout.rightMargin: 40
            spacing: 16

            Text {
                text: "Setting Cards with Icons"
                font.pixelSize: 18
                font.weight: Font.Medium
                color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
            }

            ColumnLayout {
                Layout.fillWidth: true
                spacing: 8

                Rin.SettingCard {
                    Layout.fillWidth: true
                    title: "Wi-Fi"
                    description: "Connected to Home Network"
                    icon.name: "ic_fluent_wifi_20_regular"

                    Rin.Switch {
                        checked: true
                    }
                }

                Rin.SettingCard {
                    Layout.fillWidth: true
                    title: "Bluetooth"
                    description: "Discoverable as \"My Device\""
                    icon.name: "ic_fluent_bluetooth_20_regular"

                    Rin.Switch {
                        checked: true
                    }
                }

                Rin.SettingCard {
                    Layout.fillWidth: true
                    title: "Location Services"
                    description: "Allow apps to access your location"
                    icon.name: "ic_fluent_location_20_regular"

                    Rin.Switch {
                        checked: false
                    }
                }
            }
        }

        // With Action Buttons
        ColumnLayout {
            Layout.fillWidth: true
            Layout.leftMargin: 40
            Layout.rightMargin: 40
            spacing: 16

            Text {
                text: "Setting Cards with Actions"
                font.pixelSize: 18
                font.weight: Font.Medium
                color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
            }

            ColumnLayout {
                Layout.fillWidth: true
                spacing: 8

                Rin.SettingCard {
                    Layout.fillWidth: true
                    title: "Account"
                    description: "user@example.com"

                    Rin.Button {
                        text: "Manage"
                        isFlat: true
                    }
                }

                Rin.SettingCard {
                    Layout.fillWidth: true
                    title: "Storage"
                    description: "45.2 GB of 128 GB used"

                    Rin.Button {
                        text: "Clean Up"
                        isFlat: true
                    }
                }

                Rin.SettingCard {
                    Layout.fillWidth: true
                    title: "Language"
                    description: "English (United States)"

                    Rin.Button {
                        text: "Change"
                        isFlat: true
                    }
                }
            }
        }

        // With ComboBox
        ColumnLayout {
            Layout.fillWidth: true
            Layout.leftMargin: 40
            Layout.rightMargin: 40
            spacing: 16

            Text {
                text: "Setting Cards with Selection"
                font.pixelSize: 18
                font.weight: Font.Medium
                color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
            }

            ColumnLayout {
                Layout.fillWidth: true
                spacing: 8

                Rin.SettingCard {
                    Layout.fillWidth: true
                    title: "Theme"
                    description: "Choose your preferred theme"

                    Rin.ComboBox {
                        implicitWidth: 150
                        model: ["Light", "Dark", "System"]
                        currentIndex: 0
                    }
                }

                Rin.SettingCard {
                    Layout.fillWidth: true
                    title: "Font Size"
                    description: "Adjust the text size"

                    Rin.ComboBox {
                        implicitWidth: 150
                        model: ["Small", "Medium", "Large"]
                        currentIndex: 1
                    }
                }
            }
        }

        // Disabled State
        ColumnLayout {
            Layout.fillWidth: true
            Layout.leftMargin: 40
            Layout.rightMargin: 40
            Layout.bottomMargin: 40
            spacing: 16

            Text {
                text: "Disabled State"
                font.pixelSize: 18
                font.weight: Font.Medium
                color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
            }

            ColumnLayout {
                Layout.fillWidth: true
                spacing: 8

                Rin.SettingCard {
                    Layout.fillWidth: true
                    title: "Disabled Setting"
                    description: "This setting is currently disabled"
                    enabled: false

                    Rin.Switch {
                        checked: false
                        enabled: false
                    }
                }

                Rin.SettingCard {
                    Layout.fillWidth: true
                    title: "Premium Feature"
                    description: "Upgrade to unlock this feature"
                    icon.name: "ic_fluent_star_20_regular"
                    enabled: false

                    Rin.Button {
                        text: "Upgrade"
                        enabled: false
                    }
                }
            }
        }
    }
}
