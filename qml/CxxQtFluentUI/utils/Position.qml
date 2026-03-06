pragma Singleton
import QtQuick 2.15

QtObject {
    id: position

    enum Type {
        Top,
        Bottom,
        Left,
        Right,
        TopLeft,
        TopRight,
        BottomLeft,
        BottomRight,
        Center,
        None
    }
}
