import QtQuick 2.15
import QtQuick.Layouts 1.15
import "../components" as Rin

ControlPage {
    id: page
    title: qsTr("Hyperlink")
    property bool disabled: false

    Text {
        Layout.fillWidth: true
        wrapMode: Text.WordWrap
        text: qsTr("A Hyperlink appears as a text hyperlink. When a user clicks it, it opens the page you specify in the default browser, or you can handle its clicked signal to navigate within your app.")
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            text: qsTr("Navigate to URL")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        ControlShowcase {
            width: parent.width
            showcaseWidth: 300

            Rin.Hyperlink {
                text: qsTr("RinUI home page")
                openUrl: "https://ui.rinlit.cn/"
                enabled: !page.disabled
            }

            showcase: [
                Rin.CheckBox {
                    text: qsTr("Disable Hyperlink")
                    checked: page.disabled
                    onToggled: page.disabled = checked
                }
            ]
        }
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            text: qsTr("Handle Clicked")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        Rin.Frame {
            Layout.fillWidth: true

            Rin.Hyperlink {
                text: qsTr("Back to gallery home page")
                enabled: !!page.navigationView && !page.disabled
                onClicked: page.navigationView.push("HomePage")
            }
        }
    }
}
