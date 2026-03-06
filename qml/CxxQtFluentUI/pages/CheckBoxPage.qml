import QtQuick 2.15
import QtQuick.Layouts 1.15
import "../components" as Rin

ControlPage {
    id: page
    title: qsTr("CheckBox")

    Text {
        Layout.fillWidth: true
        wrapMode: Text.WordWrap
        text: qsTr("CheckBox controls let the user select a combination of binary options. In contrast, RadioButton controls allow the user to select from mutually exclusive options. The indeterminate state indicates a mixed selection.")
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            text: qsTr("A 2-state CheckBox.")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        ControlShowcase {
            width: parent.width
            height: 100

            Rin.CheckBox {
                text: qsTr("Two-state CheckBox")
                enabled: !disable2State.checked
            }

            showcase: [
                Rin.CheckBox {
                    id: disable2State
                    text: qsTr("Disable CheckBox")
                }
            ]
        }
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            text: qsTr("A 3-state CheckBox.")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        ControlShowcase {
            width: parent.width
            height: 100

            Rin.CheckBox {
                tristate: true
                text: qsTr("Three-state CheckBox")
                enabled: !disable3State.checked
            }

            showcase: [
                Rin.CheckBox {
                    id: disable3State
                    text: qsTr("Disable CheckBox")
                }
            ]
        }
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            text: qsTr("Using a 3-state CheckBox (Select all).")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        ControlShowcase {
            id: groupShowcase
            width: parent.width

            function updateParentState() {
                const total = 3
                const checkedCount = (opt1.checked ? 1 : 0) + (opt2.checked ? 1 : 0) + (opt3.checked ? 1 : 0)
                if (checkedCount === 0) parentBox.checkState = Qt.Unchecked
                else if (checkedCount === total) parentBox.checkState = Qt.Checked
                else parentBox.checkState = Qt.PartiallyChecked
            }

            Rin.CheckBox {
                id: parentBox
                tristate: true
                text: qsTr("Select all")
                enabled: !disableGroup.checked

                onClicked: {
                    const shouldCheck = parentBox.checkState !== Qt.Checked
                    opt1.checked = shouldCheck
                    opt2.checked = shouldCheck
                    opt3.checked = shouldCheck
                    groupShowcase.updateParentState()
                }
            }

            Rin.CheckBox {
                id: opt1
                text: qsTr("Option 1")
                checked: true
                enabled: !disableGroup.checked
                leftPadding: indicator.width
                onCheckedChanged: groupShowcase.updateParentState()
            }

            Rin.CheckBox {
                id: opt2
                text: qsTr("Option 2")
                enabled: !disableGroup.checked
                leftPadding: indicator.width
                onCheckedChanged: groupShowcase.updateParentState()
            }

            Rin.CheckBox {
                id: opt3
                text: qsTr("Option 3")
                enabled: !disableGroup.checked
                leftPadding: indicator.width
                onCheckedChanged: groupShowcase.updateParentState()
            }

            Component.onCompleted: updateParentState()

            showcase: [
                Rin.CheckBox {
                    id: disableGroup
                    text: qsTr("Disable CheckBox")
                }
            ]
        }
    }
}

