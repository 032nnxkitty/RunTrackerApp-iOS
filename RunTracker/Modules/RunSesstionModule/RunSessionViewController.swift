//
//  RunSessionViewController.swift
//  RunTracker
//
//  Created by Arseniy Zolotarev on 05.06.2023.
//

import UIKit

final class RunSessionViewController: UIViewController {
    private var viewModel: RunSessionViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func setViewModel(_ viewModel: RunSessionViewModel) {
        self.viewModel = viewModel
    }
}
