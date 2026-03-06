import QtQuick 2.15
import QtQuick.Layouts 2.15
import "../../components" as Rin

Item {
    id: root

    property string title: qsTr("Error Interface Test")
    property var navigationView: null

    Rin.ErrorPage {
        anchors.fill: parent
        page: "unexist/page"
        errorMessage: qsTr("This is an intentional error-test placeholder page.")
        navigationView: root.navigationView
    }
}
