pragma Singleton
import QtQuick 2.15
import "../assets/fonts/FluentSystemIcons-Index.js" as FluentIcons

QtObject {
    property string primaryColor: "#0078D4"
    property bool backdropEnabled: false
    property int animationSpeed: 250
    property int animationSpeedMiddle: 350
    property int animationSpeedFaster: 150
    property int appearanceSpeed: 150

    // Font icon support
    property string fontIconSource: Qt.resolvedUrl("../assets/fonts/FluentSystemIcons-Resizable.ttf")
    property var fontIconIndex: FluentIcons.FluentIcons
    property string iconFontFamily: "FluentSystemIcons-Resizable"
}
