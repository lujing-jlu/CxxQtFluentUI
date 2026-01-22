import QtQuick 2.15
import QtQuick.Layouts 2.15
import "../components" as Rin

DemoPage {
    id: root
    title: qsTr("CommandBar")
    description: qsTr("A toolbar that provides a consistent set of actions and an overflow menu.")

    Rin.CommandBar {
        id: bar
        Layout.fillWidth: true

        primaryCommands: [
            { icon: "ic_fluent_add_20_regular", text: qsTr("New") },
            { icon: "ic_fluent_save_20_regular", text: qsTr("Save") },
            { icon: "ic_fluent_delete_20_regular", text: qsTr("Delete"), enabled: true }
        ]

        secondaryCommands: [
            { icon: "ic_fluent_share_20_regular", text: qsTr("Share"), shortcut: "Ctrl+S" },
            { icon: "ic_fluent_copy_20_regular", text: qsTr("Copy"), shortcut: "Ctrl+C" },
            { icon: "ic_fluent_settings_20_regular", text: qsTr("Settings") }
        ]

        onPrimaryTriggered: function(i) {
            toast.show(qsTr("Primary command %1").arg(i + 1))
        }
        onSecondaryTriggered: function(i) {
            toast.show(qsTr("Secondary command %1").arg(i + 1))
        }
    }

    Rin.Toast {
        id: toast
        Layout.fillWidth: true
        title: qsTr("CommandBar")
        text: qsTr("Use the buttons above or open the overflow menu.")
        severity: Rin.Severity.Info
        visible: false

        function show(msg) {
            text = msg
            visible = true
            closeTimer.restart()
        }

        Timer {
            id: closeTimer
            interval: 1200
            onTriggered: toast.visible = false
        }
    }
}
