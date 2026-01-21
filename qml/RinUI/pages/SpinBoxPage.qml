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
                text: "SpinBox"
                font.pixelSize: 32
                font.weight: Font.Bold
                color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
            }

            Text {
                text: "Number input control with increment/decrement buttons"
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

            // Default SpinBox
            ColumnLayout {
                Layout.fillWidth: true
                spacing: 8

                Text {
                    text: "Default SpinBox (0-100)"
                    font.pixelSize: 16
                    font.weight: Font.Medium
                    color: themeManager.currentTheme && themeManager.currentTheme.colors
                        ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
                }

                Rin.SpinBox {
                    from: 0
                    to: 100
                    value: 50
                }
            }

            // SpinBox with label
            ColumnLayout {
                Layout.fillWidth: true
                spacing: 8

                Text {
                    text: "Quantity"
                    font.pixelSize: 14
                    font.weight: Font.Medium
                    color: themeManager.currentTheme && themeManager.currentTheme.colors
                        ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
                }

                Rin.SpinBox {
                    id: quantitySpinBox
                    from: 1
                    to: 99
                    value: 1
                }

                Text {
                    text: "Selected quantity: " + quantitySpinBox.value
                    font.pixelSize: 12
                    color: themeManager.currentTheme && themeManager.currentTheme.colors
                        ? themeManager.currentTheme.colors.textSecondaryColor : "#6c6c6c"
                }
            }

            // SpinBox with custom step
            ColumnLayout {
                Layout.fillWidth: true
                spacing: 8

                Text {
                    text: "SpinBox with custom step (step: 5)"
                    font.pixelSize: 16
                    font.weight: Font.Medium
                    color: themeManager.currentTheme && themeManager.currentTheme.colors
                        ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
                }

                Rin.SpinBox {
                    from: 0
                    to: 100
                    value: 0
                    stepSize: 5
                }
            }

            // Disabled SpinBox
            ColumnLayout {
                Layout.fillWidth: true
                spacing: 8

                Text {
                    text: "Disabled SpinBox"
                    font.pixelSize: 16
                    font.weight: Font.Medium
                    color: themeManager.currentTheme && themeManager.currentTheme.colors
                        ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
                }

                Rin.SpinBox {
                    from: 0
                    to: 100
                    value: 42
                    enabled: false
                }
            }
        }
    }
}
