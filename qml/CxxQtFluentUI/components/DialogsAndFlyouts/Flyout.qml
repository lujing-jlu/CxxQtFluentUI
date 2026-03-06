import QtQuick 2.15
import QtQuick.Layouts 2.15
import ".." as Rin

Rin.Popup {
    id: flyout

    property alias text: flyoutText.text
    property alias buttonBox: buttonLayout.data
    default property alias content: customContent.data

    position: Rin.Position.Top
    padding: 16

    contentItem: ColumnLayout {
        spacing: 0

        ColumnLayout {
            id: customContent
            spacing: 8
            Layout.fillWidth: true

            Text {
                id: flyoutText
                Layout.fillWidth: true
                font.pixelSize: 14
                wrapMode: Text.WordWrap
                visible: text.length > 0
            }
        }

        Item {
            height: 16
            visible: buttonLayout.children.length > 0
        }

        RowLayout {
            id: buttonLayout
            Layout.fillWidth: true
            spacing: 8
        }
    }
}

