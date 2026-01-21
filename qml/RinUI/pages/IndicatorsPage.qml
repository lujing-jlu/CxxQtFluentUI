import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../themes"
import "../components" as Rin

ScrollView {
    id: root
    property var navigationView: null
    width: parent ? parent.width : 800
    height: parent ? parent.height : 600

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
                text: "Indicators"
                font.pixelSize: 32
                font.weight: Font.Bold
                color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
            }

            Text {
                text: "Progress and status indicators"
                font.pixelSize: 14
                color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.textSecondaryColor : "#6c6c6c"
            }
        }

        // Demo Section
        ColumnLayout {
            Layout.fillWidth: true
            Layout.margins: 40
            Layout.leftMargin: 40
            Layout.rightMargin: 40
            spacing: 24

            // ProgressBar examples
            ColumnLayout {
                Layout.fillWidth: true
                spacing: 16

                Text {
                    text: "ProgressBar"
                    font.pixelSize: 20
                    font.weight: Font.Medium
                    color: themeManager.currentTheme && themeManager.currentTheme.colors
                        ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
                }

                // Determinate progress
                ColumnLayout {
                    Layout.fillWidth: true
                    spacing: 8

                    Rin.ProgressBar {
                        Layout.fillWidth: true
                        value: 0.3
                    }

                    Text {
                        text: "30% complete"
                        font.pixelSize: 12
                        color: themeManager.currentTheme && themeManager.currentTheme.colors
                            ? themeManager.currentTheme.colors.textSecondaryColor : "#6c6c6c"
                    }
                }

                // Different progress values
                ColumnLayout {
                    Layout.fillWidth: true
                    spacing: 8

                    Text {
                        text: "Various progress states"
                        font.pixelSize: 14
                        font.weight: Font.Medium
                        color: themeManager.currentTheme && themeManager.currentTheme.colors
                            ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
                    }

                    Rin.ProgressBar {
                        Layout.fillWidth: true
                        value: 0.0
                        
                    }

                    Rin.ProgressBar {
                        Layout.fillWidth: true
                        value: 0.25
                        
                    }

                    Rin.ProgressBar {
                        Layout.fillWidth: true
                        value: 0.5
                        
                    }

                    Rin.ProgressBar {
                        Layout.fillWidth: true
                        value: 0.75
                        
                    }

                    Rin.ProgressBar {
                        Layout.fillWidth: true
                        value: 1.0
                        
                    }
                }

                // Indeterminate progress
                ColumnLayout {
                    Layout.fillWidth: true
                    spacing: 8

                    Text {
                        text: "Indeterminate (loading state)"
                        font.pixelSize: 14
                        font.weight: Font.Medium
                        color: themeManager.currentTheme && themeManager.currentTheme.colors
                            ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
                    }

                    Rin.ProgressBar {
                        Layout.fillWidth: true
                        indeterminate: true
                    }
                }
            }

            // ProgressRing examples
            ColumnLayout {
                Layout.fillWidth: true
                spacing: 16

                Text {
                    text: "ProgressRing"
                    font.pixelSize: 20
                    font.weight: Font.Medium
                    color: themeManager.currentTheme && themeManager.currentTheme.colors
                        ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
                }

                RowLayout {
                    spacing: 24

                    // Different sizes
                    ColumnLayout {
                        spacing: 8

                        Rin.ProgressRing {
                            size: 32
                            value: 0.3
                        }

                        Text {
                            text: "32px"
                            font.pixelSize: 12
                            color: themeManager.currentTheme && themeManager.currentTheme.colors
                                ? themeManager.currentTheme.colors.textSecondaryColor : "#6c6c6c"
                        }
                    }

                    ColumnLayout {
                        spacing: 8

                        Rin.ProgressRing {
                            size: 48
                            value: 0.5
                        }

                        Text {
                            text: "48px"
                            font.pixelSize: 12
                            color: themeManager.currentTheme && themeManager.currentTheme.colors
                                ? themeManager.currentTheme.colors.textSecondaryColor : "#6c6c6c"
                        }
                    }

                    ColumnLayout {
                        spacing: 8

                        Rin.ProgressRing {
                            size: 64
                            value: 0.75
                        }

                        Text {
                            text: "64px"
                            font.pixelSize: 12
                            color: themeManager.currentTheme && themeManager.currentTheme.colors
                                ? themeManager.currentTheme.colors.textSecondaryColor : "#6c6c6c"
                        }
                    }
                }

                // Indeterminate rings
                RowLayout {
                    spacing: 24

                    ColumnLayout {
                        spacing: 8

                        Rin.ProgressRing {
                            size: 48
                            indeterminate: true
                        }

                        Text {
                            text: "Indeterminate"
                            font.pixelSize: 12
                            color: themeManager.currentTheme && themeManager.currentTheme.colors
                                ? themeManager.currentTheme.colors.textSecondaryColor : "#6c6c6c"
                        }
                    }

                    ColumnLayout {
                        spacing: 8

                        Rin.ProgressRing {
                            size: 48
                            indeterminate: true
                            strokeWidth: 3
                        }

                        Text {
                            text: "Thick stroke"
                            font.pixelSize: 12
                            color: themeManager.currentTheme && themeManager.currentTheme.colors
                                ? themeManager.currentTheme.colors.textSecondaryColor : "#6c6c6c"
                        }
                    }
                }
            }

            // BusyIndicator examples
            ColumnLayout {
                Layout.fillWidth: true
                spacing: 16

                Text {
                    text: "BusyIndicator"
                    font.pixelSize: 20
                    font.weight: Font.Medium
                    color: themeManager.currentTheme && themeManager.currentTheme.colors
                        ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
                }

                RowLayout {
                    spacing: 24

                    ColumnLayout {
                        spacing: 8

                        Rin.BusyIndicator {
                            size: 32
                            running: true
                        }

                        Text {
                            text: "32px"
                            font.pixelSize: 12
                            color: themeManager.currentTheme && themeManager.currentTheme.colors
                                ? themeManager.currentTheme.colors.textSecondaryColor : "#6c6c6c"
                        }
                    }

                    ColumnLayout {
                        spacing: 8

                        Rin.BusyIndicator {
                            size: 48
                            running: true
                        }

                        Text {
                            text: "48px"
                            font.pixelSize: 12
                            color: themeManager.currentTheme && themeManager.currentTheme.colors
                                ? themeManager.currentTheme.colors.textSecondaryColor : "#6c6c6c"
                        }
                    }

                    ColumnLayout {
                        spacing: 8

                        Rin.BusyIndicator {
                            size: 64
                            running: true
                        }

                        Text {
                            text: "64px"
                            font.pixelSize: 12
                            color: themeManager.currentTheme && themeManager.currentTheme.colors
                                ? themeManager.currentTheme.colors.textSecondaryColor : "#6c6c6c"
                        }
                    }
                }
            }
        }
    }
}
