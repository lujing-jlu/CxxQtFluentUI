import QtQuick 2.15
import QtQuick.Layouts 1.15
import "../components" as Rin

ControlPage {
    id: page
    title: qsTr("Expander")

    Text {
        Layout.fillWidth: true
        wrapMode: Text.WordWrap
        text: qsTr("An Expander shows or hides content with an animated disclosure.")
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            text: qsTr("A basic Expander.")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        Rin.Expander {
            Layout.fillWidth: true
            text: qsTr("Click to expand")
            radius: 8

            Rin.Frame {
                Layout.fillWidth: true
                height: 100
                color: "transparent"

                ColumnLayout {
                    anchors.centerIn: parent
                    spacing: 8

                    Text {
                        text: qsTr("Expanded content")
                        font.pixelSize: 16
                        font.weight: Font.Medium
                    }

                    Text {
                        text: qsTr("This is the content that appears when you expand the expander.")
                        wrapMode: Text.WordWrap
                        font.pixelSize: 14
                        opacity: 0.85
                    }
                }
            }
        }
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            text: qsTr("Multiple Expanders.")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        Rin.Expander {
            Layout.fillWidth: true
            text: qsTr("Section 1")
            radius: 8

            ColumnLayout {
                spacing: 8
                Text { text: qsTr("Content for section 1") }
            }
        }

        Rin.Expander {
            Layout.fillWidth: true
            text: qsTr("Section 2")
            radius: 8

            ColumnLayout {
                spacing: 8
                Text { text: qsTr("Content for section 2") }
                Rin.Button { text: qsTr("Action Button") }
            }
        }

        Rin.Expander {
            Layout.fillWidth: true
            text: qsTr("Section 3")
            radius: 8

            ColumnLayout {
                spacing: 8
                RowLayout {
                    spacing: 8
                    Rin.CheckBox { text: qsTr("Option 1") }
                    Rin.CheckBox { text: qsTr("Option 2") }
                }
                Rin.TextField {
                    Layout.fillWidth: true
                    placeholderText: qsTr("Enter text…")
                }
            }
        }
    }
}

