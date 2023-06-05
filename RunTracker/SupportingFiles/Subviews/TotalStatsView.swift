//
//  TotalStatsView.swift
//  RunTracker
//
//  Created by Arseniy Zolotarev on 05.06.2023.
//

import UIKit

final class TotalStatsView: UIStackView {
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
        label.text = "..."
        return label
    }()
    
    // MARK: - Init
    init(title: String, accentColor: UIColor) {
        super.init(frame: .zero)
        titleLabel.text = title
        valueLabel.textColor = accentColor
        configureStack()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    func setValue(_ value: String) {
        valueLabel.text = value
    }
}

// MARK: - Private Methods
private extension TotalStatsView {
    func configureStack() {
        axis = .vertical
        spacing = 4
        distribution = .fill
        isLayoutMarginsRelativeArrangement = true
        layoutMargins = UIEdgeInsets(top: 16, left: 4, bottom: 16, right: 4)
        [valueLabel, titleLabel].forEach { addArrangedSubview($0) }
    }
}
