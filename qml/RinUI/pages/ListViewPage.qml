import QtQuick 2.15
import QtQuick.Layouts 1.15
import "../themes"
import "../components" as Rin

ControlPage {
    id: page
    title: qsTr("ListView")
    badgeText: qsTr("Experimental")
    badgeSeverity: Rin.Severity.Warning

    // Intro
    Rin.Text {
        Layout.fillWidth: true
        wrapMode: Text.WordWrap
        text: qsTr(
            "The ListView lets you show a collection of items in a list that scrolls vertically."
        )
    }

    ListModel {
        id: studentsModel
        ListElement { name: qsTr("Alice") }
        ListElement { name: qsTr("Bob") }
        ListElement { name: qsTr("Charlie") }
        ListElement { name: qsTr("Diana") }
        ListElement { name: qsTr("Eve") }
        ListElement { name: qsTr("Frank") }
        ListElement { name: qsTr("Grace") }
        ListElement { name: qsTr("Henry") }
    }

    // Basic ListView
    Column {
        Layout.fillWidth: true
        spacing: 4

        Rin.Text {
            text: qsTr("Basic ListView with Simple DataTemplate")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        ControlShowcase {
            width: parent.width

            Column {
                width: parent.width
                spacing: 4

                Rin.Text {
                    width: parent.width
                    wrapMode: Text.WordWrap
                    text: qsTr("This is a basic ListView with a simple model.")
                }

                Rin.ListView {
                    id: listView
                    width: 350
                    height: 400
                    model: studentsModel
                }
            }

            showcase: [
                Rin.Text { text: qsTr("Name:") },
                Rin.TextField {
                    id: nameField
                    width: parent.width
                    placeholderText: qsTr("Enter name")
                },
                Rin.Button {
                    text: qsTr("Add")
                    onClicked: {
                        if (nameField.text.length === 0) {
                            // TODO: Show InfoBar
                            console.log("Please enter a name")
                        } else {
                            studentsModel.insert(0, { name: nameField.text })
                            nameField.text = ""
                        }
                    }
                },
                Rin.Button {
                    text: qsTr("Remove")
                    onClicked: {
                        studentsModel.remove(listView.currentIndex, 1)
                    }
                }
            ]
        }
    }

    // ListView with custom delegate
    Column {
        Layout.fillWidth: true
        spacing: 4

        Rin.Text {
            text: qsTr("ListView with custom ListViewDelegate")
            font.pixelSize: 13
            font.weight: Font.DemiBold
        }

        Rin.Frame {
            Layout.fillWidth: true

            Column {
                spacing: 4
                width: parent.width

                Rin.Text {
                    width: parent.width
                    wrapMode: Text.WordWrap
                    text: qsTr(
                        "You can customize the ListViewDelegate to show custom items. " +
                        "The ListViewDelegate defines how each item should look."
                    )
                }

                Rin.ListView {
                    id: listViewWithCustom
                    width: 350
                    height: 400

                    // Custom delegate with leftArea and middleArea
                    delegate: Rin.ListViewDelegate {
                        // Avatar placeholder
                        leftArea: Rectangle {
                            width: 32
                            height: 32
                            radius: 16
                            color: "#818181"
                        }

                        middleArea: [
                            Rin.Text {
                                Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
                                text: modelData.name
                            },
                            Rin.Text {
                                Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft
                                typography: Rin.Typography.Caption
                                color: Theme.currentTheme.colors.textSecondaryColor
                                text: modelData.school || ""
                            }
                        ]
                    }

                    model: [
                        { name: qsTr("Alice"), school: qsTr("Engineering") },
                        { name: qsTr("Bob"), school: qsTr("Science") },
                        { name: qsTr("Charlie"), school: qsTr("Arts") },
                        { name: qsTr("Diana"), school: qsTr("Medicine") },
                        { name: qsTr("Eve"), school: qsTr("Law") },
                    ]
                }
            }
        }
    }
}
