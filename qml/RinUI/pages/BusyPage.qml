import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../themes"
import "../components" as Rin

Item {
    id: root
    width: parent ? parent.width : 800
    height: parent ? parent.height : 600

    ColumnLayout {
        anchors.fill: parent
        spacing: 20

        // Header
        ColumnLayout {
            Layout.fillWidth: true
            Layout.margins: 40
            spacing: 8

            Text {
                text: "BusyIndicator"
                font.pixelSize: 32
                font.weight: Font.Bold
                color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
            }

            Text {
                text: "Circular loading indicator for indeterminate operations"
                font.pixelSize: 14
                color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.textSecondaryColor : "#6c6c6c"
            }
        }

        // Demo Section
        ScrollView {
            Layout.fillWidth: true
            Layout.fillHeight: true
            clip: true

            ColumnLayout {
                width: parent.width
                spacing: 24

                ColumnLayout {
                    Layout.fillWidth: true
                    Layout.margins: 40
                    Layout.leftMargin: 40
                    Layout.rightMargin: 40
                    spacing: 16

                    Text {
                        text: "Different Sizes"
                        font.pixelSize: 18
                        font.weight: Font.Medium
                        color: themeManager.currentTheme && themeManager.currentTheme.colors
                            ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
                    }

                    RowLayout {
                        spacing: 40

                        Repeater {
                            model: [24, 32, 48, 64, 80]

                            ColumnLayout {
                                spacing: 12

                                Rin.BusyIndicator {
                                    size: modelData
                                    running: true
                                }

                                Text {
                                    text: modelData + "px"
                                    font.pixelSize: 12
                                    color: themeManager.currentTheme && themeManager.currentTheme.colors
                                        ? themeManager.currentTheme.colors.textSecondaryColor : "#6c6c6c"
                                    Layout.alignment: Qt.AlignHCenter
                                }
                            }
                        }
                    }
                }

                ColumnLayout {
                    Layout.fillWidth: true
                    Layout.margins: 40
                    Layout.leftMargin: 40
                    Layout.rightMargin: 40
                    spacing: 16

                    Text {
                        text: "Interactive Demo"
                        font.pixelSize: 18
                        font.weight: Font.Medium
                        color: themeManager.currentTheme && themeManager.currentTheme.colors
                            ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
                    }

                    RowLayout {
                        spacing: 16

                        Rin.BusyIndicator {
                            id: demoBusy
                            size: 64
                            running: isRunning
                        }

                        ColumnLayout {
                            spacing: 12

                            Rin.Button {
                                text: isRunning ? "Stop" : "Start"
                                isPrimary: true
                                onClicked: isRunning = !isRunning
                            }

                            property bool isRunning: true

                            Text {
                                text: "Status: " + (isRunning ? "Running" : "Stopped")
                                font.pixelSize: 14
                                color: themeManager.currentTheme && themeManager.currentTheme.colors
                                    ? themeManager.currentTheme.colors.textSecondaryColor : "#6c6c6c"
                            }
                        }
                    }
                }

                ColumnLayout {
                    Layout.fillWidth: true
                    Layout.margins: 40
                    Layout.leftMargin: 40
                    Layout.rightMargin: 40
                    spacing: 16

                    Text {
                        text: "Usage Examples"
                        font.pixelSize: 18
                        font.weight: Font.Medium
                        color: themeManager.currentTheme && themeManager.currentTheme.colors
                            ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
                    }

                    // Loading example
                    Rectangle {
                        Layout.fillWidth: true
                        height: 80
                        color: themeManager.currentTheme && themeManager.currentTheme.colors
                            ? (themeManager.currentTheme.isDark ? "#2d2d2d" : "#f5f5f5")
                            : "#f5f5f5"
                        radius: 4

                        RowLayout {
                            anchors.fill: parent
                            anchors.margins: 16
                            spacing: 16

                            Rin.BusyIndicator {
                                size: 32
                                running: true
                            }

                            ColumnLayout {
                                Layout.fillWidth: true
                                spacing: 4

                                Text {
                                    text: "Loading data..."
                                    font.pixelSize: 14
                                    font.weight: Font.Medium
                                    color: themeManager.currentTheme && themeManager.currentTheme.colors
                                        ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
                                }

                                Text {
                                    text: "Please wait while we fetch your content"
                                    font.pixelSize: 12
                                    color: themeManager.currentTheme && themeManager.currentTheme.colors
                                        ? themeManager.currentTheme.colors.textSecondaryColor : "#6c6c6c"
                                }
                            }
                        }
                    }

                    // Overlay example
                    Rectangle {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 200
                        color: themeManager.currentTheme && themeManager.currentTheme.colors
                            ? (themeManager.currentTheme.isDark ? "#202020" : "#ffffff")
                            : "#ffffff"
                        radius: 4
                        border.width: 1
                        border.color: themeManager.currentTheme && themeManager.currentTheme.colors
                            ? themeManager.currentTheme.colors.cardBorderColor : "#e5e5e5"

                        ColumnLayout {
                            anchors.centerIn: parent
                            spacing: 16

                            Rin.BusyIndicator {
                                size: 48
                                running: true
                                Layout.alignment: Qt.AlignHCenter
                            }

                            Text {
                                text: "Processing..."
                                font.pixelSize: 14
                                color: themeManager.currentTheme && themeManager.currentTheme.colors
                                    ? themeManager.currentTheme.colors.textSecondaryColor : "#6c6c6c"
                                Layout.alignment: Qt.AlignHCenter
                            }
                        }
                    }
                }
            }
        }
    }
}
