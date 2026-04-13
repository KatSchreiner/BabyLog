//
//  OnBoardingViewModel.swift
//  BabyLog
//
//  Created by Екатерина Шрайнер on 12.04.2026.
//
import SwiftUI
import Combine

final class OnboardingViewModel: ObservableObject {
    @Published var babyName: String = ""
    @Published var isOnboardingCompleted: Bool = false

    var isNameValid: Bool {
        babyName.trimmingCharacters(in: .whitespacesAndNewlines).count >= 2
    }

    func completeOnboarding() {
        // Save name in CoreData
        isOnboardingCompleted = true
    }
}
