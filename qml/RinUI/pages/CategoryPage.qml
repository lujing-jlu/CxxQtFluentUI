import QtQuick 2.15
import QtQuick.Layouts 2.15
import "."

DemoPage {
    id: root
    property var items: []

    Grid {
        Layout.fillWidth: true
        columns: Math.max(1, Math.floor(width / (360 + 12)))
        rowSpacing: 12
        columnSpacing: 12

        Repeater {
            model: root.items
            delegate: ControlClip {
                navigationView: root.navigationView
            }
        }
    }
}
