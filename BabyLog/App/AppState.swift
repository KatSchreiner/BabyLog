//
//  AppState.swift
//  BabyLog
//
//  Created by Екатерина Шрайнер on 13.04.2026.
//
import SwiftUI
import Combine

@MainActor
final class AppState: ObservableObject {
    @Published var shouldShowOnboarding: Bool = true
    private let storage: BabyStorageProtocol
    
    init() {
        self.storage = ProfileStore()
        self.shouldShowOnboarding = !self.storage.hasProfile()
    }
    
    func checkOnboardingStatus() {
        shouldShowOnboarding = !storage.hasProfile()
    }
}
