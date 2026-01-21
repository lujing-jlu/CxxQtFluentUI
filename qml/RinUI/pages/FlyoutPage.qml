import QtQuick 2.15
import QtQuick.Layouts 1.15
import "../components" as Rin

ControlPage {
    id: page
    title: qsTr("Flyout")

    Text {
        Layout.fillWidth: true
        wrapMode: Text.WordWrap
        text: qsTr("A Flyout displays lightweight UI that is either information, or requires user interaction. Unlike a Dialog, a Flyout can be light dismissed.")
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            text: qsTr("A button with a flyout")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        Rin.Frame {
            Layout.fillWidth: true

            Rin.Button {
                id: emptyCartBtn
                text: qsTr("Empty cart")
                onClicked: flyout.open()

                Rin.Flyout {
                    id: flyout
                    anchorItem: emptyCartBtn
                    position: Rin.Position.Bottom
                    text: qsTr("All items will be removed. Do you want to continue?")

                    buttonBox: [
                        Rin.Button { text: qsTr("Yes, empty my cart"); isPrimary: true; onClicked: flyout.close() }
                    ]
                }
            }
        }
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            text: qsTr("Different positions")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        Rin.Frame {
            Layout.fillWidth: true

            RowLayout {
                spacing: 12

                Rin.Button {
                    id: topBtn
                    text: qsTr("Top")
                    onClicked: topFlyout.open()

                    Rin.Flyout {
                        id: topFlyout
                        anchorItem: topBtn
                        position: Rin.Position.Top
                        text: qsTr("The flyout is on the Top")
                    }
                }

                Rin.Button {
                    id: bottomBtn
                    text: qsTr("Bottom")
                    onClicked: bottomFlyout.open()

                    Rin.Flyout {
                        id: bottomFlyout
                        anchorItem: bottomBtn
                        position: Rin.Position.Bottom
                        text: qsTr("The flyout is on the Bottom")

                        buttonBox: [
                            Rin.Button { text: qsTr("Continue"); isPrimary: true; onClicked: bottomFlyout.close() },
                            Rin.Button { text: qsTr("Cancel"); isFlat: true; onClicked: bottomFlyout.close() }
                        ]
                    }
                }

                Rin.Button {
                    id: leftBtn
                    text: qsTr("Left")
                    onClicked: leftFlyout.open()

                    Rin.Flyout {
                        id: leftFlyout
                        anchorItem: leftBtn
                        position: Rin.Position.Left
                        text: qsTr("The flyout is on the Left")
                    }
                }

                Rin.Button {
                    id: rightBtn
                    text: qsTr("Right")
                    onClicked: rightFlyout.open()

                    Rin.Flyout {
                        id: rightFlyout
                        anchorItem: rightBtn
                        position: Rin.Position.Right
                        text: qsTr("The flyout is on the Right")
                    }
                }
            }
        }
    }
}

