import QtQuick 2.15
import QtQuick.Layouts 1.15
import "../components" as Rin

ControlPage {
    id: page
    title: qsTr("ToolTip")

    Rin.Text {
        Layout.fillWidth: true
        wrapMode: Text.WordWrap
        text: qsTr("A ToolTip shows more information about a UI element. It is shown when a user hovers over or presses and holds the UI element.")
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Rin.Text {
            typography: Rin.Typography.BodyStrong
            text: qsTr("A button with a simple ToolTip")
        }

        Rin.Frame {
            Layout.fillWidth: true
            padding: 24

            Rin.Button {
                text: qsTr("Hover to see ToolTip")

                Rin.ToolTip {
                    text: qsTr("Simple ToolTip")
                    visible: parent.hovered
                    delay: 250
                }
            }
        }
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Rin.Text {
            typography: Rin.Typography.BodyStrong
            text: qsTr("A Text with an offset ToolTip.")
        }

        Rin.Frame {
            Layout.fillWidth: true
            padding: 24

            Rin.Text {
                id: tooltipTarget
                text: qsTr("Text with an offset ToolTip.")

                HoverHandler { id: hoverHandler }

                Rin.ToolTip {
                    y: 80
                    text: qsTr("Offset ToolTip")
                    visible: hoverHandler.hovered
                    delay: 250
                }
            }
        }
    }
}
