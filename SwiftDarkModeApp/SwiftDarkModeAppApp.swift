//
//  SwiftDarkModeAppApp.swift
//  SwiftDarkModeApp
//
//  Created by admin on 25/06/25.
//

import SwiftUI

@main
struct SwiftDarkModeAppApp: App {
    @StateObject private var themeEnv = AppThemeEnvironment()

      var body: some Scene {
          WindowGroup {
              ContentView()
                  .environmentObject(themeEnv)
                  .preferredColorScheme(themeEnv.colorScheme)
          }
      }
}
