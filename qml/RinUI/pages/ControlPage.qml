import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15
import "../windows"
import "../themes"
import "../components" as Rin

FluentPage {
    id: root
    wrapperWidth: parent ? (parent.width - 42 * 2) : 1000
    pageHorizontalPadding: 0
    contentSpacing: 32

    property var navigationView: null
    property var floatLayer: null
    property string badgeText: ""

    extraHeaderItems: [
        Rin.InfoBadge {
            text: root.badgeText
            visible: root.badgeText.length > 0
        }
    ]
}
