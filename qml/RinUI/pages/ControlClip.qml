import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15
import "../themes"
import "../components" as Rin

Rin.Clip {
    id: root
    width: 360
    height: 88

    property var navigationView: null

    readonly property string titleText: (modelData && modelData.title !== undefined) ? String(modelData.title) : ""
    readonly property string descText: (modelData && modelData.desc !== undefined) ? String(modelData.desc) : (modelData && modelData.page !== undefined ? String(modelData.page) : "")
    readonly property string iconName: (modelData && modelData.icon !== undefined) ? String(modelData.icon) : ""
    readonly property string pageName: (modelData && modelData.page !== undefined) ? String(modelData.page) : ""

    contentItem: RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 22
        anchors.rightMargin: 22
        spacing: 16

        Rin.Icon {
            Layout.alignment: Qt.AlignVCenter
            size: 24
            name: root.iconName
            visible: root.iconName.length > 0
            color: themeManager.currentTheme && themeManager.currentTheme.colors
                ? themeManager.currentTheme.colors.textColor
                : "#1b1b1b"
        }

        Column {
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignVCenter
            spacing: 2

            Text {
                width: parent.width
                font.pixelSize: 13
                font.weight: Font.DemiBold
                text: root.titleText
                elide: Text.ElideRight
            }

            Text {
                width: parent.width
                font.pixelSize: 12
                color: themeManager.currentTheme && themeManager.currentTheme.colors
                    ? themeManager.currentTheme.colors.textSecondaryColor
                    : "#6c6c6c"
                text: root.descText
                elide: Text.ElideRight
            }
        }
    }

    onClicked: {
        if (root.navigationView && root.pageName.length > 0) {
            root.navigationView.push(root.pageName)
        }
    }
}

