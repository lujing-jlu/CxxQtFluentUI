import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../components" as Rin

ControlPage {
    id: page
    title: qsTr("Slider")

    Text {
        Layout.fillWidth: true
        wrapMode: Text.WordWrap
        text: qsTr("Use a Slider when you want users to be able to set defined, contiguous values (such as volume or brightness) or a range of discrete values.")
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            text: qsTr("A simple Slider.")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        ControlShowcase {
            width: parent.width

            Rin.Slider {
                width: 200
                enabled: !disableSlider.checked
            }

            showcase: [
                Rin.CheckBox {
                    id: disableSlider
                    text: qsTr("Disable Slider")
                }
            ]
        }
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            text: qsTr("A Slider with range and step specified.")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        ControlShowcase {
            width: parent.width
            height: 200

            Rin.Slider {
                width: 200
                from: minSlider.value
                to: maxSlider.value
                stepSize: stepSlider.value
                value: 800
            }

            showcase: [
                Text { text: qsTr("Minimum:") },
                Rin.Slider { id: minSlider; from: 0; to: 1000; stepSize: 10; value: 500 },
                Text { text: qsTr("Maximum:") },
                Rin.Slider { id: maxSlider; from: 0; to: 1000; stepSize: 10; value: 800 },
                Text { text: qsTr("Step size:") },
                Rin.Slider { id: stepSlider; from: 1; to: 100; stepSize: 1; value: 10 }
            ]
        }
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            text: qsTr("A Slider with tick marks.")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        ControlShowcase {
            width: parent.width
            height: 150

            Rin.Slider {
                width: 300
                from: 0
                to: 100
                stepSize: 20
                tickmarks: true
                snapMode: stepValuesSnap.checked ? Slider.NoSnap : ticksSnap.checked ? Slider.SnapAlways : Slider.NoSnap
            }

            showcase: [
                Text { text: qsTr("Snaps to:") },
                Column {
                    spacing: 4
                    Rin.RadioButton { id: stepValuesSnap; text: qsTr("StepValues"); checked: true }
                    Rin.RadioButton { id: ticksSnap; text: qsTr("Ticks") }
                }
            ]
        }
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            text: qsTr("A vertical Slider with tick marks.")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        Rin.Frame {
            Layout.fillWidth: true
            height: 125

            Rin.Slider {
                anchors.centerIn: parent
                height: 100
                orientation: Qt.Vertical
                from: 0
                to: 100
                stepSize: 1
                tickFrequency: 20
                tickmarks: true
                snapMode: stepValuesSnap.checked ? Slider.NoSnap : ticksSnap.checked ? Slider.SnapAlways : Slider.NoSnap
            }
        }
    }
}

