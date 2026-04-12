//
//  Color+Extension.swift
//  BabyLog
//
//  Created by Екатерина Шрайнер on 12.04.2026.
//

import SwiftUI

struct CircleButton: View {
    let icon: String
    let iconSize: CGFloat
    let backgroundColor: Color
    let iconColor: Color
    let isEnabled: Bool
    let action: () -> Void
    let withHaptic: Bool
    
    init(icon: String, iconSize: CGFloat, backgroundColor: Color, iconColor: Color, isEnabled: Bool, action: @escaping () -> Void, withHaptic: Bool) {
        self.icon = icon
        self.iconSize = iconSize
        self.backgroundColor = backgroundColor
        self.iconColor = iconColor
        self.isEnabled = isEnabled
        self.action = action
        self.withHaptic = withHaptic
    }
    
    var body: some View {
        Button(action: {
            if withHaptic {
                let generator = UIImpactFeedbackGenerator(style: .medium)
                generator.impactOccurred()
            }
            action()
        }) {
            Image(systemName: icon)
                .resizable()
                .frame(width: iconSize, height: iconSize)
                .foregroundColor(iconColor)
                .background(
                    Circle()
                        .fill(backgroundColor)
                )
        }
        .disabled(!isEnabled)
        .opacity(isEnabled ? 1.0 : 0.5)
        .scaleEffect(isEnabled ? 1.0 : 0.9)
        .animation(.spring(response: 0.3, dampingFraction: 0.7), value: isEnabled)
        .buttonStyle(.plain)
    }
}
