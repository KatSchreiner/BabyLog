//
//  BorderedTextField.swift
//  BabyLog
//
//  Created by Екатерина Шрайнер on 11.04.2026.
//

import SwiftUI

struct BorderedTextField: View {
    @Binding var text: String
    @FocusState.Binding var isFocused: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white)
                .frame(height: 60)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.bGray, lineWidth: 1)
                )
            HStack {
                TextField("Как зовут твоего малыша?", text: $text)
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .focused($isFocused)
                    .textInputAutocapitalization(.words)
                    .submitLabel(.done)
                    .padding(.horizontal)
                
                if !text.isEmpty {
                    Button(action: {
                        text = ""
                        isFocused = true
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundStyle(.bGray)
                            .font(.system(size: 30))
                            .padding(.horizontal)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }
}
