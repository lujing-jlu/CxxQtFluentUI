import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../themes"
import "../components" as Rin

ScrollView {
    id: root
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
                text: "ComboBox"
                font.pixelSize: 32
                font.weight: Font.Bold
                color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
            }

            Text {
                text: "Drop-down list of selectable items"
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

            // Default ComboBox
            ColumnLayout {
                Layout.fillWidth: true
                spacing: 8

                Text {
                    text: "Default ComboBox"
                    font.pixelSize: 16
                    font.weight: Font.Medium
                    color: themeManager.currentTheme && themeManager.currentTheme.colors
                        ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
                }

                Rin.ComboBox {
                    Layout.fillWidth: true
                    model: ["Option 1", "Option 2", "Option 3", "Option 4"]
                }
            }

            // ComboBox with label
            ColumnLayout {
                Layout.fillWidth: true
                spacing: 8

                Text {
                    text: "Select an option"
                    font.pixelSize: 14
                    font.weight: Font.Medium
                    color: themeManager.currentTheme && themeManager.currentTheme.colors
                        ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
                }

                Rin.ComboBox {
                    Layout.fillWidth: true
                    model: ["Apple", "Banana", "Cherry", "Date", "Elderberry"]
                }
            }

            // Editable ComboBox
            ColumnLayout {
                Layout.fillWidth: true
                spacing: 8

                Text {
                    text: "Editable ComboBox"
                    font.pixelSize: 16
                    font.weight: Font.Medium
                    color: themeManager.currentTheme && themeManager.currentTheme.colors
                        ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
                }

                Rin.ComboBox {
                    Layout.fillWidth: true
                    editable: true
                    model: ["Red", "Green", "Blue", "Yellow"]
                }
            }

            // Disabled ComboBox
            ColumnLayout {
                Layout.fillWidth: true
                spacing: 8

                Text {
                    text: "Disabled ComboBox"
                    font.pixelSize: 16
                    font.weight: Font.Medium
                    color: themeManager.currentTheme && themeManager.currentTheme.colors
                        ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
                }

                Rin.ComboBox {
                    Layout.fillWidth: true
                    enabled: false
                    model: ["Option 1", "Option 2", "Option 3"]
                    currentIndex: 1
                }
            }
        }
    }
}
