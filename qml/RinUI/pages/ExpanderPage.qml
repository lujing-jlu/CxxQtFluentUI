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
                text: "Expander"
                font.pixelSize: 32
                font.weight: Font.Bold
                color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
            }

            Text {
                text: "Collapsible content areas with smooth animations"
                font.pixelSize: 14
                color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.textSecondaryColor : "#6c6c6c"
            }
        }

        // Basic Expander
        ColumnLayout {
            Layout.fillWidth: true
            Layout.leftMargin: 40
            Layout.rightMargin: 40
            spacing: 16

            Text {
                text: "Basic Expander"
                font.pixelSize: 18
                font.weight: Font.Medium
                color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
            }

            Rin.Expander {
                Layout.fillWidth: true
                text: "Click to expand"
                radius: 8

                Rin.Frame {
                    Layout.fillWidth: true
                    height: 100
                    color: "transparent"

                    ColumnLayout {
                        anchors.centerIn: parent
                        spacing: 8

                        Text {
                            text: "Expanded Content"
                            font.pixelSize: 16
                            font.weight: Font.Medium
                            color: themeManager.currentTheme && themeManager.currentTheme.colors
                                ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
                        }

                        Text {
                            text: "This is the content that appears when you expand the expander."
                            font.pixelSize: 14
                            color: themeManager.currentTheme && themeManager.currentTheme.colors
                                ? themeManager.currentTheme.colors.textSecondaryColor : "#6c6c6c"
                        }
                    }
                }
            }
        }

        // Multiple Expanders
        ColumnLayout {
            Layout.fillWidth: true
            Layout.leftMargin: 40
            Layout.rightMargin: 40
            spacing: 12

            Text {
                text: "Multiple Expanders"
                font.pixelSize: 18
                font.weight: Font.Medium
                color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
            }

            Rin.Expander {
                Layout.fillWidth: true
                text: "Section 1"
                radius: 8

                ColumnLayout {
                    spacing: 8
                    Text {
                        text: "Content for section 1"
                        font.pixelSize: 14
                        color: themeManager.currentTheme && themeManager.currentTheme.colors
                            ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
                    }
                }
            }

            Rin.Expander {
                Layout.fillWidth: true
                text: "Section 2"
                radius: 8

                ColumnLayout {
                    spacing: 8
                    Text {
                        text: "Content for section 2"
                        font.pixelSize: 14
                        color: themeManager.currentTheme && themeManager.currentTheme.colors
                            ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
                    }
                    Rin.Button {
                        text: "Action Button"
                    }
                }
            }

            Rin.Expander {
                Layout.fillWidth: true
                text: "Section 3"
                radius: 8

                ColumnLayout {
                    spacing: 8
                    RowLayout {
                        spacing: 8
                        Rin.CheckBox {
                            text: "Option 1"
                        }
                        Rin.CheckBox {
                            text: "Option 2"
                        }
                    }
                    Rin.TextField {
                        Layout.fillWidth: true
                        placeholderText: "Enter text..."
                    }
                }
            }
        }

        // Rich Content Expander
        ColumnLayout {
            Layout.fillWidth: true
            Layout.leftMargin: 40
            Layout.rightMargin: 40
            spacing: 16

            Text {
                text: "Rich Content Expander"
                font.pixelSize: 18
                font.weight: Font.Medium
                color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
            }

            Rin.Expander {
                Layout.fillWidth: true
                text: "Advanced Settings"
                radius: 8

                ColumnLayout {
                    spacing: 16

                    RowLayout {
                        spacing: 16
                        Text {
                            text: "Enable Feature:"
                            font.pixelSize: 14
                            color: themeManager.currentTheme && themeManager.currentTheme.colors
                                ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
                        }
                        Rin.Switch {
                            checked: true
                        }
                    }

                    Rin.Slider {
                        Layout.fillWidth: true
                        from: 0
                        to: 100
                        value: 50
                    }

                    Rin.ComboBox {
                        Layout.fillWidth: true
                        model: ["Option 1", "Option 2", "Option 3"]
                        currentIndex: 0
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

            Rin.Expander {
                Layout.fillWidth: true
                text: "Disabled Expander"
                enabled: false
                radius: 8

                Text {
                    text: "This content cannot be accessed"
                    font.pixelSize: 14
                    color: themeManager.currentTheme && themeManager.currentTheme.colors
                        ? themeManager.currentTheme.colors.textSecondaryColor : "#6c6c6c"
                }
            }
        }
    }
}
