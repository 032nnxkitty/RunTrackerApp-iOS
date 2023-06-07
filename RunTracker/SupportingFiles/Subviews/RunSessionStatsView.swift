//
//  RunSessionStatsView.swift
//  RunTracker
//
//  Created by Arseniy Zolotarev on 07.06.2023.
//

import UIKit

final class RunSessionStatsView: UIView {
    let gradientLayer = CAGradientLayer()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureGradient()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
}

// MARK: - Private Methods
private extension RunSessionStatsView {
    func configureGradient() {
        let colorTop: CGColor = UIColor.black.cgColor
        let colorBottom: CGColor = UIColor.clear.cgColor

        gradientLayer.locations = [0, 1]
        gradientLayer.colors = [colorTop, colorBottom]
        
        self.layer.addSublayer(gradientLayer)
    }
}
