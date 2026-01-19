import QtQuick 2.15
import QtQuick.Controls.Basic 2.15
import "../utils" as Utils
import "../components" as Rin

Popup {
    id: contextMenu

    signal itemSelected(int index)

    property alias model: listView.model
    property alias currentIndex: listView.currentIndex
    property int maximumHeight: 300
    property string textRole: ""
    property bool keyboardNavigation: false

    readonly property var colors: themeManager.currentTheme.item ? themeManager.currentTheme.item.colors : QtObject {
        property color backgroundAcrylicColor: "#ffffff"
        property color controlBorderColor: "#8a8a8a"
        property color subtleColor: "transparent"
        property color subtleSecondaryColor: Qt.alpha("#000000", 0.06)
        property color subtleTertiaryColor: Qt.alpha("#000000", 0.12)
        property color textColor: "#1b1b1b"
    }

    readonly property var appearance: themeManager.currentTheme.item ? themeManager.currentTheme.item.appearance : QtObject {
        property int windowRadius: 8
        property int buttonRadius: 4
    }

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
        anchors.fill: parent
        anchors.topMargin: 2
        anchors.bottomMargin: 2

        ScrollBar.vertical: ScrollBar {
            id: scrollBar
            policy: ScrollBar.AsNeeded
        }
        model: control.popup.visible ? control.delegateModel : null

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
                radius: appearance.buttonRadius
                color: pressed
                    ? colors.subtleTertiaryColor
                    : (highlighted || hovered)
                        ? colors.subtleSecondaryColor
                        : colors.subtleColor

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
                    text: model[contextMenu.parent.textRole]
                    color: colors.textColor
                }

                Rin.Indicator {
                    currentItemHeight: itemBg.height
                    visible: highlighted
                    anchors.left: parent.left
                    anchors.leftMargin: 2
                    anchors.verticalCenter: parent.verticalCenter
                }

                Behavior on color { NumberAnimation { duration: 150; easing.type: Easing.InOutQuart } }
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
        radius: appearance.windowRadius
        color: colors.backgroundAcrylicColor
        border.color: colors.controlBorderColor
    }

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
                target: contextMenu
                property: "height"
                from: 46
                to: contextMenu.implicitHeight
                duration: 200
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
