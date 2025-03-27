//
//  UIComponents.swift
//  PetTranslator
//
//  Created by Oleksandr Prytchyn on 24.03.2025.
//

import SwiftUI

struct AppBackground: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [Color(red: 243/255, green: 245/255, blue: 246/255), Color(red: 201/255, green: 255/255, blue: 224/255)]),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        
    }
}

struct ButtonClickView: View {
    let name: String
    let action: () -> Void
    var body: some View {
        Button(action: action) {
            HStack {
                Text(name)
                Spacer()
                Image("arrow-right")
                    .frame(width: 24, height: 24)
            }
            .padding(.horizontal, 16)
            
                .font(.custom("KonkhmerSleokchher-Regular", size: 16))
                .frame(maxWidth: .infinity)
                .padding(.vertical, 16)
                .background {
                    Color(red: 214/255, green: 220/255, blue: 255/255)
                        .cornerRadius(20)
                }
                .padding(.horizontal, 16)
        }
    }
}
