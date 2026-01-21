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

        // Hero Section
        Rectangle {
            Layout.fillWidth: true
            Layout.margins: 40
            height: 180
            radius: 12
            color: themeManager.currentTheme && themeManager.currentTheme.colors
                ? themeManager.currentTheme.colors.primaryColor : "#0078D4"

            RowLayout {
                anchors.fill: parent
                anchors.margins: 32
                spacing: 24

                ColumnLayout {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    spacing: 8

                    Text {
                        text: "CxxQt FluentUI"
                        font.pixelSize: 36
                        font.weight: Font.Bold
                        color: "#ffffff"
                    }

                    Text {
                        text: "A modern Fluent Design UI library for CxxQt"
                        font.pixelSize: 16
                        color: Qt.alpha("#ffffff", 0.9)
                        Layout.fillWidth: true
                    }

                    Item { Layout.fillHeight: true }

                    RowLayout {
                        spacing: 12

                        Rin.Button {
                            text: "Get Started"
                            isPrimary: true
                            onClicked: {
                                // Navigate to Buttons page
                                console.log("Get Started clicked")
                            }
                        }

                        Rin.Button {
                            text: "Documentation"
                            isFlat: true
                        }
                    }
                }
            }
        }

        // Features Section
        ColumnLayout {
            Layout.fillWidth: true
            Layout.leftMargin: 40
            Layout.rightMargin: 40
            spacing: 16

            Text {
                text: "Features"
                font.pixelSize: 24
                font.weight: Font.Bold
                color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
            }

            GridLayout {
                Layout.fillWidth: true
                columns: 3
                columnSpacing: 16
                rowSpacing: 16

                Repeater {
                    model: [
                        {
                            title: "Fluent Design",
                            desc: "Microsoft's Fluent Design System",
                            icon: "ic_fluent_design_ideas_20_regular"
                        },
                        {
                            title: "Dark Mode",
                            desc: "Full dark theme support",
                            icon: "ic_fluent_weather_moon_20_regular"
                        },
                        {
                            title: "Navigation",
                            desc: "Built-in navigation system",
                            icon: "ic_fluent_navigation_20_regular"
                        },
                        {
                            title: "Components",
                            desc: "Rich set of UI components",
                            icon: "ic_fluent_apps_list_20_regular"
                        },
                        {
                            title: "Responsive",
                            desc: "Adapts to different screen sizes",
                            icon: "ic_fluent_phone_20_regular"
                        },
                        {
                            title: "Customizable",
                            desc: "Easy to customize and extend",
                            icon: "ic_fluent_color_20_regular"
                        }
                    ]

                    delegate: Rectangle {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 120
                        radius: 8
                        color: themeManager.currentTheme && themeManager.currentTheme.colors
                            ? themeManager.currentTheme.colors.cardColor : "#ffffff"
                        border.width: 1
                        border.color: themeManager.currentTheme && themeManager.currentTheme.colors
                            ? themeManager.currentTheme.colors.cardBorderColor : "#e5e5e5"

                        ColumnLayout {
                            anchors.fill: parent
                            anchors.margins: 16
                            spacing: 8

                            Rin.Icon {
                                size: 32
                                name: modelData.icon
                                color: themeManager.currentTheme && themeManager.currentTheme.colors
                                    ? themeManager.currentTheme.colors.primaryColor : "#0078D4"
                            }

                            Text {
                                text: modelData.title
                                font.pixelSize: 16
                                font.weight: Font.Medium
                                color: themeManager.currentTheme && themeManager.currentTheme.colors
                                    ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
                            }

                            Text {
                                text: modelData.desc
                                font.pixelSize: 12
                                color: themeManager.currentTheme && themeManager.currentTheme.colors
                                    ? themeManager.currentTheme.colors.textSecondaryColor : "#6c6c6c"
                                Layout.fillWidth: true
                                wrapMode: Text.WordWrap
                            }
                        }
                    }
                }
            }
        }

        // Component Preview Section
        ColumnLayout {
            Layout.fillWidth: true
            Layout.margins: 40
            Layout.leftMargin: 40
            Layout.rightMargin: 40
            spacing: 16

            Text {
                text: "Component Preview"
                font.pixelSize: 24
                font.weight: Font.Bold
                color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
            }

            // Button preview
            Rectangle {
                Layout.fillWidth: true
                height: 120
                radius: 8
                color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.cardColor : "#ffffff"
                border.width: 1
                border.color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.cardBorderColor : "#e5e5e5"

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: 16
                    spacing: 8

                    Text {
                        text: "Buttons"
                        font.pixelSize: 14
                        font.weight: Font.Medium
                        color: themeManager.currentTheme && themeManager.currentTheme.colors
                            ? themeManager.currentTheme.colors.textColor : "#1b1b1b"
                    }

                    RowLayout {
                        spacing: 12

                        Rin.Button {
                            text: "Primary"
                            isPrimary: true
                        }

                        Rin.Button {
                            text: "Secondary"
                        }

                        Rin.Button {
                            text: "Flat"
                            isFlat: true
                        }

                        Rin.Button {
                            text: "Disabled"
                            enabled: false
                        }
                    }
                }
            }
        }

        // Footer
        Item {
            Layout.fillWidth: true
            Layout.preferredHeight: 60

            Rectangle {
                anchors.fill: parent
                color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.cardColor : "#ffffff"

                RowLayout {
                    anchors.fill: parent
                    anchors.margins: 20
                    spacing: 12

                    Text {
                        text: "Built with CxxQt + QML"
                        font.pixelSize: 12
                        color: themeManager.currentTheme && themeManager.currentTheme.colors
                            ? themeManager.currentTheme.colors.textSecondaryColor : "#6c6c6c"
                    }

                    Item { Layout.fillWidth: true }

                    Text {
                        text: "© 2024 CxxQt FluentUI"
                        font.pixelSize: 12
                        color: themeManager.currentTheme && themeManager.currentTheme.colors
                            ? themeManager.currentTheme.colors.textSecondaryColor : "#6c6c6c"
                    }
                }
            }
        }
    }
}
