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
