import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import "../themes"
import "../components" as Rin

ScrollView {
    id: root
    Layout.fillWidth: true
    Layout.fillHeight: true
    clip: true
    contentWidth: availableWidth

    property var navigationView: null
    property string title: ""
    property string description: ""

    default property alias content: contentColumn.data

    ColumnLayout {
        width: parent.width
        spacing: 24

        ColumnLayout {
            Layout.fillWidth: true
            Layout.margins: 40
            spacing: 8

            Text {
                text: root.title
                font.pixelSize: 32
                font.weight: Font.Bold
                color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.textColor
                    : "#1b1b1b"
            }

            Text {
                text: root.description
                visible: root.description.length > 0
                font.pixelSize: 14
                color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.textSecondaryColor
                    : "#6c6c6c"
            }
        }

        ColumnLayout {
            id: contentColumn
            Layout.fillWidth: true
            Layout.leftMargin: 40
            Layout.rightMargin: 40
            spacing: 16
        }
    }
}

