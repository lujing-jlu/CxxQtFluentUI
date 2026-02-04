//! Theme Manager QML Bridge for CxxQtFluentUI
//!
//! Provides a QML-accessible theme manager that syncs with the QML ThemeManager singleton (themeManager).
//! This allows Rust code to control theme switching.

use crate::core::ThemeMode;
use cxx_qt::CxxQtType;
use cxx_qt_lib::QString;

#[cxx_qt::bridge]
pub mod qrc_theme_manager {
    use super::*;

    #[qobject]
    #[qml_element]
    #[qproperty(i32, theme_mode)]
    #[qproperty(QString, primary_color)]
    pub type RinThemeManager = super::RinThemeManagerRust;

    impl CxxQtType for RinThemeManagerRust {
        type Rust = RinThemeManagerData;
    }

    #[derive(Default)]
    pub struct RinThemeManagerData {
        theme_mode: i32,
        primary_color: QString,
    }

    impl RinThemeManagerRust {
        /// Create a new theme manager
        #[qinvokable]
        pub fn new() -> Self {
            let mut this = Self::default();
            this.set_theme_mode(ThemeMode::Light as i32);
            this.set_primary_color(&QString::from("#0078D4"));
            this
        }

        /// Check if dark mode is active
        #[qinvokable]
        pub fn is_dark(self: &Pin<&mut Self>) -> bool {
            self.rust().theme_mode == ThemeMode::Dark as i32
        }

        /// Toggle between light and dark theme
        #[qinvokable]
        pub fn toggle_theme(self: Pin<&mut Self>) {
            let current = self.rust_mut().theme_mode;
            self.set_theme_mode(if current == ThemeMode::Dark as i32 {
                ThemeMode::Light as i32
            } else {
                ThemeMode::Dark as i32
            });
        }

        /// Set theme mode (0 = Light, 1 = Dark, 2 = Auto)
        #[qinvokable]
        pub fn set_theme_mode(self: Pin<&mut Self>, mode: i32) {
            self.rust_mut().theme_mode = mode;
        }

        /// Set primary accent color
        #[qinvokable]
        pub fn set_primary_color(self: Pin<&mut Self>, color: &QString) {
            self.rust_mut().primary_color = color.clone();
        }
    }
}

/// Theme manager Rust implementation
pub struct RinThemeManagerRust {
    data: RinThemeManagerData,
}

impl Default for RinThemeManagerRust {
    fn default() -> Self {
        Self {
            data: RinThemeManagerData {
                theme_mode: ThemeMode::Light as i32,
                primary_color: QString::from("#0078D4"),
            },
        }
    }
}
