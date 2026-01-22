import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15
import "../../themes"
import "../../utils"
import "../../components" as Rin

Control {
    id: root

    // Array of commands: { icon, text, enabled, visible, shortcut }
    property var primaryCommands: []
    property var secondaryCommands: []

    signal primaryTriggered(int index)
    signal secondaryTriggered(int index)

    implicitHeight: 44
    implicitWidth: Math.max(240, contentItem.implicitWidth)

    property color layerColor: themeManager.currentTheme && themeManager.currentTheme.colors
        ? themeManager.currentTheme.colors.layerColor
        : Qt.alpha("#ffffff", 0.5)
    property color borderColor: themeManager.currentTheme && themeManager.currentTheme.colors
        ? themeManager.currentTheme.colors.flyoutBorderColor
        : Qt.alpha("#000000", 0.06)
    property int radius: themeManager.currentTheme && themeManager.currentTheme.appearance
        ? themeManager.currentTheme.appearance.windowRadius
        : 7

    background: Rectangle {
        anchors.fill: parent
        radius: root.radius
        color: root.layerColor
        border.width: 1
        border.color: root.borderColor
    }

    contentItem: RowLayout {
        anchors.fill: parent
        anchors.margins: 4
        spacing: 6

        Repeater {
            model: root.primaryCommands || []
            delegate: CommandBarButton {
                iconName: modelData && modelData.icon ? String(modelData.icon) : ""
                text: modelData && modelData.text ? String(modelData.text) : ""
                enabled: modelData && modelData.enabled !== undefined ? !!modelData.enabled : true
                visible: modelData && modelData.visible !== undefined ? !!modelData.visible : true
                onClicked: root.primaryTriggered(index)
            }
        }

        Item { Layout.fillWidth: true }

        CommandBarButton {
            id: overflowButton
            visible: (root.secondaryCommands && root.secondaryCommands.length) ? true : false
            iconName: "ic_fluent_more_horizontal_20_regular"
            text: ""
            implicitWidth: 40
            onClicked: overflowMenu.open()

            Rin.Menu {
                id: overflowMenu
                position: Rin.Position.Bottom

                Repeater {
                    model: root.secondaryCommands || []
                    delegate: Rin.MenuItem {
                        text: modelData && modelData.text ? String(modelData.text) : ""
                        enabled: modelData && modelData.enabled !== undefined ? !!modelData.enabled : true
                        visible: modelData && modelData.visible !== undefined ? !!modelData.visible : true
                        icon.name: modelData && modelData.icon ? String(modelData.icon) : ""
                        shortcut: modelData && modelData.shortcut ? String(modelData.shortcut) : ""
                        onTriggered: root.secondaryTriggered(index)
                    }
                }
            }
        }
    }
}

