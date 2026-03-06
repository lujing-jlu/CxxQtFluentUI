pragma Singleton
import QtQuick 2.15

QtObject {
    function getRecentlyAddedItems() {
        return allControls.filter(function(item) { return !!item.added })
    }

    function getRecentlyUpdatedItems() {
        return allControls.filter(function(item) { return !!item.updated })
    }

    function getItemsByType(type) {
        return allControls.filter(function(item) { return item.type === type })
    }

    function getItemsByTitle(title) {
        if (!title) return allControls.slice()
        const lowerTitle = String(title).toLowerCase()
        return allControls.filter(function(item) {
            return item && item.title && String(item.title).toLowerCase().indexOf(lowerTitle) !== -1
        })
    }

    property var recentlyAddedItems: getRecentlyAddedItems()
    property var recentlyUpdatedItems: getRecentlyUpdatedItems()

    // Control metadata used by the gallery client.
    // `page` uses the NavigationBar page key (qml/CxxQtFluentUI/pages/<page>.qml).
    property var allControls: [
        {
            icon: Qt.resolvedUrl("controls/AutoSuggestBox.png"),
            title: qsTr("AutoSuggestBox"),
            type: "text",
            desc: qsTr("A control to provide suggestions as a user is typing."),
            page: "AutoSuggestBoxPage",
            added: true,
        },
        {
            icon: Qt.resolvedUrl("controls/PersonPicture.png"),
            title: qsTr("Avatar"),
            type: "media",
            desc: qsTr("Display a picture of a person/contact."),
            page: "AvatarPage",
            added: true,
        },
        {
            icon: Qt.resolvedUrl("controls/Button.png"),
            title: qsTr("Button"),
            type: "basicInput",
            desc: qsTr("A control that responds to user input and raises a click event."),
            page: "ButtonPage",
        },
        {
            icon: Qt.resolvedUrl("controls/CalendarDatePicker.png"),
            title: qsTr("CalendarDatePicker"),
            type: "date&time",
            desc: qsTr("A control that lets a user pick a date value using a calendar."),
            page: "CalendarDatePickerPage",
            added: true,
        },
        {
            icon: Qt.resolvedUrl("controls/CalendarView.png"),
            title: qsTr("Calendar"),
            type: "date&time",
            desc: qsTr("A control that presents a calendar for a user to choose a date."),
            page: "CalendarPage",
            added: true,
        },
        {
            icon: Qt.resolvedUrl("controls/Checkbox.png"),
            title: qsTr("CheckBox"),
            type: "basicInput",
            desc: qsTr("A control that a user can select or clear."),
            page: "CheckBoxPage",
        },
        {
            icon: Qt.resolvedUrl("controls/ColorPicker.png"),
            title: qsTr("ColorPicker"),
            type: "basicInput",
            desc: qsTr("A control that displays a selectable color spectrum."),
            page: "ColorPickerPage",
            added: true,
        },
        {
            icon: Qt.resolvedUrl("controls/ComboBox.png"),
            title: qsTr("ComboBox"),
            type: "basicInput",
            desc: qsTr("A drop-down list of items a user can select from."),
            page: "ComboBoxPage",
        },
        {
            icon: Qt.resolvedUrl("controls/ContentDialog.png"),
            title: qsTr("Dialog"),
            type: "dialogs&flyouts",
            desc: qsTr("A dialog box that can be customized to contain any QML content."),
            page: "DialogPage",
        },
        {
            icon: Qt.resolvedUrl("controls/DatePicker.png"),
            title: qsTr("DatePicker"),
            type: "date&time",
            desc: qsTr("A control that lets a user pick a date value."),
            page: "DatePickerPage",
            added: true,
        },
        {
            icon: Qt.resolvedUrl("controls/DropDownButton.png"),
            title: qsTr("DropDownButton"),
            type: "basicInput",
            desc: qsTr("A button that displays a flyout of choices when clicked."),
            page: "DropDownButtonPage",
        },
        {
            icon: Qt.resolvedUrl("controls/Expander.png"),
            title: qsTr("Expander"),
            type: "layout",
            desc: qsTr("A container with a header that can be expanded to show content."),
            page: "ExpanderPage",
        },
        {
            icon: Qt.resolvedUrl("controls/Flyout.png"),
            title: qsTr("Flyout"),
            type: "dialogs&flyouts",
            desc: qsTr("Shows contextual information and enables user interaction."),
            page: "FlyoutPage",
            updated: true,
        },
        {
            icon: Qt.resolvedUrl("controls/HyperlinkButton.png"),
            title: qsTr("Hyperlink"),
            type: "basicInput",
            desc: qsTr("A button that appears as hyperlink text, and can navigate to a URL."),
            page: "HyperlinkPage",
        },
        {
            icon: Qt.resolvedUrl("controls/IconElement.png"),
            title: qsTr("Iconography"),
            type: "design",
            desc: qsTr("Icons are a visual design language that can communicate information quickly."),
            page: "IconographyPage",
        },
        {
            icon: Qt.resolvedUrl("controls/InfoBadge.png"),
            title: qsTr("InfoBadge"),
            type: "status&info",
            desc: qsTr("A non-intrusive UI to display notifications or bring focus to an area."),
            page: "InfoBadgePage",
            added: true,
        },
        {
            icon: Qt.resolvedUrl("controls/InfoBar.png"),
            title: qsTr("InfoBar"),
            type: "status&info",
            desc: qsTr("An inline message to display app-wide status change information."),
            page: "InfoBarPage",
            updated: true,
        },
        {
            icon: Qt.resolvedUrl("controls/ListView.png"),
            title: qsTr("ListView"),
            type: "collections",
            desc: qsTr("A control that presents a collection of items in a vertical list."),
            page: "ListViewPage",
        },
        {
            icon: Qt.resolvedUrl("controls/MenuFlyout.png"),
            title: qsTr("Menu"),
            type: "menus&toolbars",
            desc: qsTr("Shows a contextual list of simple commands or options."),
            page: "MenuPage",
        },
        {
            icon: Qt.resolvedUrl("controls/MenuBar.png"),
            title: qsTr("MenuBar"),
            type: "menus&toolbars",
            desc: qsTr("A classic menu for displaying MenuBarItem containing Menu."),
            page: "MenuBarPage",
        },
        {
            icon: Qt.resolvedUrl("controls/NavigationView.png"),
            title: qsTr("NavigationView"),
            type: "navigation",
            desc: qsTr("A common vertical layout for top-level areas of your app."),
            page: "NavigationViewPage",
            updated: true,
        },
        {
            icon: Qt.resolvedUrl("controls/Popup.png"),
            title: qsTr("Popup"),
            type: "dialogs&flyouts",
            desc: qsTr("A UI element displaying temporary content over an existing interface."),
            page: "PopupPage",
            added: true,
        },
        {
            icon: Qt.resolvedUrl("controls/ProgressBar.png"),
            title: qsTr("ProgressBar"),
            type: "status&info",
            desc: qsTr("Shows progress on a task, or ongoing work that doesn't block interaction."),
            page: "ProgressPage",
            updated: true,
        },
        {
            icon: Qt.resolvedUrl("controls/ProgressRing.png"),
            title: qsTr("ProgressRing"),
            type: "status&info",
            desc: qsTr("Shows progress on a task, or ongoing work that doesn't block interaction."),
            page: "ProgressRingPage",
        },
        {
            icon: Qt.resolvedUrl("controls/RadioButton.png"),
            title: qsTr("RadioButton"),
            type: "basicInput",
            desc: qsTr("A control that allows selection of a single option from a group."),
            page: "RadioButtonPage",
        },
        {
            icon: Qt.resolvedUrl("controls/Button.png"),
            title: qsTr("RoundButton"),
            type: "basicInput",
            desc: qsTr("A control like Button except that it has a radius property."),
            page: "RoundButtonPage",
        },
        {
            icon: Qt.resolvedUrl("controls/Pivot.png"),
            title: qsTr("SelectorBar"),
            type: "navigation",
            desc: qsTr("Presents information from a small set of sources."),
            page: "SelectorBarPage",
        },
        {
            icon: Qt.resolvedUrl("controls/Expander.png"),
            title: qsTr("SettingExpander"),
            type: "layout",
            desc: qsTr("A container with a header that can be expanded to show a body."),
            page: "SettingExpanderPage",
        },
        {
            icon: Qt.resolvedUrl("controls/Slider.png"),
            title: qsTr("Slider"),
            type: "basicInput",
            desc: qsTr("Lets the user select from a range of values by moving a thumb."),
            page: "SliderPage",
        },
        {
            icon: Qt.resolvedUrl("controls/NumberBox.png"),
            title: qsTr("SpinBox"),
            type: "text",
            desc: qsTr("A text control used for numeric input."),
            page: "SpinBoxPage",
        },
        {
            icon: Qt.resolvedUrl("controls/Button.png"),
            title: qsTr("PillButton"),
            type: "basicInput",
            desc: qsTr("A button that can be toggled between two states."),
            page: "PillButtonPage",
        },
        {
            icon: Qt.resolvedUrl("controls/Pivot.png"),
            title: qsTr("Segmented"),
            type: "navigation",
            desc: qsTr("A common UI control to configure a view or setting."),
            page: "SegmentedPage",
        },
        {
            icon: Qt.resolvedUrl("controls/ToggleButton.png"),
            title: qsTr("ToggleButton"),
            type: "basicInput",
            desc: qsTr("A button that can be toggled between two states like a CheckBox."),
            page: "ToggleButtonPage",
        },
        {
            icon: Qt.resolvedUrl("controls/ToggleSwitch.png"),
            title: qsTr("Switch"),
            type: "basicInput",
            desc: qsTr("A switch that can be toggled between two states."),
            page: "SwitchPage",
        },
        {
            icon: Qt.resolvedUrl("controls/TextBox.png"),
            title: qsTr("TextArea"),
            type: "text",
            desc: qsTr("A multi-line plain text field."),
            page: "TextAreaPage",
        },
        {
            icon: Qt.resolvedUrl("controls/TextBox.png"),
            title: qsTr("TextField"),
            type: "text",
            desc: qsTr("A single-line plain text field."),
            page: "TextFieldPage",
            updated: true,
        },
        {
            icon: Qt.resolvedUrl("controls/TimePicker.png"),
            title: qsTr("TimePicker"),
            type: "date&time",
            desc: qsTr("A control that lets a user pick a time value."),
            page: "TimePickerPage",
        },
        {
            icon: Qt.resolvedUrl("controls/ToolTip.png"),
            title: qsTr("ToolTip"),
            type: "status&info",
            desc: qsTr("Displays information for an element in a pop-up window."),
            page: "ToolTipPage",
        },

        // Extras provided by this CxxQt demo (not present in upstream ItemData yet)
        {
            icon: Qt.resolvedUrl("controls/BreadcrumbBar.png"),
            title: qsTr("BreadcrumbBar"),
            type: "navigation",
            desc: qsTr("Shows the path of the current page and enables navigation back."),
            page: "BreadcrumbBarPage",
        },
        {
            icon: Qt.resolvedUrl("controls/CommandBar.png"),
            title: qsTr("CommandBar"),
            type: "menus&toolbars",
            desc: qsTr("A toolbar that provides access to common commands."),
            page: "CommandBarPage",
        },
        {
            icon: Qt.resolvedUrl("controls/RatingControl.png"),
            title: qsTr("RatingControl"),
            type: "basicInput",
            desc: qsTr("Lets users provide a star rating."),
            page: "RatingControlPage",
        },
        {
            icon: Qt.resolvedUrl("controls/TeachingTip.png"),
            title: qsTr("TeachingTip"),
            type: "dialogs&flyouts",
            desc: qsTr("A transient UI that shows contextual information to users."),
            page: "TeachingTipPage",
        },
        {
            icon: Qt.resolvedUrl("controls/TabView.png"),
            title: qsTr("TabView"),
            type: "navigation",
            desc: qsTr("A tabbed container for organizing content."),
            page: "TabViewPage",
        },
        {
            icon: Qt.resolvedUrl("controls/AppNotification.png"),
            title: qsTr("Toast"),
            type: "status&info",
            desc: qsTr("Shows a transient message and optional actions."),
            page: "ToastPage",
        },
        {
            icon: Qt.resolvedUrl("controls/TreeView.png"),
            title: qsTr("TreeView"),
            type: "collections",
            desc: qsTr("Shows hierarchical collections."),
            page: "TreeViewPage",
        },
        {
            icon: Qt.resolvedUrl("controls/DataGrid.png"),
            title: qsTr("TableView"),
            type: "collections",
            desc: qsTr("Displays a collection of data in rows and columns."),
            page: "TableViewPage",
        },
        {
            icon: Qt.resolvedUrl("controls/Expander.png"),
            title: qsTr("SettingCard"),
            type: "collections",
            desc: qsTr("A card-style list item commonly used in settings pages."),
            page: "SettingCardPage",
        },
    ]
}
