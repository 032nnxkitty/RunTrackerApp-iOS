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
        let vc = MainViewController(viewModel: viewModel)
        return vc
    }
    
    static func createHistoryModule() -> UIViewController {
        let realmManager = RealmManager.shared
        let viewModel = HistoryViewModelImpl(runningHistoryManager: realmManager)
        let vc = HistoryViewController(viewModel: viewModel)
        return vc
    }
    
    static func createRunSessionModule() -> UIViewController {
        let realmManager = RealmManager.shared
        let viewModel = RunSessionViewModelImpl(runningHistoryManager: realmManager)
        let vc = RunSessionViewController(viewModel: viewModel)
        return vc
    }
    
    static func createRunSessionStatsModule() -> UIViewController {
        let viewModel = RunSessionStatsViewModelImpl()
        let vc = RunSessionStatsViewController(viewModel: viewModel)
        return vc
    }
}
