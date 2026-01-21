import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../components" as Rin

ControlPage {
    id: page
    title: qsTr("Dialog")

    Rin.Dialog {
        id: basicDialog
        title: qsTr("This is a dialog")
        modal: true
        standardButtons: Dialog.Ok | Dialog.Cancel

        Text {
            Layout.fillWidth: true
            wrapMode: Text.WordWrap
            text: qsTr("This is a dialog with basic content.")
        }

        onAccepted: {
            cuteText.text = qsTr("Accepted")
            if (page.floatLayer) page.floatLayer.createInfoBar({ text: qsTr("Accepted") })
        }
        onRejected: {
            cuteText.text = qsTr("Rejected")
            if (page.floatLayer) page.floatLayer.createInfoBar({ text: qsTr("Rejected") })
        }
    }

    Rin.Dialog {
        id: customDialog
        title: qsTr("Custom Dialog")
        modal: true
        width: 520
        standardButtons: Dialog.Ok | Dialog.Cancel

        Text {
            Layout.fillWidth: true
            wrapMode: Text.WordWrap
            text: qsTr("This is a dialog with custom content.")
        }

        Rin.InfoBar {
            Layout.fillWidth: true
            severity: Rin.Severity.Info
            title: qsTr("Attention")
            text: qsTr("You can customize the title, text, and severity.")
            closable: false
        }

        RowLayout {
            Layout.fillWidth: true
            spacing: 12

            ColumnLayout {
                Layout.fillWidth: true
                spacing: 8

                Rin.TextField {
                    id: infoTitle
                    Layout.fillWidth: true
                    placeholderText: qsTr("InfoBar Title")
                    text: qsTr("Custom Title")
                }

                Rin.TextField {
                    id: infoText
                    Layout.fillWidth: true
                    placeholderText: qsTr("InfoBar Text")
                    text: qsTr("Custom Text")
                }
            }

            ColumnLayout {
                Layout.preferredWidth: 180
                spacing: 8

                Text { text: qsTr("Severity") }

                Rin.ComboBox {
                    id: severityPicker
                    model: severityModel
                    textRole: "text"
                    currentIndex: 0
                }
            }
        }

        onAccepted: {
            if (!page.floatLayer) return
            page.floatLayer.createInfoBar({
                title: infoTitle.text,
                text: infoText.text,
                severity: severityModel.get(severityPicker.currentIndex).state
            })
        }
    }

    Text {
        Layout.fillWidth: true
        wrapMode: Text.WordWrap
        text: qsTr("Use a Dialog to show relevant information or to provide a modal experience that can show any QML content.")
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            text: qsTr("Basic")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        Rin.Frame {
            Layout.fillWidth: true

            RowLayout {
                spacing: 12

                Rin.Button {
                    text: qsTr("Show Dialog")
                    isPrimary: true
                    onClicked: basicDialog.open()
                }

                Text {
                    id: cuteText
                    text: qsTr("Click the button to open a dialog")
                    verticalAlignment: Text.AlignVCenter
                    color: themeManager.currentTheme.colors.textSecondaryColor
                    Layout.fillWidth: true
                }
            }
        }
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            text: qsTr("Custom Content")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        Rin.Frame {
            Layout.fillWidth: true

            Rin.Button {
                text: qsTr("Show Dialog")
                onClicked: customDialog.open()
            }
        }
    }

    ListModel {
        id: severityModel
        ListElement { text: "Info"; state: Rin.Severity.Info }
        ListElement { text: "Success"; state: Rin.Severity.Success }
        ListElement { text: "Warning"; state: Rin.Severity.Warning }
        ListElement { text: "Error"; state: Rin.Severity.Error }
    }
}
