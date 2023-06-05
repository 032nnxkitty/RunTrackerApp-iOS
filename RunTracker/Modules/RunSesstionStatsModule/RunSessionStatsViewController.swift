//
//  RunSessionStatsViewController.swift
//  RunTracker
//
//  Created by Arseniy Zolotarev on 05.06.2023.
//

import UIKit

final class RunSessionStatsViewController: UIViewController {
    private var viewModel: RunSessionStatsViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func setViewModel(_ viewModel: RunSessionStatsViewModel) {
        self.viewModel = viewModel
    }
}
