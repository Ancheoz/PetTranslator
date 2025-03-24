//
//  Helper.swift
//  PetTranslator
//
//  Created by Oleksandr Prytchyn on 24.03.2025.
//
import SwiftUI

// this thing helps me to find avaliable Fonts in my app

struct Helpers {
    init() {
        for familyName in UIFont.familyNames {
            print(familyName)
            
            for fontName in UIFont.fontNames(forFamilyName: familyName) {
                print(" -- \(fontName)")
            }
        }
    }
}
