import QtQuick 2.15
import QtQuick.Controls.Basic 2.15
import "../../components"
import "../../themes"
import "../../utils"

MenuBar {
    id: menuBar
    padding: 4

    delegate: MenuBarItem {
        id: menuBarItem
        focusPolicy: Qt.StrongFocus  // to get keyboard focus

        // accessibility
        FocusIndicator {
            control: parent
        }

        padding: 6
        topPadding: 5
        bottomPadding: 7

        contentItem: Text {
            id: text
            anchors.centerIn: parent
            font.pixelSize: 14
            horizontalAlignment: Text.AlignHCenter
            text: menuBarItem.text
        }

        background: Rectangle {
            id: background
            implicitHeight: 32
            color: themeManager.currentTheme.colors.subtleSecondaryColor
            radius: themeManager.currentTheme.appearance.buttonRadius

            Behavior on color { ColorAnimation { duration: Utils.appearanceSpeed; easing.type: Easing.OutQuart } }
            opacity: !hovered ? 0 : 1
        }
    }

    background: Item {}
}
