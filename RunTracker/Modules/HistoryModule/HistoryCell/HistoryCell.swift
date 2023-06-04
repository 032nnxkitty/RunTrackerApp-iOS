//
//  HistoryCell.swift
//  RunTracker
//
//  Created by Arseniy Zolotarev on 01.06.2023.
//

import UIKit

final class HistoryCell: UITableViewCell {
    static let identifier = "HistoryCell"
    
    // MARK: - UI Elements
    private let containerStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        return stack
    }()
    
    private lazy var timeTitleLabel:     UILabel = setupTitleLabel(text: "Duration")
    private lazy var distanceTitleLabel: UILabel = setupTitleLabel(text: "Distance")
    
    private lazy var timeValueLabel:     UILabel = setupValueLabel(color: R.Colors.accentCoral)
    private lazy var distanceValueLabel: UILabel = setupValueLabel(color: .systemBlue)
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureAppearance()
        configureContent()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    func configure(with viewModel: HistoryCellViewModel) {
        timeValueLabel.text = "\(viewModel.durationMinutes)"
        distanceValueLabel.text = "\(viewModel.distanceMeters)"
    }
}

// MARK: - Private Methods
private extension HistoryCell {
    func configureAppearance() {
        backgroundColor = .clear
        accessoryType = .disclosureIndicator
    }
    
    func configureContent() {
        contentView.addSubview(containerStack)
        NSLayoutConstraint.activate([
            containerStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            containerStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            containerStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            containerStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
        ])
        
        let timeSection = setupVStack(subviews: [timeTitleLabel, timeValueLabel])
        let distanceSection = setupVStack(subviews: [distanceTitleLabel, distanceValueLabel])
        
        containerStack.addArrangedSubview(timeSection)
        containerStack.addArrangedSubview(distanceSection)
    }
    
    func setupTitleLabel(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = .preferredFont(forTextStyle: .headline)
        return label
    }
    
    func setupValueLabel(color: UIColor) -> UILabel {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .title2)
        label.textColor = color
        return label
    }
    
    func setupVStack(subviews: [UIView]) -> UIStackView {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 0
        subviews.forEach { stack.addArrangedSubview($0) }
        return stack
    }
}
