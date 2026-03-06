import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15
import "../../themes"
import "../../components" as Rin
import "../../utils" as Utils


Button {
    id: root
    property alias color: frameBackground.color
    property alias radius: frameBackground.radius
    property alias borderColor: frameBackground.borderColor
    property alias borderWidth: frameBackground.borderWidth

    background: Rin.Frame {
        id: frameBackground
        anchors.fill: parent
        opacity: 1
    }

    contentItem: Item {}
}
