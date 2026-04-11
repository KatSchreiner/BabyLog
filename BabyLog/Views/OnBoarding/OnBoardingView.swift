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

    var body: some View {
        ZStack {
            Color("bBackground")
                .ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 20) {
                Image("logo")
                    .padding(.vertical, 100)

                VStack(spacing: 16) {
                    Text("Привет!")
                        .font(.title)
                        .fontWeight(.medium)
                    
                    BorderedTextField(text: $babyName, isFocused: $isNameFieldFocused)
                        .padding(.horizontal, 40)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    OnboardingView()
}
