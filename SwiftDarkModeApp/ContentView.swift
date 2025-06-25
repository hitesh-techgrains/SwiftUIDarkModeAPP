import SwiftUI

struct ContentView: View {
    @EnvironmentObject var themeEnv: AppThemeEnvironment

    var body: some View {
        ZStack {
            themeEnv.themeColors.background.ignoresSafeArea()

            VStack(spacing: 20) {
                
                Image(systemName: "moon.fill")
                    .resizable()
                    .foregroundStyle(themeEnv.themeColors.accent)
                    .frame(width: 50, height: 50)
                    .scaledToFit()
        
                
                Text("Dynamic Theming")
                    .foregroundColor(themeEnv.themeColors.text)
                    .font(.largeTitle)
                    .bold()
                    .padding(.top, 10)

                Picker("Select Theme", selection: Binding(
                    get: { themeEnv.selectedTheme },
                    set: { themeEnv.selectedTheme = $0 }
                )) {
                    ForEach(AppTheme.allCases) { theme in
                        Text(theme.displayName).tag(theme)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                .background(themeEnv.themeColors.accent.opacity(0.2))
                .cornerRadius(12)
            }
            .padding()
        }
    }
}
