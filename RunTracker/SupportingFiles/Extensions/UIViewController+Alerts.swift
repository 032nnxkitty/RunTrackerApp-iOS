//
//  UIViewController+Alerts.swift
//  RunTracker
//
//  Created by Arseniy Zolotarev on 12.06.2023.
//

import UIKit

extension UIViewController {
    func presentAlert(
        title: String? = nil,
        message: String? = nil,
        completion: @escaping () -> Void
    ) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(.init(title: "Cancel", style: .cancel))
        alert.addAction(.init(title: "Ok", style: .default) { _ in
            completion()
        })
        present(alert, animated: true)
    }
    
    func presentFinishSessionAlert() {
        // ..
    }
}
