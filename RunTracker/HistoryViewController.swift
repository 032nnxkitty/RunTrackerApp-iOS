//
//  HistoryViewController.swift
//  RunTracker
//
//  Created by Arseniy Zolotarev on 01.06.2023.
//

import UIKit

final class HistoryViewController: UIViewController {
    // MARK: - UI Elements
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
    }
}

// MARK: - Private Methods
private extension HistoryViewController {
    func configureAppearance() {
        view.backgroundColor = .systemBackground
        title = "History"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}


