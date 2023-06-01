//
//  HistoryViewModel.swift
//  RunTracker
//
//  Created by Arseniy Zolotarev on 01.06.2023.
//

import Foundation

protocol HistoryViewModel {
    var numberOfRuns: Int { get }
    //func getHistoryCellViewModelForCell(at indexPath: IndexPath) -> HistoryCellViewModel
}

final class HistoryViewModelImpl: HistoryViewModel {
    
    var numberOfRuns: Int {
        return 100
    }
    
//    func getHistoryCellViewModelForCell(at indexPath: IndexPath) -> HistoryCellViewModel {
//        return HistoryCellViewModel()
//    }
}
