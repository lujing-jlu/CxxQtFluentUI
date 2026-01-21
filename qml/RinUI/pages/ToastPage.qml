import QtQuick 2.15
import QtQuick.Layouts 1.15
import "../components" as Rin

ControlPage {
    id: page
    title: qsTr("Toast")

    Text {
        Layout.fillWidth: true
        wrapMode: Text.WordWrap
        text: qsTr("Lightweight notification messages that appear briefly and dismiss automatically.")
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            text: qsTr("Popup (FloatLayer)")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        Rin.Frame {
            Layout.fillWidth: true
            padding: 16

            RowLayout {
                spacing: 12

                Rin.ComboBox {
                    id: positionPicker
                    model: positionModel
                    textRole: "text"
                    currentIndex: 7 // BottomRight
                    Layout.preferredWidth: 160
                }

                Rin.ComboBox {
                    id: severityPicker
                    model: severityModel
                    textRole: "text"
                    currentIndex: 0
                    Layout.preferredWidth: 140
                }

                Rin.SpinBox {
                    id: timeoutPicker
                    from: -1
                    to: 10000
                    stepSize: 500
                    value: 2000
                    Layout.preferredWidth: 120
                }

                Rin.CheckBox {
                    id: iconVisible
                    text: qsTr("Icon")
                    checked: true
                }

                Rin.CheckBox {
                    id: closable
                    text: qsTr("Closable")
                    checked: true
                }

                Rin.TextField {
                    id: toastTitle
                    placeholderText: qsTr("Title")
                    Layout.preferredWidth: 120
                }

                Rin.TextField {
                    id: toastText
                    placeholderText: qsTr("Text")
                    Layout.fillWidth: true
                }

                Rin.Button {
                    text: qsTr("Show")
                    isPrimary: true
                    enabled: !!page.floatLayer
                    onClicked: {
                        if (!page.floatLayer) return
                        page.floatLayer.createCustom(toastComponent)
                    }
                }
            }
        }
    }

    Component {
        id: toastComponent
        Rin.Toast {
            isDynamic: true
            position: positionModel.get(positionPicker.currentIndex).pos
            severity: severityModel.get(severityPicker.currentIndex).state
            timeout: timeoutPicker.value
            iconVisible: iconVisible.checked
            closable: closable.checked
            title: toastTitle.text
            text: toastText.text
        }
    }

    ListModel {
        id: severityModel
        ListElement { text: "Info"; state: Rin.Severity.Info }
        ListElement { text: "Success"; state: Rin.Severity.Success }
        ListElement { text: "Warning"; state: Rin.Severity.Warning }
        ListElement { text: "Error"; state: Rin.Severity.Error }
    }

    ListModel {
        id: positionModel
        ListElement { text: "Top"; pos: Rin.Position.Top }
        ListElement { text: "Bottom"; pos: Rin.Position.Bottom }
        ListElement { text: "TopLeft"; pos: Rin.Position.TopLeft }
        ListElement { text: "TopRight"; pos: Rin.Position.TopRight }
        ListElement { text: "BottomLeft"; pos: Rin.Position.BottomLeft }
        ListElement { text: "BottomRight"; pos: Rin.Position.BottomRight }
    }
}

