//! FluentButton Rust Wrapper for CxxQtFluentUI
//!
//! Provides Rust API for the FluentButton QML component.

use cxx_qt::CxxQtType;
use cxx_qt_lib::QString;

#[cxx_qt::bridge]
pub mod qrc_button {
    use super::*;

    #[qobject]
    #[qml_element]
    #[qproperty(QString, text)]
    #[qproperty(bool, checked)]
    #[qproperty(bool, highlighted)]
    #[qproperty(bool, flat)]
    pub type FluentButton = super::FluentButtonRust;

    impl CxxQtType for FluentButtonRust {
        type Rust = FluentButtonData;
    }

    #[derive(Default)]
    pub struct FluentButtonData {
        text: QString,
        checked: bool,
        highlighted: bool,
        flat: bool,
    }

    impl FluentButtonRust {
        /// Create a new button
        #[qinvokable]
        pub fn new() -> Self {
            Self::default()
        }

        /// Click the button programmatically
        #[qinvokable]
        pub fn click(self: Pin<&mut Self>) {
            // This will emit the clicked signal in QML
            // The actual implementation is handled by the QML side
        }

        /// Set button text
        #[qinvokable]
        pub fn set_text(self: Pin<&mut Self>, text: &QString) {
            self.rust_mut().text = text.clone();
        }

        /// Get button text
        #[qinvokable]
        pub fn get_text(&self) -> QString {
            self.rust().text.clone()
        }
    }
}

/// FluentButton Rust implementation
pub struct FluentButtonRust {
    data: FluentButtonData,
}

impl Default for FluentButtonRust {
    fn default() -> Self {
        Self {
            data: FluentButtonData::default(),
        }
    }
}
