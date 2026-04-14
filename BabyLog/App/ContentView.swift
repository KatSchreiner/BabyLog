//
//  ContentView.swift
//  BabyLog
//
//  Created by Екатерина Шрайнер on 13.04.2026.
//
import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        Group {
            if appState.shouldShowOnboarding {
                OnboardingView()
            } else {
                ProfileView() 
            }
        }
    }
}
