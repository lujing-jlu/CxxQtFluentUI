import QtQuick 2.15
import QtQuick.Controls.Basic 2.15
import "../utils" as Utils
import "../components" as Rin

ComboBox {
    id: root

    readonly property var colors: themeManager.currentTheme.item ? themeManager.currentTheme.item.colors : QtObject {
        property color primaryColor: "#0078D4"
        property color controlColor: "#ffffff"
        property color controlBorderColor: "#8a8a8a"
        property color controlBottomBorderColor: "#8a8a8a"
        property color controlSecondaryColor: Qt.alpha("#000000", 0.04)
        property color controlTertiaryColor: Qt.alpha("#000000", 0.08)
        property color textColor: "#1b1b1b"
        property color textSecondaryColor: Qt.alpha("#000000", 0.6)
    }

    readonly property var appearance: themeManager.currentTheme.item ? themeManager.currentTheme.item.appearance : QtObject {
        property int buttonRadius: 4
        property int borderWidth: 1
    }

    property string placeholderText: ""
    property alias maximumHeight: menu.maximumHeight

    implicitWidth: Math.max(contentItem.implicitWidth + 50, 60)
    padding: 0

    // Focus indicator
    Rin.Indicator {
        id: focusIndicator
        anchors.left: parent.left
        anchors.leftMargin: 2
        anchors.verticalCenter: parent.verticalCenter
        visible: root.activeFocus
    }

    // Background
    background: Rectangle {
        id: background
        anchors.fill: parent
        color: colors.controlColor
        radius: appearance.buttonRadius
        border.width: appearance.borderWidth
        border.color: colors.controlBorderColor

        // Bottom border indicator
        Rectangle {
            id: indicator
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            height: appearance.borderWidth
            color: colors.controlBottomBorderColor
        }

        Behavior on color { ColorAnimation { duration: 150; easing.type: Easing.OutQuart } }
    }

    // Dropdown indicator
    indicator: Rin.ToolButton {
        id: dropIndicator
        flat: true
        width: 32
        height: 24
        focusPolicy: editable ? Qt.StrongFocus : Qt.NoFocus
        anchors.right: parent.right
        anchors.margins: 4
        anchors.verticalCenter: parent.verticalCenter
        icon.name: "ic_fluent_chevron_down_20_regular"
        size: 14
        color: colors.textSecondaryColor
        hoverable: editable

        onClicked: menu.open()
    }

    // Clear button (for editable combo box)
    Rin.ToolButton {
        id: clearButton
        flat: true
        width: 24
        height: 24
        focusPolicy: root.editable ? Qt.StrongFocus : Qt.NoFocus
        anchors.right: dropIndicator.left
        anchors.rightMargin: 4
        anchors.verticalCenter: parent.verticalCenter
        icon.name: "ic_fluent_dismiss_20_regular"
        size: 14
        color: colors.textSecondaryColor
        hoverable: root.editable
        visible: root.editable && root.displayText.length > 0

        onClicked: {
            root.editText = ""
            root.currentIndex = -1
        }
    }

    // Content item
    contentItem: Rin.TextField {
        id: text
        anchors.fill: parent
        text: root.displayText
        editable: root.editable
        frameless: true
        placeholderText: root.placeholderText
        clearEnabled: false
        leftPadding: 12
        rightPadding: 36
    }

    // Popup menu
    popup: Rin.ContextMenu {
        id: menu
        width: root.width
        model: root.model
        currentIndex: root.currentIndex

        function handleItemSelected(index) {
            root.currentIndex = index
            return true
        }
        onItemSelected: (index) => handleItemSelected(index)
    }

    // Animations
    Behavior on opacity { NumberAnimation { duration: 150; easing.type: Easing.OutQuart } }
    Behavior on implicitWidth { NumberAnimation { duration: 100; easing.type: Easing.InOutQuart } }

    // States
    states: [
        State {
            name: "disabled"
            when: !enabled
            PropertyChanges {
                target: root;
                opacity: 0.4
            }
        },
        State {
            name: "pressed"
            when: pressed
            PropertyChanges {
                target: background;
                color: colors.controlTertiaryColor
            }
        },
        State {
            name: "hovered"
            when: hovered
            PropertyChanges {
                target: background;
                opacity: 1
                color: colors.controlSecondaryColor
            }
        }
    ]
}
