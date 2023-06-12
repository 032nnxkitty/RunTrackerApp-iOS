//
//  Assembly.swift
//  RunTracker
//
//  Created by Arseniy Zolotarev on 01.06.2023.
//

import UIKit

final class Assembly {
    private init() {}
    
    static func createMainModule() -> UIViewController {
        let viewModel = MainViewModelImpl()
        let vc = MainViewController()
        vc.setViewModel(viewModel)
        return vc
    }
    
    static func createHistoryModule() -> UIViewController {
        let viewModel = HistoryViewModelImpl()
        let vc = HistoryViewController()
        vc.setViewModel(viewModel)
        return vc
    }
    
    static func createRunSessionModule() -> UIViewController {
        let realmManager = RealmManager.shared
        let viewModel = RunSessionViewModelImpl(runHistoryKeeper: realmManager)
        let vc = RunSessionViewController()
        vc.setViewModel(viewModel)
        return vc
    }
    
    static func createRunSessionStatsModule() -> UIViewController {
        let viewModel = RunSessionStatsViewModelImpl()
        let vc = RunSessionStatsViewController()
        vc.setViewModel(viewModel)
        return vc
    }
}
