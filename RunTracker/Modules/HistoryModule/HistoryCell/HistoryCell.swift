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
    
    private lazy var leftStack   = setupVStack()
    private lazy var rightStack = setupVStack()
    
    private let durationSection = HistoryCellStatsSectionView(title: "Duration", accentColor: R.Colors.accentCoral)
    private let distanceSection = HistoryCellStatsSectionView(title: "Distance", accentColor: .systemBlue)
    private let kcalSection     = HistoryCellStatsSectionView(title: "Kcal", accentColor: .systemYellow)
    private let dateSection     = HistoryCellStatsSectionView(title: "Date", accentColor: .gray)
    
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
        kcalSection.setValue(viewModel.formattedKcal)
        dateSection.setValue(viewModel.formattedDate)
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
        
        [durationSection, kcalSection].forEach { leftStack.addArrangedSubview($0) }
        [distanceSection, dateSection].forEach { rightStack.addArrangedSubview($0) }
        [leftStack, rightStack].forEach { containerHStack.addArrangedSubview($0) }
    }
    
    func setupVStack() -> UIStackView {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        stack.distribution = .fillEqually
        return stack
    }
}
