//
//  RunSessionStatsViewController.swift
//  RunTracker
//
//  Created by Arseniy Zolotarev on 05.06.2023.
//

import UIKit

final class RunSessionStatsViewController: UIViewController {
    private var viewModel: RunSessionStatsViewModel!
    // MARK: - UI Elements
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
    }
    
    // MARK: - Public Methods
    func setViewModel(_ viewModel: RunSessionStatsViewModel) {
        self.viewModel = viewModel
    }
}

// MARK: - Private Methods
private extension RunSessionStatsViewController {
    func configureAppearance() {
        title = "Stats"
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(popBack))
        
        sheetPresentationController?.preferredCornerRadius = 22
        sheetPresentationController?.detents = [.medium()]
        sheetPresentationController?.prefersGrabberVisible = true
    }
    
    @objc func popBack() {
        dismiss(animated: true)
    }
}
