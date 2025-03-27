//
//  ContentView.swift
//  PetTranslator
//
//  Created by Oleksandr Prytchyn on 24.03.2025.
//

import SwiftUI



struct MainPageView: View {
    
    enum Tabs {
        case translator
        case click
    }
    
    @State var selectedTab: Tabs = .translator
    
    var body: some View {
        NavigationStack {
        ZStack(alignment: .bottom) {
            // CHOOSING WINDOW TO OPEN
            
            
                if selectedTab == .translator {
                    TranslatorView()
                        .padding(.top, 12)
                        .padding(.horizontal, 16)
                } else if selectedTab == .click {
                    ClickView()
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                
                // CUSTOM TABVIEW
                VStack(alignment: .leading) {
                    HStack(alignment: .center) {
                        
                        // TABVIEW TRANSLATOR BUTTON
                        VStack {
                            Button {
                                selectedTab = .translator
                                print(selectedTab)
                            } label: {
                                VStack {
                                    Image("messages")
                                    Text("Translator")
                                    
                                }
                            }
                        }
                        .opacity(selectedTab == .translator ? 1.0 : 0.5)
                        .frame(width: 63)
                        
                        Spacer()
                        
                        // TABVIEW CLICKER BUTTON
                        VStack {
                            Button {
                                selectedTab = .click
                                print(selectedTab)
                            } label: {
                                VStack {
                                    Image("gearshape")
                                    Text("Clicker")
                                }
                            }
                        }
                        .opacity(selectedTab == .click ? 1.0 : 0.5)
                        .frame(width: 63)
                        
                    }
                }
                .font(.custom("KonkhmerSleokchher-Regular", size: 12))
                .foregroundColor(Color(red: 41/255, green: 45/255, blue: 50/255))
                .padding(.vertical, 19)
                .padding(.horizontal, 24)
                .frame(width: 216, alignment: .center)
                .background(Color.white)
                .cornerRadius(16)
                
        }
        .background {
            AppBackground()
                .ignoresSafeArea()
        }
    
    
    }
        
        
        
    }
}

#Preview {
    MainPageView(selectedTab: .translator)
}
