//
//  OnBoardingView.swift
//  BabyLog
//
//  Created by Екатерина Шрайнер on 11.04.2026.
//
import SwiftUI

struct OnboardingView: View {
    // MARK: - Properties
    @EnvironmentObject var appState: AppState 
    @StateObject private var viewModel = OnboardingViewModel()
    @FocusState private var isNameFieldFocused: Bool

    // MARK: - Body
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
                    
                    BorderedTextField(
                        text: $viewModel.babyName,
                        isFocused: $isNameFieldFocused
                    )
                        .padding(.horizontal, 40)
                        .disabled(viewModel.isLoading)
                        .onSubmit {
                            if viewModel.isNameValid {
                                viewModel.completeOnboarding()
                            }
                        }
                    if let error = viewModel.errorMessage {
                        Text(error)
                            .foregroundColor(.bOrange)
                            .font(.caption)
                    }
                    
                    nextButton
                }
                Spacer()
            }
            if viewModel.isLoading {
                ProgressView()
                    .background(Color.bGray.opacity(0.5))
            }
        }
        
        .fullScreenCover(isPresented: $viewModel.isOnboardingCompleted){
            // MainView()
        }
    }
    
    // MARK: UI Components
    private var nextButton: some View {
        CircleButton(
            icon: "arrow.right.circle.fill",
            iconSize: 65,
            backgroundColor: .white,
            iconColor: .bBraun,
            isEnabled: viewModel.isNameValid,
            action: {
                viewModel.completeOnboarding()
            }, withHaptic: true
        )
    }
}

#Preview {
    OnboardingView()
}
