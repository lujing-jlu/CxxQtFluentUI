import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15
import "../../themes"
import ".." as Rin

ColumnLayout {
    id: errorPage

    property string errorMessage: "ERROR_MSG"
    property string page: "page"
    property var navigationView: null

    spacing: 4
    width: parent ? parent.width : 400

    Item {
        Layout.preferredHeight: 64
    }

    Text {
        Layout.alignment: Qt.AlignHCenter
        font.pixelSize: 20
        font.weight: Font.Medium
        color: themeManager.currentTheme && themeManager.currentTheme.colors ?
            themeManager.currentTheme.colors.textColor : "#1b1b1b"
        text: qsTr("Sorry, something went wrong!")
    }

    Text {
        Layout.preferredWidth: parent.width * 0.8
        Layout.alignment: Qt.AlignHCenter
        horizontalAlignment: Text.AlignHCenter
        wrapMode: Text.WordWrap
        font.pixelSize: 14
        color: themeManager.currentTheme && themeManager.currentTheme.colors ?
            themeManager.currentTheme.colors.textColor : "#1b1b1b"
        text: page + qsTr(" load failed! \n\n Because of ") + errorMessage + qsTr("\nPlease try again later.")
    }

    Item {
        Layout.preferredHeight: 8
    }

    Rin.Button {
        Layout.alignment: Qt.AlignHCenter
        id: retryButton
        text: qsTr("Retry")
        isPrimary: true

        onClicked: {
            // Signal to reload page - should be handled by parent
            if (navigationView && errorPage.page) {
                navigationView.push(errorPage.page)
            }
        }
    }
}
