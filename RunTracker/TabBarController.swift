//
//  TabBarController.swift
//  RunTracker
//
//  Created by Arseniy Zolotarev on 01.06.2023.
//

import UIKit

final class TabBarController: UITabBarController {
    // MARK: - UI Elements
    var mainVC:    UIViewController = MainViewController()
    var historyVC: UIViewController = HistoryViewController()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
    }
}

// MARK: - Private Methods
private extension TabBarController {
    func configureAppearance() {
        mainVC = UINavigationController(rootViewController: mainVC)
        mainVC.tabBarItem.image = UIImage(systemName: "figure.run")
        mainVC.tabBarItem.title = "Main"
        
        historyVC = UINavigationController(rootViewController: historyVC)
        historyVC.tabBarItem.image = UIImage(systemName: "clock")
        historyVC.tabBarItem.title = "History"
        
        setViewControllers([mainVC, historyVC], animated: true)
    }
}

