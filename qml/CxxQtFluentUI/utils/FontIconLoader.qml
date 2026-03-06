pragma Singleton
import QtQuick 2.15
import "../assets/fonts/FluentSystemIcons-Index.js" as FluentIcons

Item {
    id: root

    property string fontFamily: fontLoader.name
    property var fontIconIndex: FluentIcons.FluentIcons

    FontLoader {
        id: fontLoader
        source: Qt.resolvedUrl("../assets/fonts/FluentSystemIcons-Resizable.ttf")
    }

    Component.onCompleted: console.log("FontIconLoader: Status=", fontLoader.status, "Family=", fontLoader.name)
}
