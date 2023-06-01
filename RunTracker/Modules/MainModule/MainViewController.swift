//
//  MainViewController.swift
//  RunTracker
//
//  Created by Arseniy Zolotarev on 01.06.2023.
//

import UIKit

final class MainViewController: UIViewController {
    private var viewModel: MainViewModel!
    // MARK: - UI Elements
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
    }
    
    // MARK: - Public Methods
    func setViewModel(_ viewModel: MainViewModel) {
        self.viewModel = viewModel
    }
}

// MARK: - Private Methods
private extension MainViewController {
    func configureAppearance() {
        view.backgroundColor = .systemBackground
        title = "Run!"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
}

