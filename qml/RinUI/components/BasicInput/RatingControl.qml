import QtQuick 2.15
import QtQuick.Layouts 2.15
import "../../themes"
import "../../utils"
import "../../components" as Rin

Item {
    id: root

    property int value: 0
    property int maximum: 5
    property int starSize: 18
    property bool readOnly: false

    // When true, hovering updates visuals before click.
    property bool previewOnHover: true

    signal valueChangedByUser(int value)

    implicitHeight: starSize
    implicitWidth: row.implicitWidth

    property color filledColor: themeManager.currentTheme && themeManager.currentTheme.colors
        ? themeManager.currentTheme.colors.primaryColor
        : "#0078D4"
    property color emptyColor: themeManager.currentTheme && themeManager.currentTheme.colors
        ? themeManager.currentTheme.colors.textSecondaryColor
        : "#6c6c6c"

    property int _hoverValue: -1

    function _clamp(v) {
        if (maximum <= 0) return 0
        if (v < 0) return 0
        if (v > maximum) return maximum
        return v
    }

    onMaximumChanged: value = _clamp(value)
    onValueChanged: value = _clamp(value)

    RowLayout {
        id: row
        anchors.fill: parent
        spacing: 4

        Repeater {
            model: Math.max(0, root.maximum)
            delegate: Item {
                id: star
                width: root.starSize
                height: root.starSize

                readonly property int ratingValue: index + 1
                readonly property int displayValue: (root.previewOnHover && root._hoverValue >= 0) ? root._hoverValue : root.value

                Rin.Icon {
                    anchors.centerIn: parent
                    name: star.ratingValue <= star.displayValue
                        ? "ic_fluent_star_20_filled"
                        : "ic_fluent_star_20_regular"
                    size: root.starSize
                    color: star.ratingValue <= star.displayValue ? root.filledColor : root.emptyColor

                    Behavior on color { ColorAnimation { duration: Utils.appearanceSpeed; easing.type: Easing.OutQuart } }
                }

                MouseArea {
                    anchors.fill: parent
                    hoverEnabled: true
                    cursorShape: root.readOnly ? Qt.ArrowCursor : Qt.PointingHandCursor
                    enabled: !root.readOnly && root.enabled

                    onEntered: root._hoverValue = star.ratingValue
                    onExited: root._hoverValue = -1
                    onClicked: {
                        root.value = star.ratingValue
                        root.valueChangedByUser(root.value)
                    }
                }
            }
        }
    }
}

