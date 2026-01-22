import QtQuick 2.15
import QtQuick.Layouts 2.15
import "../components" as Rin

DemoPage {
    id: root
    title: qsTr("RatingControl")
    description: qsTr("Lets users rate content with stars.")

    property int rating: 3
    property int maxRating: 5

    Rin.Frame {
        Layout.fillWidth: true
        padding: 12

        ColumnLayout {
            anchors.fill: parent
            spacing: 12

            RowLayout {
                Layout.fillWidth: true
                spacing: 12

                Rin.Text { text: qsTr("Rating") }

                Rin.RatingControl {
                    value: root.rating
                    maximum: root.maxRating
                    onValueChangedByUser: root.rating = value
                }

                Rin.Text {
                    color: themeManager.currentTheme.colors.textSecondaryColor
                    text: qsTr("%1 / %2").arg(root.rating).arg(root.maxRating)
                }
            }

            RowLayout {
                Layout.fillWidth: true
                spacing: 12

                Rin.Text { text: qsTr("Max") }
                Rin.SpinBox {
                    from: 1
                    to: 10
                    value: root.maxRating
                    onValueModified: root.maxRating = value
                }
            }

            RowLayout {
                Layout.fillWidth: true
                spacing: 12

                Rin.Text { text: qsTr("Read-only") }
                Rin.RatingControl {
                    readOnly: true
                    value: 4
                }
            }
        }
    }
}

