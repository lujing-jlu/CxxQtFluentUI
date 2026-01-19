import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../themes"

Item {
    id: root
    Layout.fillWidth: true
    Layout.fillHeight: true

    ScrollView {
        anchors.fill: parent
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
                    text: "TextArea"
                    font.pixelSize: 32
                    font.weight: Font.Bold
                    color: themeManager.currentTheme && themeManager.currentTheme.colors
                        ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
                }

                Text {
                    text: "Multi-line text input control"
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

                // Default TextArea
                ColumnLayout {
                    Layout.fillWidth: true
                    spacing: 8

                    Text {
                        text: "Default TextArea"
                        font.pixelSize: 16
                        font.weight: Font.Medium
                        color: themeManager.currentTheme && themeManager.currentTheme.colors
                            ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
                    }

                    TextArea {
                        Layout.fillWidth: true
                        placeholderText: "Enter multiple lines of text here..."
                        implicitHeight: 120
                    }
                }

                // Disabled TextArea
                ColumnLayout {
                    Layout.fillWidth: true
                    spacing: 8

                    Text {
                        text: "Disabled TextArea"
                        font.pixelSize: 16
                        font.weight: Font.Medium
                        color: themeManager.currentTheme && themeManager.currentTheme.colors
                            ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
                    }

                    TextArea {
                        Layout.fillWidth: true
                        enabled: false
                        text: "This is a disabled text area.\nYou cannot edit this content."
                        implicitHeight: 80
                    }
                }
            }
        }
    }
}
