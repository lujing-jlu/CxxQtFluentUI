import QtQuick 2.15
import QtQuick.Layouts 1.15
import "../components" as Rin

ControlPage {
    id: page
    title: qsTr("Toast")

    Rin.Text {
        Layout.fillWidth: true
        wrapMode: Text.WordWrap
        text: qsTr("Lightweight notification messages that appear briefly and dismiss automatically.")
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Rin.Text {
            typography: Rin.Typography.BodyStrong
            text: qsTr("Popup (FloatLayer)")
        }

        Rin.Frame {
            Layout.fillWidth: true
            padding: 16

            Flow {
                width: parent.width
                spacing: 12

                Rin.ComboBox {
                    id: positionPicker
                    model: positionModel
                    textRole: "text"
                    currentIndex: 5 // BottomRight
                    width: 160
                }

                Rin.ComboBox {
                    id: severityPicker
                    model: severityModel
                    textRole: "text"
                    currentIndex: 0
                    width: 140
                }

                Rin.SpinBox {
                    id: timeoutPicker
                    from: -1
                    to: 10000
                    stepSize: 500
                    value: 2000
                    width: 120
                }

                Rin.CheckBox { id: iconVisibleCheckBox; text: qsTr("Icon"); checked: true }
                Rin.CheckBox { id: closableCheckBox; text: qsTr("Closable"); checked: true }

                Rin.TextField { id: toastTitle; placeholderText: qsTr("Title"); width: 140 }
                Rin.TextField { id: toastText; placeholderText: qsTr("Text"); width: 260 }

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
            iconVisible: iconVisibleCheckBox.checked
            closable: closableCheckBox.checked
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
