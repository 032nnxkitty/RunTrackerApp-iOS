//
//  HistoryCellStatsSectionView.swift
//  RunTracker
//
//  Created by Arseniy Zolotarev on 05.06.2023.
//

import UIKit

final class HistoryCellStatsSectionView: UIStackView {
    // MARK: - UI Elements
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .headline)
        return label
    }()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .title2)
        label.text = "..."
        return label
    }()
    
    // MARK: - Init
    init(title: String, accentColor: UIColor) {
        super.init(frame: .zero)
        
        self.titleLabel.text = title
        self.valueLabel.textColor = accentColor
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
private extension HistoryCellStatsSectionView {
    func configureStack() {
        axis = .vertical
        spacing = 0
        [titleLabel, valueLabel].forEach { addArrangedSubview($0) }
    }
}


