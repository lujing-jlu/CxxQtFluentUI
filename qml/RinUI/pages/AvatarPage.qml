import QtQuick 2.15
import QtQuick.Layouts 1.15
import "../components" as Rin

ControlPage {
    id: page
    title: qsTr("Avatar")

    Text {
        Layout.fillWidth: true
        wrapMode: Text.WordWrap
        text: qsTr("Avatars display a user picture, initials, or a fallback icon.")
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            text: qsTr("Size variants.")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        Rin.Frame {
            Layout.fillWidth: true
            height: 110

            RowLayout {
                anchors.centerIn: parent
                spacing: 24

                Rin.Avatar { size: 32; text: "JD" }
                Rin.Avatar { size: 48; text: "John Doe" }
                Rin.Avatar { size: 64; text: "Jane Smith" }
                Rin.Avatar { size: 96; text: "Alex Johnson" }
            }
        }
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            text: qsTr("Initials style.")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        Rin.Frame {
            Layout.fillWidth: true
            height: 110

            RowLayout {
                anchors.centerIn: parent
                spacing: 24

                Rin.Avatar { size: 64; text: "A" }
                Rin.Avatar { size: 64; text: "BC" }
                Rin.Avatar { size: 64; text: "Jane Doe" }
                Rin.Avatar { size: 64; text: "Dr. Smith" }
            }
        }
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            text: qsTr("Icon fallback.")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        Rin.Frame {
            Layout.fillWidth: true
            height: 95

            RowLayout {
                anchors.centerIn: parent
                spacing: 24

                Rin.Avatar { size: 48 }
                Rin.Avatar { size: 64 }
                Rin.Avatar { size: 80 }
            }
        }
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            text: qsTr("Disabled state.")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        Rin.Frame {
            Layout.fillWidth: true
            height: 95

            RowLayout {
                anchors.centerIn: parent
                spacing: 24

                Rin.Avatar { size: 48; text: "JD"; enabled: false }
                Rin.Avatar { size: 64; text: "Jane Doe"; enabled: false }
                Rin.Avatar { size: 80; enabled: false }
            }
        }
    }
}

