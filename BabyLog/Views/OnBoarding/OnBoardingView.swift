//
//  OnBoardingView.swift
//  BabyLog
//
//  Created by Екатерина Шрайнер on 11.04.2026.
//
import SwiftUI

struct OnboardingView: View {
    @State private var babyName = ""
    @FocusState private var isNameFieldFocused: Bool
    @State private var isOnboardingCompleted: Bool = false

    var body: some View {
        ZStack {
            Color.bBackground
                .ignoresSafeArea()
                .onTapGesture { isNameFieldFocused = false }
            
            VStack(spacing: 20) {
                Image("logo")
                    .padding(.vertical, 60)

                VStack(spacing: 24) {
                    Text("Привет!")
                        .font(.title)
                        .fontWeight(.medium)
                    
                    BorderedTextField(text: $babyName, isFocused: $isNameFieldFocused)
                        .padding(.horizontal, 40)
                        .onSubmit {
                            if !babyName.isEmpty { completeOnboarding() }
                        }
                    
                    nextButton
                }
                Spacer()
            }
        }
        .fullScreenCover(isPresented: $isOnboardingCompleted){
            
        }
    }
    
    private var nextButton: some View {
        CircleButton(
            icon: "arrow.right.circle.fill",
            iconSize: 65,
            backgroundColor: .white,
            iconColor: .bBraun,
            isEnabled: !babyName.isEmpty,
            action: completeOnboarding,
            withHaptic: true
        )
    }
    
    private func completeOnboarding() {
        let generator = UIImpactFeedbackGenerator(style: .medium)
        generator.impactOccurred()
        
        isOnboardingCompleted = true
    }
}

#Preview {
    OnboardingView()
}
