import QtQuick 2.15
import QtQuick.Layouts 1.15
import "../components" as Rin

DemoPage {
    title: qsTr("AutoSuggestBox")
    description: qsTr("TextBox that suggests results while typing.")

    Rin.AutoSuggestBox {
        id: box
        Layout.fillWidth: true
        suggestions: [
            "Apple",
            "Apricot",
            "Banana",
            "Blueberry",
            "Cherry",
            "Grape",
            "Orange",
            "Peach",
            "Strawberry"
        ]
        placeholderText: qsTr("Type a fruit name…")
    }

    Text {
        text: qsTr("Text: %1").arg(box.text)
        Layout.fillWidth: true
        elide: Text.ElideRight
    }
}
