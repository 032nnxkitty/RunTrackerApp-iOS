//
//  HistoryCellViewModel.swift
//  RunTracker
//
//  Created by Arseniy Zolotarev on 01.06.2023.
//

import Foundation

struct HistoryCellViewModel {
    // MARK: - Private Properties
    private var distanceMeters:  Double
    private var durationSeconds: Int
    private var kcal: Int
    private var date: Date
    
    // MARK: - Init
    init(distanceMeters: Double, durationSeconds: Int, kcal: Int, date: Date) {
        self.distanceMeters = distanceMeters
        self.durationSeconds = durationSeconds
        self.kcal = kcal
        self.date = date
    }
    
    // MARK: - Public Properties
    var formattedDistance: String {
        return distanceMeters.formatDistance()
    }
    
    var formattedDuration: String {
        return durationSeconds.formatDuration()
    }
    
    var formattedKcal: String {
        return "\(kcal) Kcal"
    }
    
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d.MM.yyyy"
        return formatter.string(from: date)
    }
}
