import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15
import "../components" as Rin
import "../themes"

Rin.Clip {
    id: root
    width: 220
    height: 216
    radius: ThemeManager.currentTheme && ThemeManager.currentTheme.appearance
        ? ThemeManager.currentTheme.appearance.windowRadius
        : 7

    Rin.Icon {
        anchors {
            bottom: parent.bottom
            right: parent.right
            margins: 12
        }
        size: 18
        name: "ic_fluent_open_20_regular"
        opacity: 0.9
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 24
        spacing: 24

        Image {
            Layout.alignment: Qt.AlignVCenter
            source: modelData && modelData.icon ? modelData.icon : ""
            fillMode: Image.PreserveAspectFit
            Layout.preferredWidth: 60
            Layout.preferredHeight: 60
            mipmap: true
        }

        Column {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignVCenter

            Text {
                width: parent.width
                font.pixelSize: 18
                font.weight: Font.DemiBold
                text: modelData && modelData.title ? modelData.title : ""
                elide: Text.ElideRight
            }

            Text {
                width: parent.width
                font.pixelSize: 12
                color: ThemeManager.currentTheme && ThemeManager.currentTheme.colors
                    ? ThemeManager.currentTheme.colors.textSecondaryColor
                    : "#6c6c6c"
                text: modelData && modelData.desc ? modelData.desc : ""
                wrapMode: Text.WordWrap
            }
        }
    }

    onClicked: {
        if (modelData && modelData.url) {
            Qt.openUrlExternally(modelData.url)
        }
    }
}
