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
    private let runningHistoryManager: RunningHistoryManager
    private var arr: [HistoryCellViewModel] {
        var res = [HistoryCellViewModel]()
        for _ in 0...33 {
            res.append(HistoryCellViewModel(distanceMeters:  Int.random(in: 1111...12345),
                                            durationSeconds: Int.random(in: 3600...6666),
                                            kcal: Int.random(in: 200...3000),
                                            date: Date()))
        }
        return res
    }
    
    // MARK: - Init
    init(runningHistoryManager: RunningHistoryManager) {
        self.runningHistoryManager = runningHistoryManager
    }
    
    // MARK: - HistoryViewModel Protocol
    var numberOfRuns: Int {
        return arr.count
    }
    
    func getViewModelForCell(at indexPath: IndexPath) -> HistoryCellViewModel {
        return arr[indexPath.row]
    }
}
