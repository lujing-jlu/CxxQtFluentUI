/// Theme mode enumeration
#[repr(i32)]
#[derive(Clone, Copy, PartialEq, Debug)]
pub enum ThemeMode {
    Light = 0,
    Dark = 1,
    Auto = 2,
}

/// Rust-side theme manager for cross-platform theme operations
pub struct FluTheme {
    pub theme_mode: i32,
    pub primary_color: String,
}

impl FluTheme {
    pub fn new() -> Self {
        Self {
            theme_mode: ThemeMode::Light as i32,
            primary_color: "#0078D4".to_string(),
        }
    }

    pub fn toggle_theme(&mut self) {
        let current = self.theme_mode;
        self.theme_mode = match current {
            0 | 2 => ThemeMode::Dark as i32,
            1 => ThemeMode::Light as i32,
            _ => ThemeMode::Light as i32,
        };
    }

    pub fn set_theme_mode(&mut self, mode: i32) {
        self.theme_mode = mode;
    }

    pub fn is_dark_mode(&self) -> bool {
        self.theme_mode == ThemeMode::Dark as i32
    }

    pub fn get_theme_name(&self) -> String {
        match self.theme_mode {
            1 => "Dark".to_string(),
            2 => "Auto".to_string(),
            _ => "Light".to_string(),
        }
    }
}
