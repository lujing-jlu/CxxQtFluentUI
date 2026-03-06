import QtQuick 2.15
import QtQuick.Layouts 2.15
import "../components" as Rin
import "../themes"

Rin.Frame {
    id: frame

    default property alias content: controlContainer.data
    property alias showcase: showcaseContainer.data
    property alias showcaseWidth: rightPane.width

    spacing: 4

    leftPadding: 0
    rightPadding: 0
    topPadding: 0
    bottomPadding: 0

    RowLayout {
        anchors.fill: parent
        spacing: 0

        Column {
            id: controlContainer
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.margins: 20
            spacing: frame.spacing
        }

        Rectangle {
            id: rightPane
            width: 200
            Layout.fillHeight: true
            implicitHeight: showcaseContainer.implicitHeight + 2 * 16
            radius: ThemeManager.currentTheme && ThemeManager.currentTheme.appearance
                ? ThemeManager.currentTheme.appearance.smallRadius
                : 4
            color: ThemeManager.currentTheme && ThemeManager.currentTheme.colors
                ? ThemeManager.currentTheme.colors.backgroundAcrylicColor
                : "#ffffff"
            border.width: ThemeManager.currentTheme && ThemeManager.currentTheme.appearance
                ? ThemeManager.currentTheme.appearance.borderWidth
                : 1
            border.color: ThemeManager.currentTheme && ThemeManager.currentTheme.colors
                ? ThemeManager.currentTheme.colors.cardBorderColor
                : "#e5e5e5"

            Column {
                id: showcaseContainer
                anchors.fill: parent
                anchors.margins: 16
                spacing: 4
            }
        }
    }
}
