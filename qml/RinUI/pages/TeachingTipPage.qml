import QtQuick 2.15
import QtQuick.Layouts 2.15
import "../components" as Rin

DemoPage {
    id: root
    title: qsTr("TeachingTip")
    description: qsTr("A contextual tip that educates users about UI elements.")

    Rin.Frame {
        Layout.fillWidth: true
        height: 220
        padding: 16

        ColumnLayout {
            anchors.fill: parent
            spacing: 12

            Rin.Text {
                typography: Rin.Typography.Body
                text: qsTr("Click the button to show a TeachingTip anchored to it.")
                wrapMode: Text.WordWrap
            }

            Rin.Button {
                id: targetButton
                text: qsTr("Show tip")
                onClicked: tip.open()
            }

            Rin.TeachingTip {
                id: tip
                anchorItem: targetButton
                position: Rin.Position.Bottom
                title: qsTr("Did you know?")
                text: qsTr("TeachingTips can include actions and a close button.")
                primaryButtonText: qsTr("Got it")
                secondaryButtonText: qsTr("Later")

                onPrimaryClicked: tip.close()
                onSecondaryClicked: tip.close()
            }
        }
    }
}

