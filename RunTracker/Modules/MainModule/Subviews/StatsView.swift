//
//  StatsView.swift
//  RunTracker
//
//  Created by Arseniy Zolotarev on 05.06.2023.
//

import UIKit

final class StatsView: UIStackView {
    // MARK: - UI Elements
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 25)
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureStack()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    func configure(title: String, value: String, accentColor: UIColor) {
        titleLabel.text = title
        valueLabel.text = value
        valueLabel.textColor = accentColor
    }
}

// MARK: - Private Methods
private extension StatsView {
    func configureStack() {
        axis = .vertical
        spacing = 4
        distribution = .fill
        isLayoutMarginsRelativeArrangement = true
        layoutMargins = UIEdgeInsets(top: 16, left: 4, bottom: 16, right: 4)
        
        addArrangedSubview(valueLabel)
        addArrangedSubview(titleLabel)
    }
}
