pragma Singleton
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 2.15

Item {
    id: floatLayer
    anchors.fill: parent
    anchors.margins: margins
    property int margins: 32
    property int spacing: 12

    // Position containers
    ColumnLayout {
        id: topLeft
        anchors.top: parent.top
        anchors.left: parent.left
        spacing: floatLayer.spacing
        width: floatLayer.width / 2
    }

    ColumnLayout {
        id: topCenter
        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: floatLayer.spacing
        width: floatLayer.width / 2
    }

    ColumnLayout {
        id: topRight
        anchors.top: parent.top
        anchors.right: parent.right
        spacing: floatLayer.spacing
        width: floatLayer.width / 2
    }

    ColumnLayout {
        id: bottomLeft
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        spacing: floatLayer.spacing
        width: floatLayer.width / 2
    }

    ColumnLayout {
        id: bottomCenter
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: floatLayer.spacing
        width: floatLayer.width / 2
    }

    ColumnLayout {
        id: bottomRight
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        spacing: floatLayer.spacing
        width: floatLayer.width / 2
    }

    // Property for InfoBar component - should be set from outside
    property Component infoBarComponent: null

    // Functions
    function createInfoBar(options) {
        if (!infoBarComponent) {
            console.warn("FloatLayer: infoBarComponent not set")
            return null
        }
        try {
            var title = options.title || ""
            var text = options.text || ""
            var severity = options.severity !== undefined ? options.severity : 0
            var timeout = options.timeout !== undefined ? options.timeout : 1500
            var position = options.position || 0
            var closable = options.closable !== undefined ? options.closable : true

            var infoContainer = infoBarComponent.createObject(determinePosition(position), {
                title: title,
                text: text,
                severity: severity,
                position: position,
                timeout: timeout,
                closable: closable
            });
            return infoContainer
        } catch(err) {
            console.error("Error: error creating InfoBar: " + err)
            return null
        }
    }

    function createCustom(component) {
        try {
            var infoContainer = component.createObject(floatLayer);
            if (!infoContainer) throw "Failed to create component instance.";

            var pos = infoContainer.position;

            var realParent = determinePosition(pos);
            if (realParent && realParent !== floatLayer) {
                infoContainer.parent = realParent;
            }
        } catch(err) {
            console.error("Error: error creating component: ", component.objectName || err);
        }
    }

    function determinePosition(position) {
        switch(position) {
        case 0: // Position.Top
            return topCenter;
        case 1: // Position.Bottom
            return bottomCenter;
        case 2: // Position.Left
            return bottomLeft;
        case 3: // Position.Right
            return bottomRight;
        case 4: // Position.TopLeft
            return topLeft;
        case 5: // Position.TopRight
            return topRight;
        case 6: // Position.BottomLeft
            return bottomLeft;
        case 7: // Position.BottomRight
            return bottomRight;
        case 8: // Position.Center
            return topCenter;
        default:
            return topCenter;
        }
    }
}
