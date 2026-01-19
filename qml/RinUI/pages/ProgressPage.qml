import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../themes"
import "../components" as Rin

Item {
    id: root
    width: parent ? parent.width : 800
    height: parent ? parent.height : 600

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
                    text: "ProgressBar"
                    font.pixelSize: 32
                    font.weight: Font.Bold
                    color: themeManager.currentTheme && themeManager.currentTheme.colors
                        ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
                }

                Text {
                    text: "Linear progress indicator showing completion status"
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

                // Determinate progress
                ColumnLayout {
                    Layout.fillWidth: true
                    spacing: 16

                    Text {
                        text: "Determinate Progress"
                        font.pixelSize: 18
                        font.weight: Font.Medium
                        color: themeManager.currentTheme && themeManager.currentTheme.colors
                            ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
                    }

                    // Interactive demo
                    ColumnLayout {
                        Layout.fillWidth: true
                        spacing: 12

                        RowLayout {
                            spacing: 12

                            Rin.Button {
                                text: "-10%"
                                onClicked: demoProgressBar.value = Math.max(0, demoProgressBar.value - 0.1)
                            }

                            Rin.Button {
                                text: "+10%"
                                onClicked: demoProgressBar.value = Math.min(1, demoProgressBar.value + 0.1)
                            }

                            Text {
                                text: Math.round(demoProgressBar.value * 100) + "%"
                                font.pixelSize: 14
                                color: themeManager.currentTheme && themeManager.currentTheme.colors
                                    ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
                            }
                        }

                        Rin.ProgressBar {
                            id: demoProgressBar
                            Layout.fillWidth: true
                            value: 0.5
                            label: Math.round(value * 100) + "%"
                        }
                    }

                    // Different progress values
                    ColumnLayout {
                        Layout.fillWidth: true
                        spacing: 8

                        Text {
                            text: "Various progress states"
                            font.pixelSize: 14
                            color: themeManager.currentTheme && themeManager.currentTheme.colors
                                ? themeManager.currentTheme.colors.textSecondaryColor : "#6c6c6c"
                        }

                        Repeater {
                            model: [0.0, 0.25, 0.5, 0.75, 1.0]

                            ColumnLayout {
                                Layout.fillWidth: true
                                spacing: 4

                                Rin.ProgressBar {
                                    Layout.fillWidth: true
                                    value: modelData
                                    label: Math.round(modelData * 100) + "%"
                                }
                            }
                        }
                    }
                }

                // Indeterminate progress
                ColumnLayout {
                    Layout.fillWidth: true
                    spacing: 16

                    Text {
                        text: "Indeterminate Progress"
                        font.pixelSize: 18
                        font.weight: Font.Medium
                        color: themeManager.currentTheme && themeManager.currentTheme.colors
                            ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
                    }

                    ColumnLayout {
                        Layout.fillWidth: true
                        spacing: 12

                        Rin.ProgressBar {
                            Layout.fillWidth: true
                            indeterminate: true
                        }

                        Text {
                            text: "Use indeterminate state when progress cannot be determined"
                            font.pixelSize: 12
                            color: themeManager.currentTheme && themeManager.currentTheme.colors
                                ? themeManager.currentTheme.colors.textSecondaryColor : "#6c6c6c"
                        }
                    }
                }

                // Disabled state
                ColumnLayout {
                    Layout.fillWidth: true
                    spacing: 16

                    Text {
                        text: "Disabled State"
                        font.pixelSize: 18
                        font.weight: Font.Medium
                        color: themeManager.currentTheme && themeManager.currentTheme.colors
                            ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
                    }

                    Rin.ProgressBar {
                        Layout.fillWidth: true
                        value: 0.6
                        enabled: false
                    }
                }
            }
        }
    }
}
