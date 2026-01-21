pragma Singleton
import QtQuick 2.15
import "../assets/fonts/FluentSystemIcons-Index.js" as FluentIcons

QtObject {
    property string fontFamily: Qt.platform.os === "windows"
        ? "Microsoft YaHei"
        : ((Qt.application && Qt.application.font) ? Qt.application.font.family : "")
    property string primaryColor: "#0078D4"
    property bool backdropEnabled: false
    property int animationSpeed: 250
    property int animationSpeedMiddle: 350
    property int animationSpeedFaster: 150
    property int appearanceSpeed: 150
    property int windowDragArea: 5
    property int dialogMaximumWidth: 600
    property int dialogMinimumWidth: 320

    // Font icon support
    property string fontIconSource: Qt.resolvedUrl("../assets/fonts/FluentSystemIcons-Resizable.ttf")
    property var fontIconIndex: FluentIcons.FluentIcons
    property string iconFontFamily: "FluentSystemIcons-Resizable"
}
