//
//  TranslatorView.swift
//  PetTranslator
//
//  Created by Oleksandr Prytchyn on 26.03.2025.
//

import SwiftUI

struct TranslatorView: View {
    
    enum Animals {
        case cat
        case dog
    }
    
    @State var sourceLanguage = "HUMAN"
    @State var sourceLanguage2 = "PET"
    @State var humanToPet = true
    @State var showAlert = false
    @State private var showResultView = false
    @State private var selectedAnimal: Animals = .cat
    @State private var isRecording = false
    @State private var waveAmplitudes: [CGFloat] = Array(repeating: 10, count: 10)
    @StateObject var speechRecognizer = SpeechRecognizer()
    
    var body: some View {
        VStack {
            
            // TRANSLATOR TEXT
            HStack {
                Text("Translator")
                    .font(.custom("KonkhmerSleokchher-Regular", size: 32))
                    .foregroundColor(Color(red: 41/255, green: 45/255, blue: 50/255))
            }
            .frame(height: 58)
            .frame(maxWidth: .infinity)
            
            // BLOCK WITH HUMAN <> PET
            HStack(alignment: .center) {
                VStack {
                    Text(sourceLanguage)
                        .frame(maxWidth: .infinity)
                }
                .padding()
                VStack {
                    Button {
                        swap(&sourceLanguage, &sourceLanguage2)
                        humanToPet.toggle()
                        print(sourceLanguage, sourceLanguage2)
                    } label: {
                        Image("arrow-swap-horizontal")
                    }
                }
                
                VStack {
                    Text(sourceLanguage2)
                }
                .frame(maxWidth: .infinity)
                .padding()
                
            }
            .font(.custom("KonkhmerSleokchher-Regular", size: 16))
            .foregroundColor(Color(red: 41/255, green: 45/255, blue: 50/255))
            .padding(.bottom, 58)
            
            // BLOCK WITH MICROPHONE AND PETS
            HStack(alignment: .center, spacing: 35) {
                
                // MICROPHONE VIEW
                VStack {
                    Button {
                        if isRecording == false {
                            speechRecognizer.startRecognition()
                            
                        } else {
                            speechRecognizer.stopRecognition()
                            showAlert = true
                        }
                        DispatchQueue.main.async {
                            isRecording.toggle()
                        }
                    } label: {
                        VStack {
                            if isRecording == false {
                                Image("microphone")
                                    .padding(.top, 44)
                                    .scaleEffect(isRecording ? 1.2 : 1.0)
                            } else {
                                
                                
                            }
                            
                            Text(isRecording ?  "Stop Speak " : "Start Speak")
                                .font(.custom("KonkhmerSleokchher-Regular", size: 16))
                                .foregroundColor(Color(red: 41/255, green: 45/255, blue: 50/255))
                                .padding(.bottom, 16)
                        }
                        .padding(.horizontal, 43)
                        .background {
                            Color(isRecording ? Color.red.opacity(0.3) : Color.white)
                                .frame(width: 178, height: 176)
                                .frame(minWidth: 0)
                                .frame(maxWidth: .infinity)
                                .cornerRadius(16)
                                .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 4)
                        }
                        
                        
                    }
                    .opacity(isRecording ? 0.7 : 1.0)
                    
                }
                .onAppear {
                    speechRecognizer.onStop = { finalText in
                        print("Final text: \(finalText)")
                        
                    }
                }
                
                // PETS CHOOSING VIEW
                VStack(spacing: 12) {
                    Button {
                        selectedAnimal = .cat
                        print(selectedAnimal)
                    } label: {
                        ZStack {
                            Color(red: 209/255, green: 231/255, blue: 252/255)
                                .frame(width: 70, height: 70)
                                .cornerRadius(8)
                            Image("cat")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40)
                        }
                        .opacity(selectedAnimal == .dog ? 0.5 : 1.0)
                    }
                    Button {
                        selectedAnimal = .dog
                        print(selectedAnimal)
                    } label: {
                        ZStack {
                            Color(red: 236/255, green: 251/255, blue: 199/255)
                                .frame(width: 70, height: 70)
                                .cornerRadius(8)
                            Image("dog")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40, height: 40)
                        }
                        .opacity(selectedAnimal == .cat ? 0.5 : 1.0)
                    }
                }
                .padding(12)
                .background {
                    Color.white
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0)
                        .cornerRadius(16)
                        .shadow(color: Color.black.opacity(0.2), radius: 4, x: 0, y: 4)
                }
            }
            .padding(.bottom, 51)
            
            // BIG IMAGE PET
            VStack {
                Image(selectedAnimal == .dog ? "dog" : "cat")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 184, height: 184)
            }
            
            AudioWaveView(isRecording: $isRecording)
            
            // PUSHING EVERYTHING UP
            Spacer()
        }
        
        .alert(isPresented: $showAlert) {
            if humanToPet == true && speechRecognizer.recognizedText.isEmpty {
                return Alert(
                    title: Text("Recognized Text"),
                    message: Text("Please try again, this time the animal didn’t hear you"),
                    dismissButton: .cancel(Text("Cancel"))
                )
            } else {
                return Alert(
                    title: Text(humanToPet ? "Recognized Text" : "Your pet`s voice recorded. For result press Translate"),
                    message: Text(humanToPet ? speechRecognizer.recognizedText : ""),
                    primaryButton: .default(Text("Translate"), action: {
                        showResultView = true
                    }),
                    secondaryButton: .cancel(Text("Cancel"))
                )
            }
        }
        
        
        .navigationDestination(isPresented: $showResultView) {
            ResultView(animal: selectedAnimal, humanTalks: humanToPet, text: $speechRecognizer.recognizedText)
        }
        
    }
    
}

#Preview {
    TranslatorView()
}
