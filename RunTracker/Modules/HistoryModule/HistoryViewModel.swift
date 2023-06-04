//
//  HistoryViewModel.swift
//  RunTracker
//
//  Created by Arseniy Zolotarev on 01.06.2023.
//

import Foundation

protocol HistoryViewModel {
    var numberOfRuns: Int { get }
    func getViewModelForCell(at indexPath: IndexPath) -> HistoryCellViewModel
}

final class HistoryViewModelImpl: HistoryViewModel {
    
    private let arr: [HistoryCellViewModel] = [
        HistoryCellViewModel(distanceMeters: 100, durationMinutes: 100),
        HistoryCellViewModel(distanceMeters: 100, durationMinutes: 100),
        HistoryCellViewModel(distanceMeters: 100, durationMinutes: 100),
        HistoryCellViewModel(distanceMeters: 100, durationMinutes: 100),
        HistoryCellViewModel(distanceMeters: 100, durationMinutes: 100),
        HistoryCellViewModel(distanceMeters: 100, durationMinutes: 100),
        HistoryCellViewModel(distanceMeters: 100, durationMinutes: 100),
    ]
    var numberOfRuns: Int {
        return arr.count
    }
    
    func getViewModelForCell(at indexPath: IndexPath) -> HistoryCellViewModel {
        return arr[indexPath.row]
    }
}
