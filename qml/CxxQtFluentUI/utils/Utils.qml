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

    // Layout tokens (match gallery spacing)
    property int pageMargin: 42
    property int pageTopSpacing: 18
    property int sectionSpacing: 32

    // Font icon support
    property string fontIconSource: Qt.resolvedUrl("../assets/fonts/FluentSystemIcons-Resizable.ttf")
    property var fontIconIndex: FluentIcons.FluentIcons
    property string iconFontFamily: "FluentSystemIcons-Resizable"

    // Some older/short-hand icon names are not present in FluentSystemIcons-Index.js.
    // Keep a small alias map so pages/components don't render blank icons.
    property var iconAliases: ({
        "ic_fluent_moon_20_regular": "ic_fluent_weather_moon_20_regular",
        "ic_fluent_wifi_20_regular": "ic_fluent_wifi_4_20_regular",
        "ic_fluent_spinner_off_20_regular": "ic_fluent_spinner_ios_20_regular",
        "ic_fluent_arrow_fit_16_regular": "ic_fluent_arrow_fit_20_regular",
        "ic_fluent_arrow_fit_24_regular": "ic_fluent_arrow_fit_20_regular",
        "ic_fluent_slider_20_regular": "ic_fluent_options_20_regular"
    })

    function resolveIconName(name) {
        if (!name)
            return name
        const alias = iconAliases[name]
        return alias ? alias : name
    }
}
