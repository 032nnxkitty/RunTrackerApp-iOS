//
//  MainViewModel.swift
//  RunTracker
//
//  Created by Arseniy Zolotarev on 01.06.2023.
//

import Foundation

protocol MainViewModel {
    var totalDistance: String { get }
    var totalDuration: String { get }
    var totalKcal: String { get }
}

final class MainViewModelImpl: MainViewModel {
    var totalDistance: String {
        return "10000 km"
    }
    
    var totalDuration: String {
        return "22 h"
    }
    
    var totalKcal: String {
        return "4535 Kcal"
    }
}
