//
//  ViewController.swift
//  RunTracker
//
//  Created by Arseniy Zolotarev on 01.06.2023.
//

import UIKit

final class ViewController: UIViewController {
    // MARK: - UI Elements
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
    }
}

// MARK: - Private Methods
private extension ViewController {
    func configureAppearance() {
        view.backgroundColor = .red
    }
}

