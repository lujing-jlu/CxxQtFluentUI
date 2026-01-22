import QtQuick 2.15
import QtQuick.Layouts 1.15
import "../components" as Rin

ControlPage {
    id: page
    title: qsTr("InfoBar")

    Rin.Text {
        Layout.fillWidth: true
        wrapMode: Text.WordWrap
        text: qsTr("Use an InfoBar to inform users of, acknowledge, or take action on changed application states.")
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Rin.Text {
            typography: Rin.Typography.BodyStrong
            text: qsTr("A closable InfoBar with options to change its Severity")
        }

        ControlShowcase {
            Layout.fillWidth: true
            padding: 48

            Rin.InfoBar {
                width: parent.width
                severity: severityModel.get(severityPicker.currentIndex).state
                title: qsTr("Title")
                text: qsTr("Essential app message for your users.")
                visible: isOpen.checked
            }

            showcase: [
                Rin.CheckBox {
                    id: isOpen
                    text: qsTr("Is Open")
                    checked: true
                },
                Rin.Text { text: qsTr("Severity") },
                Rin.ComboBox {
                    id: severityPicker
                    model: severityModel
                    textRole: "text"
                    currentIndex: 0
                }
            ]
        }
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Rin.Text {
            typography: Rin.Typography.BodyStrong
            text: qsTr("A closeable InfoBar with options to display the close button and icon")
        }

        ControlShowcase {
            Layout.fillWidth: true
            padding: 48

            Rin.InfoBar {
                width: parent.width
                severity: Rin.Severity.Info
                title: qsTr("Options Demo")
                text: qsTr("This InfoBar demonstrates iconVisible and closable options.")
                iconVisible: iconVisible.checked
                closable: closable.checked
                visible: isOpen2.checked
            }

            showcase: [
                Rin.CheckBox {
                    id: isOpen2
                    text: qsTr("Is Open")
                    checked: false
                },
                Rin.CheckBox {
                    id: iconVisible
                    text: qsTr("Icon Visible")
                    checked: true
                },
                Rin.CheckBox {
                    id: closable
                    text: qsTr("Closable")
                    checked: true
                }
            ]
        }
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Rin.Text {
            typography: Rin.Typography.BodyStrong
            text: qsTr("InfoBar with different popup positions & styles")
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
                    currentIndex: 0
                    Layout.preferredWidth: 160
                }

                Rin.ComboBox {
                    id: severityPicker2
                    model: severityModel
                    textRole: "text"
                    currentIndex: 0
                    Layout.preferredWidth: 140
                }

                Rin.TextField {
                    id: popupTitle
                    placeholderText: qsTr("Title")
                    Layout.preferredWidth: 120
                }

                Rin.TextField {
                    id: popupText
                    placeholderText: qsTr("Text")
                    Layout.fillWidth: true
                }

                Rin.Button {
                    text: qsTr("Popup!")
                    isPrimary: true
                    enabled: !!page.floatLayer
                    onClicked: {
                        if (!page.floatLayer) return
                        page.floatLayer.createInfoBar({
                            severity: severityModel.get(severityPicker2.currentIndex).state,
                            title: popupTitle.text,
                            text: popupText.text,
                            position: positionModel.get(positionPicker.currentIndex).pos
                        })
                    }
                }
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
