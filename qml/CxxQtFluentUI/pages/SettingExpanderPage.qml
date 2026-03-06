import QtQuick 2.15
import QtQuick.Layouts 1.15
import "../components" as Rin

DemoPage {
    title: qsTr("SettingExpander")
    description: qsTr("Expander with SettingCard-style header.")

    Rin.SettingExpander {
        id: expander
        Layout.fillWidth: true
        title: qsTr("Advanced settings")
        description: qsTr("Click to expand")
        icon.name: "ic_fluent_settings_20_regular"

        ColumnLayout {
            spacing: 10
            Rin.Switch { text: qsTr("Enable feature"); checked: true }
            Rin.Slider { from: 0; to: 10; value: 6 }
        }
    }
}
