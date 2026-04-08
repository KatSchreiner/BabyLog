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

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
