import QtQuick 2.15
import QtQuick.Controls 2.15
import "../utils" as Utils

Item {
    id: root

    // 属性 / Properties //
    property string icon: ""  // 字体图标名称（如 "ic_fluent_home_20_regular"）
    property alias name: root.icon  // 兼容
    property string source: ""  // 图片路径
    property alias color: text.color
    property int size: 16  // 默认尺寸
    property bool enableColorOverlay: false

    // 计算属性 / Computed Properties //
    readonly property bool isUnicode: icon.length === 1
    readonly property bool isFontIcon: source === "" && icon !== ""
    readonly property bool isSvg: source.toString().toLowerCase().endsWith(".svg")

    // 匹配尺寸
    implicitWidth: size
    implicitHeight: size

    // 主题切换动画
    Behavior on color {
        NumberAnimation {
            duration: 250
            easing.type: Easing.OutQuart
        }
    }

    // 获取图标 Unicode 码
    function getIconCode(iconName) {
        var code = Utils.FontIconLoader.fontIconIndex[iconName]
        return code !== undefined ? code : 0
    }

    // 字体图标文本
    Text {
        id: text
        anchors.centerIn: parent
        text: isFontIcon ? (isUnicode ? icon : (root.getIconCode(icon) > 0 ? String.fromCharCode(root.getIconCode(icon)) : "")) : ""
        font.family: Utils.FontIconLoader.fontFamily
        font.pixelSize: size
        visible: isFontIcon
    }

    // 图片图标
    Image {
        id: iconImage
        anchors.centerIn: parent
        source: root.source
        width: size
        height: size
        mipmap: true
        fillMode: Image.PreserveAspectFit
        visible: !isSvg || !enableColorOverlay
    }
}
