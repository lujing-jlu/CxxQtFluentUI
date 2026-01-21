import QtQuick 2.15
import Qt5Compat.GraphicalEffects
import QtQuick.Controls.Basic 2.15
import "../../themes"
import "../../components"


TextInput {
    id: root
    property int font.pixelSize: 14
    selectByMouse: true

    color: themeManager.currentTheme.colors.textColor
    selectionColor: themeManager.currentTheme.colors.primaryColor

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
            case Typography.Display: return themeManager.currentTheme.typography.displaySize;
            case Typography.TitleLarge: return themeManager.currentTheme.typography.titleLargeSize;
            case Typography.Title: return themeManager.currentTheme.typography.titleSize;
            case Typography.Subtitle: return themeManager.currentTheme.typography.subtitleSize;
            case Typography.Body: return themeManager.currentTheme.typography.bodySize;
            case Typography.BodyStrong: return themeManager.currentTheme.typography.bodyStrongSize;
            case Typography.BodyLarge: return themeManager.currentTheme.typography.bodyLargeSize;
            case Typography.Caption: return themeManager.currentTheme.typography.captionSize;
            default: return themeManager.currentTheme.typography.bodySize;
        }
    }
}
