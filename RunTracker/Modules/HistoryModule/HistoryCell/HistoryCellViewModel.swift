//
//  HistoryCellViewModel.swift
//  RunTracker
//
//  Created by Arseniy Zolotarev on 01.06.2023.
//

import Foundation

struct HistoryCellViewModel {
    // MARK: - Private Properties
    private var distanceMeters:  Int
    private var durationSeconds: Int
    private var kcal: Int
    private var date: Date
    
    // MARK: - Init
    init(distanceMeters: Int, durationSeconds: Int, kcal: Int, date: Date) {
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
        return durationSeconds.formatTime()
    }
    
    var formattedKcal: String {
        return "\(kcal)"
    }
    
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "d.MM.yyyy"
        return formatter.string(from: date)
    }
    
    var formattedWeekday: String {
        // check morning, or smth else
        return "Friday - Evening run"
    }
}
