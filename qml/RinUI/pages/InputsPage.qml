import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../components" as Rin

Item {
    id: root

    readonly property var colors: themeManager.currentTheme.item ? themeManager.currentTheme.item.colors : null
    readonly property var typography: themeManager.currentTheme.item ? themeManager.currentTheme.item.typography : null

    property string title: qsTr("Input Controls")

    ScrollView {
        anchors.fill: parent
        anchors.margins: 20
        clip: true

        Column {
            width: parent.width
            spacing: 24

            // Section: TextField
            Text {
                text: qsTr("TextField")
                font.pixelSize: 18
                font.bold: true
                color: colors ? colors.textColor : "#1b1b1b"
            }

            Column {
                spacing: 12
                width: parent.width

                Rin.TextField {
                    width: 300
                    placeholderText: qsTr("Placeholder text")
                }

                Rin.TextField {
                    width: 300
                    text: qsTr("Sample text")
                    placeholderText: qsTr("With text")
                }

                Rin.TextField {
                    width: 300
                    placeholderText: qsTr("Disabled")
                    enabled: false
                }

                Rin.TextField {
                    width: 300
                    placeholderText: qsTr("Clearable when focused")
                }
            }

            // Section: ComboBox
            Text {
                text: qsTr("ComboBox")
                font.pixelSize: 18
                font.bold: true
                color: colors ? colors.textColor : "#1b1b1b"
            }

            Column {
                spacing: 12
                width: parent.width

                Row {
                    spacing: 12

                    Rin.ComboBox {
                        width: 200
                        model: ["Blue", "Green", "Red", "Yellow"]
                        currentIndex: -1
                        placeholderText: qsTr("Pick a color")
                    }

                    Rin.ComboBox {
                        width: 200
                        model: ["Arial", "Comic Sans MS", "Courier New", "Segoe UI", "Times New Roman"]
                        currentIndex: 2
                        placeholderText: qsTr("Pick a font")
                    }
                }

                Row {
                    spacing: 12

                    Rin.ComboBox {
                        width: 200
                        editable: true
                        model: ["8", "9", "10", "11", "12", "14", "16", "18", "20", "24", "28", "36", "48", "72"]
                        currentIndex: 2
                        placeholderText: qsTr("Pick a size")
                    }

                    Rin.ComboBox {
                        width: 200
                        model: ["Option 1", "Option 2", "Option 3"]
                        currentIndex: 0
                        enabled: false
                        placeholderText: qsTr("Disabled")
                    }
                }
            }

            // Section: ProgressBar
            Text {
                text: qsTr("ProgressBar")
                font.pixelSize: 18
                font.bold: true
                color: colors ? colors.textColor : "#1b1b1b"
            }

            Column {
                spacing: 16
                width: parent.width

                Column {
                    spacing: 4
                    width: parent.width

                    Text {
                        text: qsTr("Determinate")
                        font.pixelSize: 14
                        color: colors ? colors.textSecondaryColor : "#666"
                    }

                    Rin.ProgressBar {
                        width: 300
                        value: 60
                    }
                }

                Column {
                    spacing: 4
                    width: parent.width

                    Text {
                        text: qsTr("Indeterminate")
                        font.pixelSize: 14
                        color: colors ? colors.textSecondaryColor : "#666"
                    }

                    Rin.ProgressBar {
                        width: 300
                        indeterminate: true
                    }
                }

                Column {
                    spacing: 4
                    width: parent.width

                    Text {
                        text: qsTr("Paused")
                        font.pixelSize: 14
                        color: colors ? colors.textSecondaryColor : "#666"
                    }

                    Rin.ProgressBar {
                        width: 300
                        indeterminate: true
                        state: Rin.ProgressBar.Paused
                    }
                }

                Column {
                    spacing: 4
                    width: parent.width

                    Text {
                        text: qsTr("Error")
                        font.pixelSize: 14
                        color: colors ? colors.textSecondaryColor : "#666"
                    }

                    Rin.ProgressBar {
                        width: 300
                        indeterminate: true
                        state: Rin.ProgressBar.Error
                    }
                }
            }

            // Section: ProgressRing
            Text {
                text: qsTr("ProgressRing")
                font.pixelSize: 18
                font.bold: true
                color: colors ? colors.textColor : "#1b1b1b"
            }

            Row {
                spacing: 24

                Column {
                    spacing: 4
                    horizontalAlignment: Qt.AlignHCenter

                    Text {
                        text: qsTr("Determinate")
                        font.pixelSize: 14
                        color: colors ? colors.textSecondaryColor : "#666"
                    }

                    Rin.ProgressRing {
                        size: 56
                        value: 60
                    }
                }

                Column {
                    spacing: 4
                    horizontalAlignment: Qt.AlignHCenter

                    Text {
                        text: qsTr("Indeterminate")
                        font.pixelSize: 14
                        color: colors ? colors.textSecondaryColor : "#666"
                    }

                    Rin.ProgressRing {
                        size: 56
                        indeterminate: true
                    }
                }

                Column {
                    spacing: 4
                    horizontalAlignment: Qt.AlignHCenter

                    Text {
                        text: qsTr("Small")
                        font.pixelSize: 14
                        color: colors ? colors.textSecondaryColor : "#666"
                    }

                    Rin.ProgressRing {
                        size: 32
                        value: 75
                    }
                }

                Column {
                    spacing: 4
                    horizontalAlignment: Qt.AlignHCenter

                    Text {
                        text: qsTr("Paused")
                        font.pixelSize: 14
                        color: colors ? colors.textSecondaryColor : "#666"
                    }

                    Rin.ProgressRing {
                        size: 56
                        indeterminate: true
                        state: Rin.ProgressRing.Paused
                    }
                }

                Column {
                    spacing: 4
                    horizontalAlignment: Qt.AlignHCenter

                    Text {
                        text: qsTr("Error")
                        font.pixelSize: 14
                        color: colors ? colors.textSecondaryColor : "#666"
                    }

                    Rin.ProgressRing {
                        size: 56
                        indeterminate: true
                        state: Rin.ProgressRing.Error
                    }
                }
            }

            // Section: CheckBox
            Text {
                text: qsTr("CheckBox")
                font.pixelSize: 18
                font.bold: true
                color: colors ? colors.textColor : "#1b1b1b"
            }

            Column {
                spacing: 8
                width: parent.width

                Rin.CheckBox {
                    text: qsTr("Unchecked option")
                }

                Rin.CheckBox {
                    text: qsTr("Checked option")
                    checked: true
                }

                Rin.CheckBox {
                    text: qsTr("Indeterminate option")
                    checkState: Qt.PartiallyChecked
                }

                Rin.CheckBox {
                    text: qsTr("Disabled unchecked")
                    enabled: false
                }

                Rin.CheckBox {
                    text: qsTr("Disabled checked")
                    checked: true
                    enabled: false
                }
            }

            // Section: RadioButton
            Text {
                text: qsTr("RadioButton")
                font.pixelSize: 18
                font.bold: true
                color: colors ? colors.textColor : "#1b1b1b"
            }

            Column {
                spacing: 8
                width: parent.width

                Rin.RadioButton {
                    text: qsTr("Option A")
                }

                Rin.RadioButton {
                    text: qsTr("Option B")
                    checked: true
                }

                Rin.RadioButton {
                    text: qsTr("Option C")
                }

                Rin.RadioButton {
                    text: qsTr("Disabled")
                    enabled: false
                }
            }

            // Section: Switch
            Text {
                text: qsTr("Switch")
                font.pixelSize: 18
                font.bold: true
                color: colors ? colors.textColor : "#1b1b1b"
            }

            Column {
                spacing: 8
                width: parent.width

                Rin.Switch {
                    text: qsTr("Off state")
                }

                Rin.Switch {
                    text: qsTr("On state")
                    checked: true
                }

                Rin.Switch {
                    text: qsTr("Disabled Off")
                    enabled: false
                }

                Rin.Switch {
                    text: qsTr("Disabled On")
                    checked: true
                    enabled: false
                }
            }

            // Section: Slider
            Text {
                text: qsTr("Slider")
                font.pixelSize: 18
                font.bold: true
                color: colors ? colors.textColor : "#1b1b1b"
            }

            Column {
                spacing: 16
                width: parent.width

                Rin.Slider {
                    width: parent.width
                    from: 0
                    to: 100
                    value: 50
                    label: qsTr("Default: ") + Math.round(value)
                }

                Rin.Slider {
                    width: parent.width
                    from: 0
                    to: 100
                    value: 75
                    enabled: false
                    label: qsTr("Disabled")
                }
            }

            Item { height: 20 }
        }
    }
}
