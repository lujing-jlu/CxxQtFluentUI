pragma Singleton
import QtQuick 2.15

QtObject {
    id: windowManager

    function toggleMaximizeWindow(window) {
        if (!window) return;

        if (window.visibility === Window.Maximized || window.isMaximized) {
            window.showNormal();
        } else {
            window.showMaximized();
        }
    }

    function maximizeWindow(window) {
        if (!window) return;

        if (Qt.platform.os === "windows") {
            // On Windows, use native methods if available
            toggleMaximizeWindow(window);
        } else {
            toggleMaximizeWindow(window);
        }
    }

    function minimizeWindow(window) {
        if (!window) return;
        window.showMinimized();
    }

    function closeWindow(window) {
        if (!window) return;

        if (window.transientParent) {
            window.visible = false;
        } else {
            window.close();
        }
    }
}
