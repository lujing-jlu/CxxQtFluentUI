import QtQuick 2.15
CategoryPage {
    title: qsTr("Status & Info")
    description: qsTr("Progress, busy indicators, badges, info bars, and toasts.")

    items: [
        { title: qsTr("ProgressBar"), page: "ProgressPage", icon: "ic_fluent_circle_20_regular" },
        { title: qsTr("ProgressRing"), page: "ProgressRingPage", icon: "ic_fluent_circle_20_regular" },
        { title: qsTr("BusyIndicator"), page: "BusyPage", icon: "ic_fluent_spinner_off_20_regular" },
        { title: qsTr("InfoBadge"), page: "InfoBadgePage", icon: "ic_fluent_badge_20_regular" },
        { title: qsTr("InfoBar"), page: "InfoBarPage", icon: "ic_fluent_info_20_regular" },
        { title: qsTr("ToolTip"), page: "ToolTipPage", icon: "ic_fluent_info_20_regular" },
        { title: qsTr("Toast"), page: "ToastPage", icon: "ic_fluent_alert_20_regular" }
    ]
}
