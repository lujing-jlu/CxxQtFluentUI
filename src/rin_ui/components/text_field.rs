//! FluentTextField Rust Wrapper for CxxQtFluentUI
//!
//! Provides Rust API for the FluentTextField QML component.

use cxx_qt::CxxQtType;
use cxx_qt_lib::QString;

#[cxx_qt::bridge]
pub mod qrc_text_field {
    use super::*;

    #[qobject]
    #[qml_element]
    #[qproperty(QString, text)]
    #[qproperty(bool, editable)]
    #[qproperty(bool, clear_enabled)]
    #[qproperty(bool, frameless)]
    pub type FluentTextField = super::FluentTextFieldRust;

    impl CxxQtType for FluentTextFieldRust {
        type Rust = FluentTextFieldData;
    }

    #[derive(Default)]
    pub struct FluentTextFieldData {
        text: QString,
        editable: bool,
        clear_enabled: bool,
        frameless: bool,
    }

    impl FluentTextFieldRust {
        /// Create a new text field
        #[qinvokable]
        pub fn new() -> Self {
            let mut this = Self::default();
            this.set_editable(true);
            this.set_clear_enabled(true);
            this
        }

        /// Get the text content
        #[qinvokable]
        pub fn get_text(&self) -> QString {
            self.rust().text.clone()
        }

        /// Set the text content
        #[qinvokable]
        pub fn set_text(self: Pin<&mut Self>, text: &QString) {
            self.rust_mut().text = text.clone();
        }

        /// Clear the text content
        #[qinvokable]
        pub fn clear(self: Pin<&mut Self>) {
            self.rust_mut().text = QString::new();
        }

        /// Check if text field is empty
        #[qinvokable]
        pub fn is_empty(&self) -> bool {
            self.rust().text.is_empty()
        }

        /// Get text length
        #[qinvokable]
        pub fn length(&self) -> i32 {
            self.rust().text.len() as i32
        }
    }
}

/// FluentTextField Rust implementation
pub struct FluentTextFieldRust {
    data: FluentTextFieldData,
}

impl Default for FluentTextFieldRust {
    fn default() -> Self {
        Self {
            data: FluentTextFieldData {
                text: QString::new(),
                editable: true,
                clear_enabled: true,
                frameless: false,
            },
        }
    }
}
