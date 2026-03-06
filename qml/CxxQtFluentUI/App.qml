import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

import "windows"
import "components" as Rin
import "assets"

FluentWindow {
    id: window
    visible: true
    title: qsTr("CxxQtFluentUI")
    width: 1200
    height: 700
    minimumWidth: 550
    minimumHeight: 400

    navigationView.navExpandWidth: 280
    navigationItems: Rin.NavigationConfig.items

    defaultPage: (Qt.application && Qt.application.arguments && Qt.application.arguments.length > 1)
        ? Qt.application.arguments[1]
        : "HomePage"

    // Titlebar search (gallery style)
    titleBarArea: Rin.AutoSuggestBox {
        id: searchField
        width: 325
        anchors.centerIn: parent
        placeholderText: qsTr("Search controls and samples...")
        suggestions: ItemData.allControls
        textRole: "title"

        onAccepted: {
            const all = ItemData.allControls
            const selected = all.find(function(c) { return c && c.title === searchField.text })
            if (selected && selected.page) {
                window.navigationView.safePush(selected.page)
            } else {
                window.navigationView.push("SearchPage", { query: searchField.text || "" })
            }
        }
    }

    QtObject {
        id: internal

        property Component tips: Component {
            Rin.InfoBar {
                id: tipsBar
                position: Rin.Position.BottomRight
                timeout: 5000
                severity: Rin.Severity.Warning
                closable: false
                title: qsTr("Tips")
                text: qsTr("This page is <b>not a bug</b>, but a demo of an error in the interface loading.")
                customContent: [
                    Rin.Button {
                        text: qsTr("I got it.")
                        onClicked: tipsBar.close()
                    }
                ]
            }
        }
    }

    onCurrentPageChanged: {
        if (currentPage === "unexist/page") {
            floatLayer.createCustom(internal.tips)
        }
    }
}
