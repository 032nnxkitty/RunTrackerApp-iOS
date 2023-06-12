//
//  SingleStatsView.swift
//  RunTracker
//
//  Created by Arseniy Zolotarev on 05.06.2023.
//

import UIKit

final class SingleStatsView: UIStackView {
    // MARK: - UI Elements
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 27)
        label.textColor = .white
        label.textAlignment = .center
        label.text = "..."
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.textColor = .lightGray
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - Init
    init(title: String) {
        super.init(frame: .zero)
        titleLabel.text = title
        configureStack()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods & Properties
    func setValue(_ value: String) {
        valueLabel.text = value
    }
    
    var statsAlignment: NSTextAlignment = .center {
        didSet {
            titleLabel.textAlignment = statsAlignment
            valueLabel.textAlignment = statsAlignment
        }
    }
}

// MARK: - Private Methods
private extension SingleStatsView {
    func configureStack() {
        axis = .vertical
        spacing = 4
        distribution = .fill
        isLayoutMarginsRelativeArrangement = true
        layoutMargins = UIEdgeInsets(top: 16, left: 4, bottom: 16, right: 4)
        [valueLabel, titleLabel].forEach { addArrangedSubview($0) }
    }
}
