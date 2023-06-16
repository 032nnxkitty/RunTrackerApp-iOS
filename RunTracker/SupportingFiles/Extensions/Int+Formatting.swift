//
//  Int+Formatting.swift
//  RunTracker
//
//  Created by Arseniy Zolotarev on 05.06.2023.
//

import Foundation

extension Int {
    func formatTime() -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.hour, .minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        return formatter.string(from: TimeInterval(self)) ?? ""
    }
    
    func formatDistance() -> String {
        return "\(Double(self) / 1000.0)"
    }
}
