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
    readonly property string descText: (modelData && modelData.desc !== undefined) ? String(modelData.desc) : ""
    readonly property string iconValue: (modelData && modelData.icon !== undefined) ? String(modelData.icon) : ""
    readonly property string pageName: (modelData && modelData.page !== undefined) ? String(modelData.page) : ""

    readonly property bool showDot: (modelData && ((modelData.added !== undefined && modelData.added) || (modelData.updated !== undefined && modelData.updated)))
    readonly property bool iconIsImage: iconValue.indexOf("/") !== -1 || iconValue.indexOf(".") !== -1 || iconValue.indexOf(":") !== -1

    Rin.InfoBadge {
        anchors.top: parent.top
        anchors.right: parent.right
        anchors.margins: 12
        width: 8
        height: 8
        text: "·"
        visible: root.showDot
    }

    contentItem: RowLayout {
        anchors.fill: parent
        anchors.leftMargin: 22
        anchors.rightMargin: 22
        spacing: 16

        Item {
            Layout.alignment: Qt.AlignVCenter
            Layout.preferredWidth: root.iconIsImage ? 40 : 24
            Layout.preferredHeight: root.iconIsImage ? 40 : 24

            Image {
                anchors.centerIn: parent
                source: root.iconIsImage ? root.iconValue : ""
                fillMode: Image.PreserveAspectFit
                width: 40
                height: 40
                visible: root.iconIsImage && root.iconValue.length > 0
                mipmap: true
            }

            Rin.Icon {
                anchors.centerIn: parent
                size: 24
                name: root.iconIsImage ? "" : root.iconValue
                visible: !root.iconIsImage && root.iconValue.length > 0
                color: ThemeManager.currentTheme && ThemeManager.currentTheme.colors
                    ? ThemeManager.currentTheme.colors.textColor
                    : "#1b1b1b"
            }
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
                color: ThemeManager.currentTheme && ThemeManager.currentTheme.colors
                    ? ThemeManager.currentTheme.colors.textSecondaryColor
                    : "#6c6c6c"
                text: root.descText.length > 0 ? root.descText : root.pageName
                elide: Text.ElideRight
            }
        }
    }

    onClicked: {
        if (root.navigationView && root.pageName.length > 0) {
            if (typeof root.navigationView.safePush === "function") {
                root.navigationView.safePush(root.pageName)
            } else if (typeof root.navigationView.push === "function") {
                root.navigationView.push(root.pageName)
            }
        }
    }
}
