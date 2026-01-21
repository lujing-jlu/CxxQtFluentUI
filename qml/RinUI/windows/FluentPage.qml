import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15
import "../themes"
import "../components"

Page {
    id: fluentPage
    default property alias content: container.data
    property alias contentHeader: headerContainer.data
    property alias customHeader: headerRow.data
    property alias extraHeaderItems: extraHeaderRow.data

    property int radius: themeManager.currentTheme && themeManager.currentTheme.appearance ?
        themeManager.currentTheme.appearance.windowRadius : 7
    property int wrapperWidth: 1000
    property int pageHorizontalPadding: 56
    property int pageBottomPadding: 24

    property alias contentSpacing: container.spacing

    property color textColor: themeManager.currentTheme && themeManager.currentTheme.colors ?
        themeManager.currentTheme.colors.textColor : "#1b1b1b"

    spacing: 0

    header: Item {
        height: fluentPage.title !== "" ? 36 + 44 : 0

        RowLayout {
            id: headerRow
            width: Math.min(fluentPage.width - fluentPage.pageHorizontalPadding * 2, fluentPage.wrapperWidth)
            anchors.horizontalCenter: parent.horizontalCenter
            height: parent.height

            Text {
                Layout.alignment: Qt.AlignLeft | Qt.AlignBottom
                font.pixelSize: 28
                font.weight: Font.Medium
                color: textColor
                text: fluentPage.title
                visible: fluentPage.title !== ""
            }

            Row {
                id: extraHeaderRow
                spacing: 4
                Layout.alignment: Qt.AlignRight | Qt.AlignBottom
            }
        }
    }

    background: Item {}

    Flickable {
        anchors.fill: parent
        clip: true
        contentHeight: container.height + 18 + headerContainer.height

        Row {
            id: headerContainer
            width: fluentPage.width
        }

        ColumnLayout {
            id: container
            anchors.top: headerContainer.bottom
            anchors.topMargin: 18
            anchors.horizontalCenter: parent.horizontalCenter
            width: Math.min(fluentPage.width - fluentPage.pageHorizontalPadding * 2, fluentPage.wrapperWidth)
            spacing: 14
        }
    }
}
