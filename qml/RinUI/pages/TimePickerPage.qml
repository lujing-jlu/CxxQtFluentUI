import QtQuick 2.15
import QtQuick.Layouts 1.15
import "../components" as Rin

DemoPage {
    title: qsTr("TimePicker")
    description: qsTr("Pick a time.")

    Rin.TimePicker {
        id: picker
    }

    Text {
        text: qsTr("Selected: %1:%2").arg(picker.hour).arg(("0" + picker.minute).slice(-2))
    }
}
