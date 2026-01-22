import QtQuick 2.15
import QtQuick.Layouts 1.15
import "../themes"
import "../components" as Rin

DemoPage {
    id: root
    title: qsTr("All Samples")
    description: qsTr("Browse all demo pages.")

    property string query: ""

    function flattenItems(items, categoryTitle) {
        let out = []
        for (let i = 0; i < items.length; i++) {
            const item = items[i]
            const title = item.title || categoryTitle || ""
            const page = item.page || ""
            const icon = item.icon || ""
            const subItems = item.subItems || []

            if (page && page !== "unexist/page") {
                // Convert icon name to image path if needed
                let iconPath = icon
                if (!icon.includes("/") && !icon.includes(".")) {
                    // It's a font icon name, try to find matching image
                    iconPath = "../assets/controls/" + getControlImageName(title) + ".png"
                }
                out.push({ title: title, page: page, icon: iconPath, category: categoryTitle || "" })
            }
            if (subItems && subItems.length > 0) {
                out = out.concat(flattenItems(subItems, item.title || categoryTitle || ""))
            }
        }
        return out
    }

    function getControlImageName(title) {
        // Map control title to image file name
        const nameMap = {
            "Home": "App",
            "Iconography": "IconElement",
            "Button": "Button",
            "RoundButton": "Button",
            "ToggleButton": "ToggleButton",
            "PillButton": "Button",
            "CheckBox": "CheckBox",
            "RadioButton": "RadioButton",
            "Switch": "ToggleSwitch",
            "Slider": "Slider",
            "RatingControl": "RatingControl",
            "ComboBox": "ComboBox",
            "DropDownButton": "DropDownButton",
            "ColorPicker": "ColorPicker",
            "Hyperlink": "HyperlinkButton",
            "ListView": "ListView",
            "TreeView": "TreeGrid",
            "TableView": "DataGrid",
            "SettingCard": "Expander",
            "Calendar": "CalendarView",
            "CalendarDatePicker": "CalendarDatePicker",
            "DatePicker": "DatePicker",
            "TimePicker": "TimePicker",
            "Dialog": "ContentDialog",
            "Flyout": "MenuFlyout",
            "TeachingTip": "TeachingTip",
            "Popup": "Popup",
            "Expander": "Expander",
            "SettingExpander": "Expander",
            "Avatar": "PersonPicture",
            "CommandBar": "CommandBar",
            "Menu": "MenuFlyout",
            "MenuBar": "MenuBar",
            "NavigationView": "NavigationView",
            "TabView": "Pivot",
            "BreadcrumbBar": "BreadcrumbBar",
            "Segmented": "Pivot",
            "SelectorBar": "Pivot",
            "ProgressBar": "ProgressBar",
            "ProgressRing": "ProgressRing",
            "BusyIndicator": "ProgressRing",
            "InfoBadge": "BadgeNotification",
            "InfoBar": "InfoBar",
            "ToolTip": "ToolTip",
            "Toast": "AppNotification",
            "AutoSuggestBox": "AutoSuggestBox",
            "TextField": "TextBox",
            "TextArea": "TextBox",
            "SpinBox": "NumberBox",
            "Settings": "Settings"
        }
        return nameMap[title] || "Button"
    }

    function allSamples() {
        return flattenItems(Rin.NavigationConfig.items, "")
    }

    function filteredSamples() {
        const q = query.trim().toLowerCase()
        const items = allSamples()
        if (!q) return items
        return items.filter(function(it) {
            return String(it.title).toLowerCase().includes(q) || String(it.page).toLowerCase().includes(q)
        })
    }

    // 搜索框
    Rin.Frame {
        Layout.fillWidth: true
        leftPadding: 16
        rightPadding: 16
        topPadding: 12
        bottomPadding: 12

        Rin.TextField {
            anchors.fill: parent
            placeholderText: qsTr("Search controls…")
            text: root.query
            onTextChanged: root.query = text
        }
    }

    // 控件卡片网格
    Grid {
        Layout.fillWidth: true
        columns: Math.floor(width / 260)  // 卡片宽度 + 间距
        rowSpacing: 12
        columnSpacing: 12

        Repeater {
            model: root.filteredSamples()
            delegate: Rin.ControlCard {
                Layout.fillWidth: true
                title: modelData.title
                description: ""
                page: modelData.page
                iconSource: modelData.icon
                navigationView: root.navigationView
            }
        }
    }
}
