//
//  ClickView.swift
//  PetTranslator
//
//  Created by Oleksandr Prytchyn on 25.03.2025.
//

import SwiftUI
import StoreKit

enum Destination {
    case rateUs, shareApp, contactUs, restorePurchases, privacyPolicy, termsOfUse
}


struct ClickView: View {
    @Environment(\.requestReview) private var requestReview
    @State private var destination: Destination?
    @State private var showContactSheet = false
    @State var showAlert = false
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
                    ButtonClickView(name: "Rate Us", action: {
                        requestReview()
                    })
                    
                    // BUTTON SHARE APP
                    ButtonClickView(name: "Share App", action: {
                        shareApp()
                    })
                    
                    // BUTTON CONTACT US
                    ButtonClickView(name: "Contact Us", action: {
                        showContactSheet = true
                    })
                    .confirmationDialog("Contact Us", isPresented: $showContactSheet, titleVisibility: .visible) {
                                Button("Call 📞") {
                                    callSupport()
                                }
                                Button("Email ✉️") {
                                    sendEmail()
                                }
                                Button("Cancel", role: .cancel) {}
                            }
                    
                    // BUTTON RESTORE PURCHASES
                    ButtonClickView(name: "Restore Purchases", action: {
                        showAlert = true
                    })
                    
                    // BUTTON PRIVACY POLICY
                    ButtonClickView(name: "Privacy Policy", action: {
                        showAlert = true
                    })
                    
                    // BUTTON TERMS OF USE
                    ButtonClickView(name: "Terms of Use", action: {
                        showAlert = true
                    })
                }
                .buttonStyle(.plain)
                
                Spacer()
                
            }
            .alert("This feature will be provided in the future", isPresented: $showAlert) {
                        Button("OK", role: .cancel) { }
                    }
        }
        
    }
    private func shareApp() {
            let urlString = "https://apps.apple.com/app/id76767667"
            if let url = URL(string: urlString) {
                UIApplication.shared.open(url)
            }
        }
    
    private func callSupport() {
            if let url = URL(string: "tel://+00000000000") {
                UIApplication.shared.open(url)
            }
        }
    private func sendEmail() {
            if let url = URL(string: "mailto:petSupportApp@pets.com") {
                UIApplication.shared.open(url)
            }
        }
        
        
}



#Preview {
    ClickView()
}
