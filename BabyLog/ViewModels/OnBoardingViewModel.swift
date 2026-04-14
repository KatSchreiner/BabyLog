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
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false
    
    private let storage: BabyStorageProtocol
    
    init(storage: BabyStorageProtocol = ProfileStore()) {
        self.storage = storage
        checkExistingProfile()
    }
    
    var isNameValid: Bool {
        babyName.trimmingCharacters(in: .whitespacesAndNewlines).count >= 2
    }
    
    func completeOnboarding() {
        guard isNameValid else { return }
        
        Task {
            isLoading = true
            errorMessage = nil
            
            let trimmedName = babyName.trimmingCharacters(in: .whitespacesAndNewlines)
            let result = await storage.saveProfile(name: trimmedName)
            
            switch result {
            case .success:
                print("✅ BabyProfile сохранен: \\(trimmedName)")
                isOnboardingCompleted = true
            case .failure(let error):
                errorMessage = error.localizedDescription
                print("❌ Ошибка: \\(error.localizedDescription)")
            }
            
            isLoading = false
        }
    }
    
    private func checkExistingProfile() {
        if storage.hasProfile() {
            isOnboardingCompleted = true
        }
    }
}
