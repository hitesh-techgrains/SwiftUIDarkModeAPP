import SwiftUI

struct ThemeColors {
    let background: Color
    let text: Color
    let accent: Color

    static let current = ThemeColors(
        background: Color("PrimaryBackground"),
        text: Color("PrimaryText"),
        accent: Color("AccentColor")
    )
}

class AppThemeEnvironment: ObservableObject {
    @AppStorage("selectedTheme") var selectedThemeRaw: String = AppTheme.system.rawValue

    var selectedTheme: AppTheme {
        get { AppTheme(rawValue: selectedThemeRaw) ?? .system }
        set { selectedThemeRaw = newValue.rawValue }
    }

    var colorScheme: ColorScheme? {
        selectedTheme.colorScheme
    }

    var themeColors: ThemeColors {
        ThemeColors.current
    }
}
