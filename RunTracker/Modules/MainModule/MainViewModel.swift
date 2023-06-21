//
//  MainViewModel.swift
//  RunTracker
//
//  Created by Arseniy Zolotarev on 01.06.2023.
//

import Foundation

protocol MainViewModel {
    var numberOfSections: Int { get }
    func numberOfItems(in section: Int) -> Int
}

final class MainViewModelImpl: MainViewModel {
    var numberOfSections: Int {
        return 2
    }
    
    func numberOfItems(in section: Int) -> Int {
        switch section {
        case 0:
            return 7
        case 1:
            return 4
        default:
            return 0
        }
    }
}
