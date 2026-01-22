import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15
import "../themes"
import "../utils"
import "../components" as Rin

/// 统一的控件卡片组件，用于在 AllSamplesPage 中展示控件预览
Rectangle {
    id: root

    property string title: ""
    property string description: ""
    property string page: ""
    property string iconSource: ""
    property var navigationView: null

    // 固定卡片尺寸
    implicitWidth: 240
    implicitHeight: 80

    // 统一的图片容器尺寸
    readonly property int iconSize: 48

    // 主题颜色 - 使用 themeManager
    property color cardColor: themeManager.currentTheme && themeManager.currentTheme.colors
        ? themeManager.currentTheme.colors.cardColor
        : "#ffffff"
    property color cardSecondaryColor: themeManager.currentTheme && themeManager.currentTheme.colors
        ? themeManager.currentTheme.colors.cardSecondaryColor
        : "#f5f5f5"
    property color textColor: themeManager.currentTheme && themeManager.currentTheme.colors
        ? themeManager.currentTheme.colors.textColor
        : "#1b1b1b"
    property color textSecondaryColor: themeManager.currentTheme && themeManager.currentTheme.colors
        ? themeManager.currentTheme.colors.textSecondaryColor
        : Qt.alpha("#000000", 0.6)
    property color controlColor: themeManager.currentTheme && themeManager.currentTheme.colors
        ? themeManager.currentTheme.colors.controlColor
        : "#ffffff"
    property color cardBorderColor: themeManager.currentTheme && themeManager.currentTheme.colors
        ? themeManager.currentTheme.colors.cardBorderColor
        : "#e5e5e5"
    property int smallRadius: themeManager.currentTheme && themeManager.currentTheme.appearance
        ? themeManager.currentTheme.appearance.smallRadius
        : 4

    color: cardColor
    radius: smallRadius
    border.width: 1
    border.color: cardBorderColor

    // 内边距
    property int cardPadding: 16

    // 悬停效果
    property bool isHovered: false

    onIsHoveredChanged: {
        color = isHovered ? cardSecondaryColor : cardColor
    }

    Behavior on color {
        ColorAnimation { duration: 150; easing.type: Easing.OutQuart }
    }

    // 点击效果
    TapHandler {
        onTapped: {
            if (root.navigationView && root.page) {
                root.navigationView.push(root.page)
            }
        }
    }

    // 悬停检测
    HoverHandler {
        id: hoverHandler
        onHoveredChanged: root.isHovered = hovered
    }

    RowLayout {
        anchors.fill: parent
        anchors.margins: root.cardPadding
        spacing: 12

        // 图片容器 - 固定尺寸
        Rectangle {
            Layout.preferredWidth: root.iconSize
            Layout.preferredHeight: root.iconSize
            color: controlColor
            radius: smallRadius
            clip: true

            Image {
                anchors.centerIn: parent
                source: root.iconSource
                width: parent.width * 0.8
                height: parent.height * 0.8
                fillMode: Image.PreserveAspectFit
                opacity: 0.85
                mipmap: true
            }
        }

        // 文本内容
        ColumnLayout {
            Layout.fillWidth: true
            spacing: 4

            Text {
                Layout.fillWidth: true
                text: root.title
                font.pixelSize: 14
                font.weight: Font.DemiBold
                color: textColor
                elide: Text.ElideRight
                maximumLineCount: 1
            }

            Text {
                Layout.fillWidth: true
                text: root.page
                font.pixelSize: 12
                color: textSecondaryColor
                elide: Text.ElideRight
                maximumLineCount: 1
            }
        }

        // 操作按钮
        Rin.Button {
            text: qsTr("Open")
            isFlat: true
            enabled: !!root.navigationView
            onClicked: {
                if (root.navigationView && root.page) {
                    root.navigationView.push(root.page)
                }
            }
        }
    }
}
