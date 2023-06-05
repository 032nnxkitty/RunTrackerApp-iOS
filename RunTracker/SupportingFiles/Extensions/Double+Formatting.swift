//
//  Double+Formatting.swift
//  RunTracker
//
//  Created by Arseniy Zolotarev on 05.06.2023.
//

import Foundation

extension Double {
    func formatDuration() -> String {
        let formatter = DateComponentsFormatter()
        formatter.unitsStyle = .abbreviated
        formatter.zeroFormattingBehavior = .dropAll
        formatter.allowedUnits = [.hour, .minute, .second]
        return formatter.string(from: TimeInterval(self)) ?? ""
    }
    
    func formatDistance() -> String {
        let measurement = Measurement(value: self, unit: UnitLength.meters).converted(to: .kilometers)
        let formatter = MeasurementFormatter()
        formatter.unitOptions = .providedUnit
        formatter.unitStyle = .medium
        formatter.numberFormatter.maximumFractionDigits = 1
        return formatter.string(from: measurement)
    }
}
