import QtQuick 2.15
import QtQuick.Layouts 1.15
import "../components" as Rin

ControlPage {
    id: page
    title: qsTr("ColorPicker")

    Text {
        Layout.fillWidth: true
        wrapMode: Text.WordWrap
        text: qsTr("A selectable color spectrum.")
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            text: qsTr("ColorPicker Properties")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        ControlShowcase {
            width: parent.width
            showcaseWidth: 320

            Rin.ColorPicker {
                id: picker
                moreVisible: moreButtonVisible.checked
                colorSliderVisible: colorSliderVisible.checked
                colorChannelInputVisible: channelInputsVisible.checked
                hexInputVisible: hexInputVisible.checked
                alphaEnabled: alphaEnabled.checked
                alphaSliderVisible: alphaSliderVisible.checked
                alphaInputVisible: alphaInputsVisible.checked
                ringMode: ringMode.checked
                color: "white"
            }

            showcase: [
                Rin.CheckBox {
                    id: moreButtonVisible
                    text: qsTr("moreButtonVisible")
                },
                Rin.CheckBox {
                    id: colorSliderVisible
                    text: qsTr("colorSliderVisible")
                    checked: true
                },
                Rin.CheckBox {
                    id: channelInputsVisible
                    text: qsTr("colorChannelInputVisible")
                    checked: true
                },
                Rin.CheckBox {
                    id: hexInputVisible
                    text: qsTr("hexInputVisible")
                    checked: true
                },
                Rin.CheckBox {
                    id: alphaEnabled
                    text: qsTr("alphaEnabled")
                },
                Rin.CheckBox {
                    id: alphaSliderVisible
                    text: qsTr("alphaSliderVisible")
                    checked: true
                    enabled: alphaEnabled.checked
                },
                Rin.CheckBox {
                    id: alphaInputsVisible
                    text: qsTr("alphaInputVisible")
                    checked: true
                    enabled: alphaEnabled.checked
                },
                Text { text: qsTr("Colorspectrum shape") },
                Column {
                    Rin.RadioButton {
                        text: qsTr("Box")
                        checked: true
                    }
                    Rin.RadioButton {
                        id: ringMode
                        text: qsTr("Ring")
                    }
                },
                Text { text: qsTr("Selected color") },
                Rectangle {
                    width: 250
                    height: 100
                    radius: 4
                    color: picker.color
                    border.width: themeManager.currentTheme.appearance.borderWidth
                    border.color: themeManager.currentTheme.colors.controlBorderColor
                }
            ]
        }
    }

    Column {
        Layout.fillWidth: true
        spacing: 4

        Text {
            text: qsTr("DropDownColorPicker")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        ControlShowcase {
            width: parent.width
            showcaseWidth: 320

            Rin.DropDownColorPicker {
                moreVisible: moreButtonVisible.checked
                colorSliderVisible: colorSliderVisible.checked
                colorChannelInputVisible: channelInputsVisible.checked
                hexInputVisible: hexInputVisible.checked
                alphaEnabled: alphaEnabled.checked
                alphaSliderVisible: alphaSliderVisible.checked
                alphaInputVisible: alphaInputsVisible.checked
                ringMode: ringMode.checked

                textVisible: textVisible.checked
                hexText: hexText.checked

                color: "white"
            }

            showcase: [
                Rin.CheckBox {
                    id: textVisible
                    text: qsTr("textVisible")
                },
                Rin.CheckBox {
                    id: hexText
                    text: qsTr("hexText")
                }
            ]
        }
    }
}
