//! NavigationView Rust Wrapper for CxxQtFluentUI
//!
//! Provides Rust API for the NavigationView QML component.

use cxx_qt::CxxQtType;
use cxx_qt_lib::QString;

#[cxx_qt::bridge]
pub mod qrc_navigation_view {
    use super::*;

    #[qobject]
    #[qml_element]
    #[qproperty(bool, compact_mode)]
    #[qproperty(bool, open_hover)]
    #[qproperty(int, display_mode)]
    pub type RinNavigationView = super::RinNavigationViewRust;

    impl CxxQtType for RinNavigationViewRust {
        type Rust = RinNavigationViewData;
    }

    #[derive(Default)]
    pub struct RinNavigationViewData {
        compact_mode: bool,
        open_hover: bool,
        display_mode: i32,
    }

    impl RinNavigationViewRust {
        /// Create a new navigation view
        #[qinvokable]
        pub fn new() -> Self {
            let mut this = Self::default();
            this.set_compact_mode(false);
            this.set_open_hover(true);
            this.set_display_mode(0); // Left
            this
        }

        /// Toggle compact mode
        #[qinvokable]
        pub fn toggle_compact(self: Pin<&mut Self>) {
            self.rust_mut().compact_mode = !self.rust().compact_mode;
        }

        /// Set display mode (0=Left, 1=Top, 2=LeftCompact)
        #[qinvokable]
        pub fn set_display_mode(self: Pin<&mut Self>, mode: i32) {
            self.rust_mut().display_mode = mode;
        }

        /// Check if in compact mode
        #[qinvokable]
        pub fn is_compact(&self) -> bool {
            self.rust().compact_mode
        }
    }
}

/// Navigation item data for Rust-side management
#[derive(Default)]
pub struct NavigationItemData {
    pub title: QString,
    pub icon_name: QString,
    pub is_expanded: bool,
    pub is_selected: bool,
}

/// RinNavigationView Rust implementation
pub struct RinNavigationViewRust {
    data: RinNavigationViewData,
}

impl Default for RinNavigationViewRust {
    fn default() -> Self {
        Self {
            data: RinNavigationViewData::default(),
        }
    }
}
