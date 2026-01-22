import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15
import "../../themes"
import "../../utils"
import "../../components" as Rin

Item {
    id: root

    // Array of string or objects: { text, icon }
    property var model: []

    // When true, all crumbs are clickable (including the last one).
    property bool allowNavigateToCurrent: false

    signal crumbClicked(int index)

    implicitHeight: 32
    implicitWidth: row.implicitWidth

    RowLayout {
        id: row
        anchors.fill: parent
        spacing: 2

        Repeater {
            model: root.model || []
            delegate: Item {
                id: crumb
                Layout.preferredHeight: 32
                Layout.preferredWidth: Math.max(32, crumbButton.implicitWidth)

                readonly property bool isLast: index === ((root.model && root.model.length) ? (root.model.length - 1) : 0)
                readonly property var crumbData: modelData
                readonly property string label: (typeof crumbData === "string") ? crumbData : (crumbData && crumbData.text ? String(crumbData.text) : "")
                readonly property string iconName: (crumbData && typeof crumbData === "object" && crumbData.icon) ? String(crumbData.icon) : ""

                Rin.ToolButton {
                    id: crumbButton
                    anchors.verticalCenter: parent.verticalCenter
                    text: crumb.label
                    flat: true
                    hoverable: true
                    enabled: root.allowNavigateToCurrent ? true : !crumb.isLast
                    onClicked: root.crumbClicked(index)
                }

                Rin.Icon {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: crumbButton.right
                    anchors.leftMargin: 4
                    visible: !crumb.isLast
                    name: "ic_fluent_chevron_right_20_regular"
                    size: 14
                    color: themeManager.currentTheme.colors.textSecondaryColor
                }
            }
        }
    }
}
