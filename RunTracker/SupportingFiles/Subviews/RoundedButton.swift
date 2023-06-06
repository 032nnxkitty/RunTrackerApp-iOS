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
        config.baseForegroundColor = .black
        config.cornerStyle = .capsule
        config.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0)
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = .syntheseBold(size: 17, style: .body)
            return outgoing
        }
        setTitle(text, for: .normal)
        self.configuration = config
    }
}
