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
    private let containerHStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 0
        stack.distribution = .fillEqually
        return stack
    }()
    
    private let durationSection = SingleStatsView(title: "Duration")
    private let distanceSection = SingleStatsView(title: "Distance")
    private let calSection = SingleStatsView(title: "Cal")
    
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
        durationSection.setValue(viewModel.formattedDuration)
        distanceSection.setValue(viewModel.formattedDistance)
        calSection.setValue(viewModel.formattedKcal)
        //dateSection.setValue(viewModel.formattedDate)
    }
}

// MARK: - Private Methods
private extension HistoryCell {
    func configureAppearance() {
        backgroundColor = .clear
        accessoryType = .disclosureIndicator
    }
    
    func configureContent() {
        contentView.addSubview(containerHStack)
        NSLayoutConstraint.activate([
            containerHStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            containerHStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            containerHStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            containerHStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
        
        [distanceSection, durationSection, calSection].forEach {
            containerHStack.addArrangedSubview($0)
        }
    }
}
