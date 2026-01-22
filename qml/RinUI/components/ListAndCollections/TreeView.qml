import QtQuick 2.15
import QtQuick.Controls.Basic 2.15
import QtQuick.Layouts 2.15
import "../../utils"
import "../../components" as Rin

ListView {
    id: root

    // Tree data model:
    // [
    //   { text: "Root", children: [ { text: "Child" } ] }
    // ]
    property var treeModel: []
    property string textRole: "text"
    property string childrenRole: "children"
    property int indent: 18

    readonly property int nodeCount: (flatModel ? flatModel.length : 0)

    clip: true

    // Internal flattened list
    property var flatModel: []
    property var _expanded: ({})

    function _hasChildren(node) {
        if (!node) return false
        const c = node[root.childrenRole]
        return Array.isArray(c) && c.length > 0
    }

    function _nodeText(node) {
        if (!node) return ""
        const v = node[root.textRole]
        return (v === undefined || v === null) ? "" : String(v)
    }

    function _keyForPath(path) {
        return path.join("/")
    }

    function isExpanded(key) {
        return !!root._expanded[key]
    }

    function toggleExpanded(key) {
        if (!key) return
        root._expanded[key] = !root._expanded[key]
        refresh()
    }

    function collapseAll() {
        root._expanded = ({})
        refresh()
    }

    function expandAll() {
        // Expand every node that has children.
        const expanded = ({})
        function walk(nodes, path) {
            if (!Array.isArray(nodes)) return
            for (let i = 0; i < nodes.length; i++) {
                const node = nodes[i]
                const nextPath = path.concat([i])
                if (_hasChildren(node)) {
                    expanded[_keyForPath(nextPath)] = true
                    walk(node[root.childrenRole], nextPath)
                }
            }
        }
        walk(root.treeModel, [])
        root._expanded = expanded
        refresh()
    }

    function refresh() {
        const out = []

        function walk(nodes, depth, path) {
            if (!Array.isArray(nodes)) return
            for (let i = 0; i < nodes.length; i++) {
                const node = nodes[i]
                const nextPath = path.concat([i])
                const key = _keyForPath(nextPath)
                const hasChildren = _hasChildren(node)
                const expanded = hasChildren ? isExpanded(key) : false

                out.push({
                    key: key,
                    depth: depth,
                    node: node,
                    text: _nodeText(node),
                    hasChildren: hasChildren,
                    expanded: expanded
                })

                if (hasChildren && expanded) {
                    walk(node[root.childrenRole], depth + 1, nextPath)
                }
            }
        }

        walk(root.treeModel, 0, [])
        root.flatModel = out

        if (root.currentIndex >= out.length) {
            root.currentIndex = out.length - 1
        }
    }

    onTreeModelChanged: refresh()
    Component.onCompleted: refresh()

    model: root.flatModel

    ScrollBar.vertical: ScrollBar { policy: ScrollBar.AsNeeded }

    displaced: Transition {
        NumberAnimation {
            property: "y"
            duration: Utils.animationSpeedMiddle
            easing.type: Easing.OutQuint
        }
    }

    delegate: Rin.ListViewDelegate {
        required property var modelData

        text: modelData.text

        leftArea: [
            Item {
                width: modelData.depth * root.indent
                height: 1
            },
            Item {
                width: 20
                height: 20
                visible: modelData.hasChildren

                Rin.Icon {
                    anchors.centerIn: parent
                    name: "ic_fluent_chevron_right_20_regular"
                    size: 12
                    color: themeManager.currentTheme.colors.textSecondaryColor
                    rotation: modelData.expanded ? 90 : 0

                    Behavior on rotation { NumberAnimation { duration: Utils.appearanceSpeed; easing.type: Easing.OutQuart } }
                }

                MouseArea {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    onClicked: root.toggleExpanded(modelData.key)
                }
            }
        ]

        onClicked: {
            root.currentIndex = index
            if (modelData.hasChildren) {
                root.toggleExpanded(modelData.key)
            }
        }
    }
}

