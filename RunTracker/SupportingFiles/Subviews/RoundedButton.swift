//
//  RoundedButton.swift
//  RunTracker
//
//  Created by Arseniy Zolotarev on 06.06.2023.
//

import UIKit

final class RoundedButton: UIButton {
    // MARK: - Init
    init(text: String, color: UIColor) {
        super.init(frame: .zero)
        
        configureAppearance(text: text, color: color)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func configureAppearance(text: String, color: UIColor) {
        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = color
        config.cornerStyle = .capsule
        config.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0)
        
        titleLabel?.font = .boldSystemFont(ofSize: 17)
        setTitle(text, for: .normal)
        self.configuration = config
    }
}
