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
                text: "Avatar"
                font.pixelSize: 32
                font.weight: Font.Bold
                color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
            }

            Text {
                text: "User profile pictures and avatars with customizable styles"
                font.pixelSize: 14
                color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.textSecondaryColor : "#6c6c6c"
            }
        }

        // Size Variants
        ColumnLayout {
            Layout.fillWidth: true
            Layout.leftMargin: 40
            Layout.rightMargin: 40
            spacing: 16

            Text {
                text: "Size Variants"
                font.pixelSize: 18
                font.weight: Font.Medium
                color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 120
                radius: 8
                color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.cardColor : "#ffffff"
                border.width: 1
                border.color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.cardBorderColor : "#e5e5e5"

                RowLayout {
                    anchors.centerIn: parent
                    spacing: 24

                    Rin.Avatar {
                        size: 32
                        text: "JD"
                    }

                    Rin.Avatar {
                        size: 48
                        text: "John Doe"
                    }

                    Rin.Avatar {
                        size: 64
                        text: "Jane Smith"
                    }

                    Rin.Avatar {
                        size: 96
                        text: "Alex Johnson"
                    }
                }
            }
        }

        // Initials Style
        ColumnLayout {
            Layout.fillWidth: true
            Layout.leftMargin: 40
            Layout.rightMargin: 40
            spacing: 16

            Text {
                text: "Initials Style"
                font.pixelSize: 18
                font.weight: Font.Medium
                color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 120
                radius: 8
                color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.cardColor : "#ffffff"
                border.width: 1
                border.color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.cardBorderColor : "#e5e5e5"

                RowLayout {
                    anchors.centerIn: parent
                    spacing: 24

                    Rin.Avatar {
                        size: 64
                        text: "A"
                    }

                    Rin.Avatar {
                        size: 64
                        text: "BC"
                    }

                    Rin.Avatar {
                        size: 64
                        text: "Jane Doe"
                    }

                    Rin.Avatar {
                        size: 64
                        text: "Dr. Smith"
                    }
                }
            }
        }

        // Icon Style
        ColumnLayout {
            Layout.fillWidth: true
            Layout.leftMargin: 40
            Layout.rightMargin: 40
            spacing: 16

            Text {
                text: "Icon Style (Default)"
                font.pixelSize: 18
                font.weight: Font.Medium
                color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
            }

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 100
                radius: 8
                color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.cardColor : "#ffffff"
                border.width: 1
                border.color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.cardBorderColor : "#e5e5e5"

                RowLayout {
                    anchors.centerIn: parent
                    spacing: 24

                    Rin.Avatar {
                        size: 48
                    }

                    Rin.Avatar {
                        size: 64
                    }

                    Rin.Avatar {
                        size: 80
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

            Rectangle {
                Layout.fillWidth: true
                Layout.preferredHeight: 100
                radius: 8
                color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.cardColor : "#ffffff"
                border.width: 1
                border.color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.cardBorderColor : "#e5e5e5"

                RowLayout {
                    anchors.centerIn: parent
                    spacing: 24

                    Rin.Avatar {
                        size: 48
                        text: "AB"
                        enabled: false
                    }

                    Rin.Avatar {
                        size: 64
                        text: "CD"
                        enabled: false
                    }

                    Rin.Avatar {
                        size: 80
                        enabled: false
                    }
                }
            }
        }
    }
}
