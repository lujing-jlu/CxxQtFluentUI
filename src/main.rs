use cxx_qt_lib::QGuiApplication;
use cxx_qt_lib::QQmlApplicationEngine;
use cxx_qt_lib::QUrl;

fn main() {
    // Set Qt Quick Controls style to Basic for better customization support
    std::env::set_var("QT_QUICK_CONTROLS_STYLE", "Basic");

    let mut app = QGuiApplication::new();
    let mut engine = QQmlApplicationEngine::new();

    if let Some(engine) = engine.as_mut() {
        // Load QML from filesystem
        let qml_path = std::path::Path::new(env!("CARGO_MANIFEST_DIR"))
            .join("qml")
            .join("RinUI")
            .join("App.qml");
        let qml_str = qml_path.as_os_str().to_string_lossy();
        engine.load(&QUrl::from(qml_str.as_ref()));
    }

    if let Some(app) = app.as_mut() {
        app.exec();
    }
}
