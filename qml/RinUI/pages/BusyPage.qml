import QtQuick 2.15
import QtQuick.Layouts 1.15
import "../components" as Rin

ControlPage {
    id: page
    title: qsTr("BusyIndicator")
    property bool isRunning: true

    Rin.Text {
        Layout.fillWidth: true
        wrapMode: Text.WordWrap
        text: qsTr("A BusyIndicator indicates activity when progress cannot be determined.")
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Rin.Text {
            typography: Rin.Typography.BodyStrong
            text: qsTr("Different Sizes")
        }

        Rin.Frame {
            Layout.fillWidth: true
            padding: 24

            RowLayout {
                spacing: 24
                Repeater {
                    model: [24, 32, 48, 64]
                    delegate: ColumnLayout {
                        spacing: 8
                        Layout.alignment: Qt.AlignVCenter

                        Rin.BusyIndicator {
                            size: modelData
                            running: true
                            Layout.preferredWidth: modelData
                            Layout.preferredHeight: modelData
                        }

                        Rin.Text {
                            typography: Rin.Typography.Caption
                            text: modelData + "px"
                            color: themeManager.currentTheme.colors.textSecondaryColor
                            Layout.alignment: Qt.AlignHCenter
                        }
                    }
                }
            }
        }
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Rin.Text {
            typography: Rin.Typography.BodyStrong
            text: qsTr("Interactive")
        }

        ControlShowcase {
            Layout.fillWidth: true

            Rin.BusyIndicator {
                size: 64
                running: page.isRunning
            }

            showcase: [
                Rin.CheckBox {
                    text: qsTr("Is Running")
                    checked: page.isRunning
                    onToggled: page.isRunning = checked
                }
            ]
        }
    }
}
