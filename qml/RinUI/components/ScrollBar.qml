import QtQuick 2.15
import QtQuick.Templates 2.15 as T
import "../themes"
import "../utils"

T.ScrollBar {
    id: scrollBar

    property int minimumWidth: themeManager.currentTheme && themeManager.currentTheme.appearance ?
        themeManager.currentTheme.appearance.scrollBarMinWidth : 2
    property int expandWidth: themeManager.currentTheme && themeManager.currentTheme.appearance ?
        themeManager.currentTheme.appearance.scrollBarWidth : 6

    property int appearanceSpeed: 250

    property color controlStrongColor: themeManager.currentTheme && themeManager.currentTheme.colors ?
        themeManager.currentTheme.colors.controlStrongColor : Qt.alpha("#000000", 0.4458)
    property color backgroundAcrylicColor: themeManager.currentTheme && themeManager.currentTheme.colors ?
        themeManager.currentTheme.colors.backgroundAcrylicColor : "#F9F9F9"
    property color textSecondaryColor: themeManager.currentTheme && themeManager.currentTheme.colors ?
        themeManager.currentTheme.colors.textSecondaryColor : Qt.alpha("#000000", 0.6063)

    implicitWidth: horizontal
        ? availableWidth
        : implicitContentWidth + leftPadding + rightPadding

    implicitHeight: vertical
        ? availableHeight
        : implicitContentHeight + topPadding + bottomPadding

    anchors.verticalCenter: vertical && parent ? parent.verticalCenter : undefined
    anchors.horizontalCenter: horizontal && parent ? parent.horizontalCenter : undefined
    anchors.right: vertical && parent ? parent.right : undefined
    anchors.bottom: horizontal && parent ? parent.bottom : undefined

    verticalPadding: vertical ? 15 : 3
    horizontalPadding: horizontal ? 15 : 3
    enabled: size < 1.0

    // 控制按钮 / Control Button //
    ToolButton {
        background: Item {}

        width: 15
        height: 15
        iconSize: 8
        iconColor: textSecondaryColor
        iconName: vertical ? "ic_fluent_triangle_up_20_filled" : "ic_fluent_triangle_left_20_filled"
        anchors {
            top: vertical ? parent.top : undefined
            left: horizontal ? parent.left : undefined
            horizontalCenter: vertical ? parent.horizontalCenter : undefined
            verticalCenter: horizontal ? parent.verticalCenter : undefined
        }
        onClicked: scrollBar.decrease()

        visible: scrollBar.size < 1.0
        opacity: background.opacity
    }

    ToolButton {
        background: Item {}

        width: 15
        height: 15
        iconSize: 8
        iconColor: textSecondaryColor
        iconName: vertical ? "ic_fluent_triangle_down_20_filled" : "ic_fluent_triangle_right_20_filled"
        anchors {
            bottom: vertical ? parent.bottom : undefined
            right: horizontal ? parent.right : undefined
            horizontalCenter: vertical ? parent.horizontalCenter : undefined
            verticalCenter: horizontal ? parent.verticalCenter : undefined
        }
        onClicked: scrollBar.increase()

        visible: scrollBar.size < 1.0
        opacity: background.opacity
    }

    // 内容 / Content //
    contentItem: Item {
        id: item
        property bool collapsed: (
            scrollBar.policy === ScrollBar.AlwaysOn || (scrollBar.active)
        )

        implicitWidth: scrollBar.interactive ? scrollBar.expandWidth : scrollBar.minimumWidth
        implicitHeight: scrollBar.interactive ? scrollBar.expandWidth : scrollBar.minimumWidth

        Rectangle {
            id: bar
            width: vertical ? scrollBar.minimumWidth : parent.width
            height: horizontal ? scrollBar.minimumWidth : parent.height
            color: controlStrongColor
            anchors {
                right: vertical ? parent.right : undefined
                bottom: horizontal ? parent.bottom : undefined
            }
            radius: 9999
            visible: scrollBar.size < 1.0

            Behavior on color {
                ColorAnimation {
                    duration: appearanceSpeed
                    easing.type: Easing.OutCubic
                }
            }
        }

        states: [
            State {
                name: "collapsed"
                when: contentItem.collapsed
                PropertyChanges {
                    target: bar
                    width: vertical ? scrollBar.expandWidth : parent.width
                    height: horizontal ? scrollBar.expandWidth : parent.height
                }
            },
            State {
                name: "minimum"
                when: !contentItem.collapsed
                PropertyChanges {
                    target: bar
                    width: vertical ? scrollBar.minimumWidth : parent.width
                    height: horizontal ? scrollBar.minimumWidth : parent.height
                }
            }
        ]
        transitions: [
            Transition {
                to: "minimum"
                SequentialAnimation {
                    PauseAnimation { duration: 450 }
                    NumberAnimation {
                        target: bar
                        properties: vertical ? "width" : "height"
                        duration: 167
                        easing.type: Easing.OutCubic
                    }
                }
            },
            Transition {
                to: "collapsed"
                SequentialAnimation {
                    PauseAnimation { duration: 150 }
                    NumberAnimation {
                        target: bar
                        properties: vertical ? "width" : "height"
                        duration: 167
                        easing.type: Easing.OutCubic
                    }
                }
            }
        ]
    }

    // 背景 / Background //
    background: Rectangle {
        id: background
        radius: 5
        color: backgroundAcrylicColor
        opacity: 0
        visible: scrollBar.size < 1.0

        states: [
            State {
                name: "show"
                when: contentItem.collapsed
                PropertyChanges {
                    target: background
                    opacity: 1
                }
            },
            State {
                name: "hide"
                when: !contentItem.collapsed
                PropertyChanges {
                    target: background
                    opacity: 0
                }
            }
        ]

        transitions: [
            Transition {
                to: "hide"
                SequentialAnimation {
                    PauseAnimation { duration: 450 }
                    NumberAnimation {
                        target: background
                        properties: "opacity"
                        duration: 167
                        easing.type: Easing.OutCubic
                    }
                }
            },
            Transition {
                to: "show"
                SequentialAnimation {
                    PauseAnimation { duration: 150 }
                    NumberAnimation {
                        target: background
                        properties: "opacity"
                        duration: 167
                        easing.type: Easing.OutCubic
                    }
                }
            }
        ]
    }
}
