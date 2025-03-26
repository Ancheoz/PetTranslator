//
//  ClickView.swift
//  PetTranslator
//
//  Created by Oleksandr Prytchyn on 25.03.2025.
//

import SwiftUI

struct ClickView: View {
    var body: some View {
        ZStack {
            AppBackground()
                .ignoresSafeArea()
            VStack {
                HStack {
                    Text("Settings")
                        .font(.custom("KonkhmerSleokchher-Regular", size: 32))
                        .foregroundColor(Color(red: 41/255, green: 45/255, blue: 50/255))
                }
                .frame(height: 58)
                .frame(maxWidth: .infinity)
                .padding(.top, 12)
                .padding(.bottom, 12)
                
                
                VStack(spacing: 16) {
                    
                    // BUTTON RATE US
                    Button {
                        // OPENING NEXT PAGE
                    } label: {
                        HStack {
                            Text("Rate Us")
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
                    .buttonStyle(.plain)
                    
                    // BUTTON SHARE APP
                    Button {
                        // OPENING NEXT PAGE
                    } label: {
                        HStack {
                            Text("Share App")
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
                    .buttonStyle(.plain)
                    
                    // BUTTON CONTACT US
                    Button {
                        // OPENING NEXT PAGE
                    } label: {
                        HStack {
                            Text("Contact Us")
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
                    .buttonStyle(.plain)
                    
                    // BUTTON RESTORE PURCHASES
                    
                    Button {
                        // OPENING NEXT PAGE
                    } label: {
                        HStack {
                            Text("Restore Purchases")
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
                    .buttonStyle(.plain)
                    
                    // BUTTON PRIVACY POLICY
                    Button {
                        // OPENING NEXT PAGE
                    } label: {
                        HStack {
                            Text("Privacy Policy")
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
                    .buttonStyle(.plain)
                    
                    // BUTTON TERMS OF USE
                    Button {
                        // OPENING NEXT PAGE
                    } label: {
                        HStack {
                            Text("Terms of Use")
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
                    .buttonStyle(.plain)
                    
                    
                }
                
                
                
                
                Spacer()
            }
        }
        
        
        
    }
}

#Preview {
    ClickView()
}
