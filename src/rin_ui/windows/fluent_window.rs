//! FluentWindow Rust Wrapper for CxxQtFluentUI
//!
//! Provides Rust API for the FluentWindow QML component.

use cxx_qt::CxxQtType;
use cxx_qt_lib::QString;

#[cxx_qt::bridge]
pub mod qrc_fluent_window {
    use super::*;

    #[qobject]
    #[qml_element]
    #[qproperty(QString, title)]
    #[qproperty(bool, is_dark_mode)]
    #[qproperty(bool, use_custom_title_bar)]
    pub type FluentWindow = super::FluentWindowRust;

    impl CxxQtType for FluentWindowRust {
        type Rust = FluentWindowData;
    }

    #[derive(Default)]
    pub struct FluentWindowData {
        title: QString,
        is_dark_mode: bool,
        use_custom_title_bar: bool,
    }

    impl FluentWindowRust {
        /// Create a new fluent window
        #[qinvokable]
        pub fn new() -> Self {
            let mut this = Self::default();
            this.set_title(&QString::from("Application"));
            this.set_use_custom_title_bar(true);
            this
        }

        /// Set window title
        #[qinvokable]
        pub fn set_title(self: Pin<&mut Self>, title: &QString) {
            self.rust_mut().title = title.clone();
        }

        /// Get window title
        #[qinvokable]
        pub fn get_title(&self) -> QString {
            self.rust().title.clone()
        }

        /// Set dark mode
        #[qinvokable]
        pub fn set_dark_mode(self: Pin<&mut Self>, dark: bool) {
            self.rust_mut().is_dark_mode = dark;
        }

        /// Toggle dark mode
        #[qinvokable]
        pub fn toggle_dark_mode(self: Pin<&mut Self>) {
            self.rust_mut().is_dark_mode = !self.rust().is_dark_mode;
        }

        /// Show the window
        #[qinvokable]
        pub fn show(self: Pin<&mut Self>) {
            // QML side handles visibility
        }

        /// Hide the window
        #[qinvokable]
        pub fn hide(self: Pin<&mut Self>) {
            // QML side handles visibility
        }

        /// Close the window
        #[qinvokable]
        pub fn close(self: Pin<&mut Self>) {
            // QML side handles closing
        }

        /// Minimize the window
        #[qinvokable]
        pub fn minimize(self: Pin<&mut Self>) {
            // QML side handles minimization
        }

        /// Maximize or restore the window
        #[qinvokable]
        pub fn maximize_or_restore(self: Pin<&mut Self>) {
            // QML side handles maximization
        }
    }
}

/// FluentWindow Rust implementation
pub struct FluentWindowRust {
    data: FluentWindowData,
}

impl Default for FluentWindowRust {
    fn default() -> Self {
        Self {
            data: FluentWindowData {
                title: QString::new(),
                is_dark_mode: false,
                use_custom_title_bar: true,
            },
        }
    }
}
