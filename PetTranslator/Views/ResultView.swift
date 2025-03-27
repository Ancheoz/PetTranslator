//
//  ResultView.swift
//  PetTranslator
//
//  Created by Oleksandr Prytchyn on 27.03.2025.
//

import SwiftUI



struct ResultView: View {
    @Environment(\.dismiss) var dismiss
    var speechRecognizer = SpeechRecognizer()
    var animal: TranslatorView.Animals
    var humanTalks: Bool
    var catPhrases = ["Hug me please", "I want to sleep", "I want eat", "Open the door!", "I'm the boss!", "Pet me now", "I own you!", "I need space!"]
    var dogPhrases = ["Woof woof", "I want to go outside", "I want to play fetch", "You're my best!", "I love you!", "Throw the ball", "Stay with me!"]
    @Binding var text: String
    
    
    var body: some View {
        ZStack {
            AppBackground()
                .ignoresSafeArea()
            if humanTalks {
                VStack {
                    HStack {
                        Button {
                            dismiss()
                        } label: {
                            Image("close")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 48, height: 48)
                        }

                        
                        Spacer()
                        HStack {
                            Text("Result")
                                .font(.custom("KonkhmerSleokchher-Regular", size: 32))
                                .foregroundColor(Color(red: 41/255, green: 45/255, blue: 50/255))
                        }
                        .padding(.top, 12)
                        Spacer()
                        VStack {
                            
                        }
                        .frame(width: 48, height: 48)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 58)
                    .padding(.horizontal, 20)
                    
                    Spacer()
                    
                    VStack {
                        VStack {
                            HStack {
                                
                            }
                            
                            VStack {
                                Text("Your text: ")
                                    .font(.custom("KonkhmerSleokchher-Regular", size: 16))
                                Text(text)
                                    .font(.custom("KonkhmerSleokchher-Regular", size: 32))
                                    
                            }
                            .foregroundColor(Color(red: 41/255, green: 45/255, blue: 50/255))
                            
                            Text(speechRecognizer.recognizedText)
                                .font(.custom("KonkhmerSleokchher-Regular", size: 32))
                        }
                        .foregroundColor(Color(red: 41/255, green: 45/255, blue: 50/255))
                        .padding(.top, 24)
                        
                        Image("arrow-swap-horizontal")
                        VStack {
                            if animal == .cat {
                                VStack {
                                    if animal == .cat {
                                        Text("Meow meow meow")
                                            .font(.custom("KonkhmerSleokchher-Regular", size: 32))
                                            .foregroundColor(Color(red: 41/255, green: 45/255, blue: 50/255))
                                        Image("cat")
                                    } else if animal == .dog {
                                        Image("dog")
                                    }
                                }
                            } else {
                                VStack {
                                    Text("Woof woof woof")
                                        .font(.custom("KonkhmerSleokchher-Regular", size: 32))
                                        .foregroundColor(Color(red: 41/255, green: 45/255, blue: 50/255))
                                    Image("dog")
                                }
                                
                            }
                        }
                        .padding(.top, 24)
                    }
                    Spacer()
                }
            } else {
                if animal == .cat {
                    VStack {
                        HStack {
                            Button {
                                dismiss()
                            } label: {
                                VStack {
                                    Image("close")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 48, height: 48)
                                }
                                .padding(.horizontal, 20)
                            }
                            Spacer()
                        }
                        
                        VStack {
                            VStack {
                                Text("Your cat says:")
                                    .font(.custom("KonkhmerSleokchher-Regular", size: 8))
                                    .foregroundColor(Color(red: 41/255, green: 45/255, blue: 50/255))
                                    
                                Text(catPhrases.randomElement() ?? "Meow meow...")
                                    .font(.custom("KonkhmerSleokchher-Regular", size: 32))
                                    .foregroundColor(Color(red: 41/255, green: 45/255, blue: 50/255))
                                    
                            }
                            Image("cat")
                                .padding(.top, 48)
                        }
                        Spacer()
                    }
                    
                    .padding(.top, 12)
                            } else {
                                VStack {
                                    HStack {
                                        Button {
                                            dismiss()
                                        } label: {
                                            VStack {
                                                Image("close")
                                                    .resizable()
                                                    .aspectRatio(contentMode: .fit)
                                                    .frame(width: 48, height: 48)
                                            }
                                            .padding(.horizontal, 20)
                                        }
                                        Spacer()
                                    }
                                    
                                    VStack {
                                        VStack {
                                            Text("Your dog says:")
                                                .font(.custom("KonkhmerSleokchher-Regular", size: 8))
                                                .foregroundColor(Color(red: 41/255, green: 45/255, blue: 50/255))
                                                
                                            Text(dogPhrases.randomElement() ?? "Woof woof")
                                                .font(.custom("KonkhmerSleokchher-Regular", size: 32))
                                                .foregroundColor(Color(red: 41/255, green: 45/255, blue: 50/255))
                                        }
                                        Image("dog")
                                            .padding(.top, 48)
                                    }
                                    Spacer()
                                }
                                
                                .padding(.top, 12)
                            }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
