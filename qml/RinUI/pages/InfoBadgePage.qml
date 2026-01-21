import QtQuick 2.15
import QtQuick.Layouts 1.15
import "../components" as Rin

ControlPage {
    id: page
    title: qsTr("InfoBadge")

    Text {
        Layout.fillWidth: true
        wrapMode: Text.WordWrap
        text: qsTr("Badging is a non-intrusive way to display notifications or bring focus to an area within an app.")
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            text: qsTr("Solid")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        ControlShowcase {
            width: parent.width
            showcaseWidth: 320

            RowLayout {
                spacing: 20
                Layout.alignment: Qt.AlignVCenter

                Rin.InfoBadge { severity: severityModel.get(severityPicker.currentIndex).state }
                Rin.InfoBadge { severity: severityModel.get(severityPicker.currentIndex).state; count: 10 }
                Rin.InfoBadge { severity: severityModel.get(severityPicker.currentIndex).state; dot: true }
            }

            showcase: [
                Text { text: qsTr("Severity") },
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

        Text {
            text: qsTr("Outline (solid=false)")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        ControlShowcase {
            width: parent.width
            showcaseWidth: 320

            RowLayout {
                spacing: 20
                Layout.alignment: Qt.AlignVCenter

                Rin.InfoBadge { severity: severityModel2.get(severityPicker2.currentIndex).state; solid: false }
                Rin.InfoBadge { severity: severityModel2.get(severityPicker2.currentIndex).state; count: 10; solid: false }
                Rin.InfoBadge { severity: severityModel2.get(severityPicker2.currentIndex).state; text: qsTr("Badge"); solid: false }
                Rin.InfoBadge { severity: severityModel2.get(severityPicker2.currentIndex).state; dot: true; solid: false }
            }

            showcase: [
                Text { text: qsTr("Severity") },
                Rin.ComboBox {
                    id: severityPicker2
                    model: severityModel2
                    textRole: "text"
                    currentIndex: 0
                }
            ]
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
        id: severityModel2
        ListElement { text: "Info"; state: Rin.Severity.Info }
        ListElement { text: "Success"; state: Rin.Severity.Success }
        ListElement { text: "Warning"; state: Rin.Severity.Warning }
        ListElement { text: "Error"; state: Rin.Severity.Error }
    }
}

