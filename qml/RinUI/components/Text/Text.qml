import QtQuick 2.15 as QQ
import "../../utils"

QQ.Text {
    id: root

    property int typography: Typography.Body

    color: themeManager && themeManager.currentTheme && themeManager.currentTheme.colors
        ? themeManager.currentTheme.colors.textColor
        : "#1b1b1b"

    font.pixelSize: {
        if (!(themeManager && themeManager.currentTheme && themeManager.currentTheme.typography))
            return 14

        switch (typography) {
        case Typography.Display:
            return themeManager.currentTheme.typography.displaySize
        case Typography.TitleLarge:
            return themeManager.currentTheme.typography.titleLargeSize
        case Typography.Title:
            return themeManager.currentTheme.typography.titleSize
        case Typography.Subtitle:
            return themeManager.currentTheme.typography.subtitleSize
        case Typography.Body:
            return themeManager.currentTheme.typography.bodySize
        case Typography.BodyStrong:
            return themeManager.currentTheme.typography.bodyStrongSize
        case Typography.BodyLarge:
            return themeManager.currentTheme.typography.bodyLargeSize
        case Typography.Caption:
            return themeManager.currentTheme.typography.captionSize
        default:
            return themeManager.currentTheme.typography.bodySize
        }
    }
}
