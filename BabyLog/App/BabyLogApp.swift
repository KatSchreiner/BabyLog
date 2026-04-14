//
//  BabyLogApp.swift
//  BabyLog
//
//  Created by Екатерина Шрайнер on 08.04.2026.
//

import SwiftUI
import CoreData

@main
struct BabyLogApp: App {
    let persistenceController = PersistenceController.shared
    @StateObject private var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            Group {
                if appState.shouldShowOnboarding {
                    OnboardingView()
                } else {
                    ContentView()
                }
            }
            .environmentObject(appState)
            .environment(\.managedObjectContext, persistenceController.container.viewContext)
            .foregroundStyle(.bBraun)
            
        }
    }
}
