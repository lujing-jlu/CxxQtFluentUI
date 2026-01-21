import QtQuick 2.15
import QtQuick.Controls.Basic 2.15
import "../utils"
import "../components" as Rin

Popup {
    id: contextMenu

    signal itemSelected(int index)

    property alias model: listView.model
    property alias currentIndex: listView.currentIndex
    property int maximumHeight: 300
    property string textRole: ""
    property bool keyboardNavigation: false
    readonly property string effectiveTextRole: {
        if (contextMenu.parent && contextMenu.parent.textRole !== undefined && contextMenu.parent.textRole !== "") {
            return String(contextMenu.parent.textRole)
        }
        return String(contextMenu.textRole || "")
    }

    // Use direct property access (参考 Rin-UI)
    property color backgroundAcrylicColor: themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors.backgroundAcrylicColor : "#ffffff"
    property color controlBorderColor: themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors.controlBorderColor : "#8a8a8a"
    property color subtleColor: "transparent"
    property color subtleSecondaryColor: themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors.subtleSecondaryColor : Qt.alpha("#000000", 0.06)
    property color subtleTertiaryColor: themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors.subtleTertiaryColor : Qt.alpha("#000000", 0.12)
    property color textColor: themeManager.currentTheme && themeManager.currentTheme.colors ? themeManager.currentTheme.colors.textColor : "#1b1b1b"

    property int windowRadius: themeManager.currentTheme ? themeManager.currentTheme.appearance.windowRadius : 8
    property int buttonRadius: themeManager.currentTheme ? themeManager.currentTheme.appearance.buttonRadius : 4

    implicitWidth: 100
    implicitHeight: Math.min(listView.contentHeight + 6, maximumHeight)
    y: (parent.height - contextMenu.height) / 2
    height: implicitHeight
    closePolicy: Popup.CloseOnPressOutside
    focus: true

    contentItem: ListView {
        id: listView
        clip: true
        focus: true
        spacing: 0
        model: []
        anchors.fill: parent
        anchors.topMargin: 2
        anchors.bottomMargin: 2

        ScrollBar.vertical: ScrollBar {
            id: scrollBar
            policy: ScrollBar.AsNeeded
            visible: false
            opacity: 0
        }

        delegate: ItemDelegate {
            id: delegate
            width: listView.width
            height: text.implicitHeight + 20
            highlighted: ListView.isCurrentItem
            focusPolicy: Qt.StrongFocus

            background: Rectangle {
                id: itemBg
                anchors.fill: parent
                anchors.leftMargin: 5
                anchors.rightMargin: 5
                anchors.topMargin: 3
                radius: contextMenu.buttonRadius
                color: pressed
                    ? subtleTertiaryColor
                    : (highlighted || hovered)
                        ? subtleSecondaryColor
                        : subtleColor

                Text {
                    id: text
                    anchors.fill: parent
                    anchors.leftMargin: 11
                    anchors.rightMargin: 11
                    anchors.topMargin: 6
                    anchors.bottomMargin: 8
                    verticalAlignment: Text.AlignVCenter
                    font.pixelSize: 14
                    wrapMode: Text.Wrap
                    text: {
                        if (contextMenu.effectiveTextRole !== "") {
                            if (model && model[contextMenu.effectiveTextRole] !== undefined) return model[contextMenu.effectiveTextRole]
                            if (modelData && modelData[contextMenu.effectiveTextRole] !== undefined) return modelData[contextMenu.effectiveTextRole]
                        }
                        if (typeof modelData === "string") return modelData
                        if (modelData && modelData.text !== undefined) return modelData.text
                        return ""
                    }
                    color: textColor
                }

                Rin.Indicator {
                    currentItemHeight: itemBg.height
                    visible: highlighted
                    anchors.left: parent.left
                    anchors.leftMargin: 2
                    anchors.verticalCenter: parent.verticalCenter
                }

                Rin.FocusIndicator {
                    control: delegate
                    forceVisible: highlighted && contextMenu.keyboardNavigation
                }

                Behavior on color { ColorAnimation { duration: Utils.appearanceSpeed; easing.type: Easing.InOutQuart } }
            }

            Keys.onUpPressed: {
                contextMenu.keyboardNavigation = true
                listView.decrementCurrentIndex()
            }

            Keys.onDownPressed: {
                contextMenu.keyboardNavigation = true
                listView.incrementCurrentIndex()
            }

            onClicked: {
                contextMenu.close()
                listView.currentIndex = index
                contextMenu.itemSelected(index)
            }
        }
    }

    background: Rectangle {
        id: background
        anchors.fill: parent
        radius: contextMenu.windowRadius
        color: backgroundAcrylicColor
        border.color: controlBorderColor

        layer.enabled: true
        layer.effect: Rin.Shadow {
            id: shadow
            style: "flyout"
            source: background
        }
    }

    Behavior on y { NumberAnimation { duration: Utils.animationSpeed; easing.type: Easing.InOutQuart } }

    enter: Transition {
        ParallelAnimation {
            NumberAnimation {
                target: contextMenu
                property: "opacity"
                from: 0
                to: 1
                duration: 70
                easing.type: Easing.InOutQuart
            }
            NumberAnimation {
                target: scrollBar
                property: "opacity"
                from: 0
                to: 1
                duration: 1000
                easing.type: Easing.InOutCubic
            }
            NumberAnimation {
                target: contextMenu
                property: "height"
                from: 46
                to: contextMenu.implicitHeight
                duration: Utils.animationSpeedMiddle
                easing.type: Easing.OutQuint
                onRunningChanged: {
                    scrollBar.visible = true;
                }
            }
        }
    }
    exit: Transition {
        ParallelAnimation {
            NumberAnimation {
                target: contextMenu
                property: "opacity"
                from: 1
                to: 0
                duration: 150
                easing.type: Easing.InOutQuart
            }
        }
    }
}
