import QtQuick 2.15
import QtQuick.Layouts 1.15
import "../components" as Rin

ControlPage {
    id: page
    title: qsTr("InfoBadge")

    Rin.Text {
        Layout.fillWidth: true
        wrapMode: Text.WordWrap
        text: qsTr("Badging is a non-intrusive way to display notifications or bring focus to an area within an app.")
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Rin.Text {
            typography: Rin.Typography.BodyStrong
            text: qsTr("Different InfoBadge styles")
        }

        ControlShowcase {
            Layout.fillWidth: true
            height: 100

            RowLayout {
                x: parent.width / 2 - implicitWidth / 2
                height: parent.height
                spacing: 20

                Rin.InfoBadge {
                    Layout.alignment: Qt.AlignVCenter
                    severity: severityModel.get(severityPicker.currentIndex).state
                }
                Rin.InfoBadge {
                    Layout.alignment: Qt.AlignVCenter
                    severity: severityModel.get(severityPicker.currentIndex).state
                    count: 10
                }
                Rin.InfoBadge {
                    Layout.alignment: Qt.AlignVCenter
                    severity: severityModel.get(severityPicker.currentIndex).state
                    dot: true
                }
            }

            showcase: [
                Rin.Text { text: qsTr("Styles") },
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
            text: qsTr("Different InfoBadge styles without solid")
        }

        ControlShowcase {
            Layout.fillWidth: true
            height: 100

            RowLayout {
                x: parent.width / 2 - implicitWidth / 2
                height: parent.height
                spacing: 20

                Rin.InfoBadge {
                    Layout.alignment: Qt.AlignVCenter
                    severity: severityModel2.get(severityPicker2.currentIndex).state
                    solid: false
                }
                Rin.InfoBadge {
                    Layout.alignment: Qt.AlignVCenter
                    severity: severityModel2.get(severityPicker2.currentIndex).state
                    count: 10
                    solid: false
                }
                Rin.InfoBadge {
                    Layout.alignment: Qt.AlignVCenter
                    severity: severityModel2.get(severityPicker2.currentIndex).state
                    text: qsTr("Badge")
                    solid: false
                }
                Rin.InfoBadge {
                    Layout.alignment: Qt.AlignVCenter
                    severity: severityModel2.get(severityPicker2.currentIndex).state
                    dot: true
                    solid: false
                }
            }

            showcase: [
                Rin.Text { text: qsTr("Styles") },
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
