import QtQuick 2.15
import QtQuick.Layouts 1.15
import "../components" as Rin

DemoPage {
    title: qsTr("NavigationView")
    description: qsTr("The main navigation container used in this demo app.")

    Text {
        text: qsTr("NavigationView is already used as the app shell. This preview embeds a second instance.")
        wrapMode: Text.WordWrap
        Layout.fillWidth: true
    }

    Rin.Frame {
        Layout.fillWidth: true
        Layout.preferredHeight: 380
        clip: true

        Rin.NavigationView {
            anchors.fill: parent
            initialPage: "HomePage"
        }
    }
}
