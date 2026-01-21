import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15
import "../themes"
import "../components" as Rin

Item {
    id: root

    default property alias content: controlContainer.data
    property alias showcase: showcaseContainer.data
    property alias showcaseWidth: rightPane.width

    property int spacing: 4

    implicitWidth: frame.implicitWidth
    implicitHeight: frame.implicitHeight

    Rin.Frame {
        id: frame
        anchors.fill: parent
    }

    RowLayout {
        anchors.fill: parent
        spacing: 0

        Column {
            id: controlContainer
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.margins: 20
            spacing: root.spacing
        }

        Rectangle {
            id: rightPane
            width: 200
            Layout.fillHeight: true
            implicitHeight: showcaseContainer.implicitHeight + 2 * 16
            radius: themeManager.currentTheme && themeManager.currentTheme.appearance
                ? themeManager.currentTheme.appearance.smallRadius
                : 4
            color: themeManager.currentTheme && themeManager.currentTheme.colors
                ? themeManager.currentTheme.colors.backgroundAcrylicColor
                : "#ffffff"
            border.width: themeManager.currentTheme && themeManager.currentTheme.appearance
                ? themeManager.currentTheme.appearance.borderWidth
                : 1
            border.color: themeManager.currentTheme && themeManager.currentTheme.colors
                ? themeManager.currentTheme.colors.cardBorderColor
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

