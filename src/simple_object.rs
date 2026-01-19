use core::pin::Pin;
use cxx_qt_lib::QString;

#[cxx_qt::bridge]
pub mod qobject {
    unsafe extern "C++" {
        include!("cxx-qt-lib/qstring.h");
        type QString = cxx_qt_lib::QString;
    }

    extern "RustQt" {
        #[qobject]
        #[qml_element]
        #[qproperty(QString, message)]
        #[qproperty(i32, counter)]
        #[namespace = "simple_qt5_app"]
        type SimpleObject = super::SimpleObjectRust;

        #[qinvokable]
        #[cxx_name = "updateMessage"]
        fn update_message(self: Pin<&mut SimpleObject>);
    }
}

#[derive(Default)]
pub struct SimpleObjectRust {
    message: QString,
    counter: i32,
}

impl qobject::SimpleObject {
    fn update_message(mut self: Pin<&mut Self>) {
        let new_count = *self.counter() + 1;
        self.as_mut().set_counter(new_count);
        self.as_mut().set_message(QString::from(&format!(
            "Button clicked {} times!",
            new_count
        )));
    }
}
