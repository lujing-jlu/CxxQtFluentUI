import QtQuick 2.15
import "../components" as Rin

Rin.ProgressRing {
    property bool running: true

    indeterminate: running
    state: ProgressRing.Running
}
