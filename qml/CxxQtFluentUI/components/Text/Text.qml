import QtQuick 2.15 as QQ
import "../../utils"
import "../../themes"

QQ.Text {
    id: root

    property int typography: Typography.Body

    color: ThemeManager && ThemeManager.currentTheme && ThemeManager.currentTheme.colors
        ? ThemeManager.currentTheme.colors.textColor
        : "#1b1b1b"

    font.pixelSize: {
        if (!(ThemeManager && ThemeManager.currentTheme && ThemeManager.currentTheme.typography))
            return 14

        switch (typography) {
        case Typography.Display:
            return ThemeManager.currentTheme.typography.displaySize
        case Typography.TitleLarge:
            return ThemeManager.currentTheme.typography.titleLargeSize
        case Typography.Title:
            return ThemeManager.currentTheme.typography.titleSize
        case Typography.Subtitle:
            return ThemeManager.currentTheme.typography.subtitleSize
        case Typography.Body:
            return ThemeManager.currentTheme.typography.bodySize
        case Typography.BodyStrong:
            return ThemeManager.currentTheme.typography.bodyStrongSize
        case Typography.BodyLarge:
            return ThemeManager.currentTheme.typography.bodyLargeSize
        case Typography.Caption:
            return ThemeManager.currentTheme.typography.captionSize
        default:
            return ThemeManager.currentTheme.typography.bodySize
        }
    }
}
