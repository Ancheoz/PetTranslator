//
//  AudioWaveView.swift
//  PetTranslator
//
//  Created by Oleksandr Prytchyn on 27.03.2025.
//

import SwiftUI

struct AudioWaveView: View {
    @Binding var isRecording: Bool
    @State private var waveAmplitudes: [CGFloat] = Array(repeating: 10, count: 6)
    
    var body: some View {
        HStack(spacing: 4) {
            ForEach(waveAmplitudes.indices, id: \.self) { index in
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: 6, height: waveAmplitudes[index])
                    .animation(.easeInOut(duration: 0.3), value: waveAmplitudes[index])
            }
        }
        .foregroundColor(isRecording ? .red : .black)
        .frame(height: 50)
        .onChange(of: isRecording) { newValue in
            if newValue {
                animateWave()
            } else {
                resetWave()
            }
        }
    }
    
    private func animateWave() {
        guard isRecording else { return }
        withAnimation {
            waveAmplitudes = waveAmplitudes.map { _ in CGFloat.random(in: 10...40) }
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            animateWave()
        }
    }
    
    private func resetWave() {
        withAnimation {
            waveAmplitudes = Array(repeating: 10, count: waveAmplitudes.count)
        }
    }
}

