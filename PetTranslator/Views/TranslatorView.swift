//
//  ContentView.swift
//  PetTranslator
//
//  Created by Oleksandr Prytchyn on 24.03.2025.
//

import SwiftUI

struct TranslatorView: View {
    var body: some View {
        ZStack {
            AppBackground()
                .ignoresSafeArea()
            VStack {
                Text("Translator")
                    .font(.custom("KonkhmerSleokchher-Regular", size: 32))
                    
                    
                Image("cat")
            }
        }
        
    }
}

#Preview {
    TranslatorView()
}
