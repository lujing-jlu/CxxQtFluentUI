import QtQuick 2.15
import Qt5Compat.GraphicalEffects
import QtQuick.Controls.Basic 2.15
import "../../themes"
import "../../components"


TextInput {
    id: root
    property int font.pixelSize: 14
    selectByMouse: true

    color: ThemeManager.currentTheme.colors.textColor
    selectionColor: ThemeManager.currentTheme.colors.primaryColor

    // Menu
    TextInputMenu {
        id: contextMenu
    }

    MouseArea {
        anchors.fill: parent
        acceptedButtons: Qt.RightButton
        propagateComposedEvents: true
        onPressed: (mouse) => {
            if (mouse.button === Qt.RightButton)
                contextMenu.popup(mouse.scenePosition)
            mouse.accepted = false
        }

        // 鼠标
        cursorShape: Qt.IBeamCursor
    }

    font.pixelSize: {
        switch (typography) {
            case Typography.Display: return ThemeManager.currentTheme.typography.displaySize;
            case Typography.TitleLarge: return ThemeManager.currentTheme.typography.titleLargeSize;
            case Typography.Title: return ThemeManager.currentTheme.typography.titleSize;
            case Typography.Subtitle: return ThemeManager.currentTheme.typography.subtitleSize;
            case Typography.Body: return ThemeManager.currentTheme.typography.bodySize;
            case Typography.BodyStrong: return ThemeManager.currentTheme.typography.bodyStrongSize;
            case Typography.BodyLarge: return ThemeManager.currentTheme.typography.bodyLargeSize;
            case Typography.Caption: return ThemeManager.currentTheme.typography.captionSize;
            default: return ThemeManager.currentTheme.typography.bodySize;
        }
    }
}
