pragma Singleton
import QtQuick 2.15

QtObject {
    id: severity

    enum Type {
        Info,
        Success,
        Warning,
        Error
    }
}
