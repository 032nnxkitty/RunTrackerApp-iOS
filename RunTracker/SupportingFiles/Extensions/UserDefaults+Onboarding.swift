//
//  UserDefaults+Onboarding.swift
//  RunTracker
//
//  Created by Arseniy Zolotarev on 04.06.2023.
//

import Foundation

extension UserDefaults {
    private var isOnboardedKey: String { "isOnboarded" }
    
    var isOnboarded: Bool {
        get {
            bool(forKey: isOnboardedKey)
        }
        set {
            set(newValue, forKey: isOnboardedKey)
        }
    }
}
