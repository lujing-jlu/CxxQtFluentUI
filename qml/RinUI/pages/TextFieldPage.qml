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

    ColumnLayout {
        width: parent.width
        spacing: 20

        // Header
        ColumnLayout {
            Layout.fillWidth: true
            Layout.margins: 40
            spacing: 8

            Text {
                text: "TextField"
                font.pixelSize: 32
                font.weight: Font.Bold
                color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
            }

            Text {
                text: "Text input control for user input"
                font.pixelSize: 14
                color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.textSecondaryColor : "#6c6c6c"
            }
        }

        // Demo Section
        ColumnLayout {
            Layout.fillWidth: true
            Layout.leftMargin: 40
            Layout.rightMargin: 40
            spacing: 24

            // Default TextField
            ColumnLayout {
                Layout.fillWidth: true
                spacing: 8

                Text {
                    text: "Default TextField"
                    font.pixelSize: 16
                    font.weight: Font.Medium
                    color: themeManager.currentTheme && themeManager.currentTheme.colors
                        ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
                }

                Rin.TextField {
                    Layout.fillWidth: true
                    placeholderText: "Enter text here..."
                }
            }

            // TextField with label
            ColumnLayout {
                Layout.fillWidth: true
                spacing: 8

                Text {
                    text: "Name"
                    font.pixelSize: 14
                    font.weight: Font.Medium
                    color: themeManager.currentTheme && themeManager.currentTheme.colors
                        ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
                }

                Rin.TextField {
                    id: nameTextField
                    Layout.fillWidth: true
                    placeholderText: "Enter your name"
                }

                Text {
                    text: "You entered: " + nameTextField.text
                    font.pixelSize: 12
                    color: themeManager.currentTheme && themeManager.currentTheme.colors
                        ? themeManager.currentTheme.colors.textSecondaryColor : "#6c6c6c"
                }
            }

            // Disabled TextField
            ColumnLayout {
                Layout.fillWidth: true
                spacing: 8

                Text {
                    text: "Disabled TextField"
                    font.pixelSize: 16
                    font.weight: Font.Medium
                    color: themeManager.currentTheme && themeManager.currentTheme.colors
                        ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
                }

                Rin.TextField {
                    Layout.fillWidth: true
                    enabled: false
                    text: "Disabled text field"
                }
            }

            // Password TextField
            ColumnLayout {
                Layout.fillWidth: true
                spacing: 8

                Text {
                    text: "Password TextField"
                    font.pixelSize: 16
                    font.weight: Font.Medium
                    color: themeManager.currentTheme && themeManager.currentTheme.colors
                        ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
                }

                Rin.TextField {
                    Layout.fillWidth: true
                    placeholderText: "Enter password"
                    echoMode: TextInput.Password
                }
            }
        }
    }
}
