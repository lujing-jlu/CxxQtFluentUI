import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15
import "../../components"
import "../../themes"


DialogButtonBox {
    id: buttonBox

    implicitWidth: 320

    background: Rectangle {
        anchors.fill: parent
        color: ThemeManager.currentTheme.colors.backgroundColor
        border.color: ThemeManager.currentTheme.colors.windowBorderColor
        radius: ThemeManager.currentTheme.appearance.windowRadius

        Rectangle {
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.margins: 1
            height: parent.radius
            color: parent.color
        }
    }

    padding: 24
    spacing: 8

    alignment: undefined

    contentItem: RowLayout {
        spacing: buttonBox.spacing

        Repeater {
            model: buttonBox.contentModel
        }
    }

    delegate: Button {
        Layout.alignment: Qt.AlignRight
        Layout.preferredWidth: buttonBox.availableWidth / 2
        Layout.fillWidth: !(buttonBox.count === 1)
        highlighted: DialogButtonBox.buttonRole === DialogButtonBox.AcceptRole  // 高亮
    }
}
