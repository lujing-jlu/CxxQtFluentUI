import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import FluentUI 1.0

FluPage {
    title: "Home"
    FluFrame {
        Layout.fillWidth: true
        Layout.preferredHeight: 100
        ColumnLayout {
            anchors.fill: parent
            anchors.margins: 10
            FluText {
                text: "Welcome to CxxQtFluentUI!"
                Layout.fillWidth: true
            }
            FluButton {
                text: "Click Me"
                onClicked: {
                    console.log("Button clicked!")
                }
            }
        }
    }
}
