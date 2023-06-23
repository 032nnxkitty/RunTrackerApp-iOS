//
//  HistoryCell.swift
//  RunTracker
//
//  Created by Arseniy Zolotarev on 01.06.2023.
//

import UIKit

final class HistoryCell: UITableViewCell {
    // MARK: - UI Elements
    private let containerVStack = UIStackView.setupStack(axis: .vertical)
    
    private let runIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = R.Colors.accentGreen
        imageView.image = .init(systemName: "figure.run")
        imageView.tintColor = .black
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 8
        imageView.widthAnchor
            .constraint(equalToConstant: 50)
            .isActive = true
        imageView.heightAnchor
            .constraint(equalToConstant: 50)
            .isActive = true
        return imageView
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 17)
        label.textColor = .white
        return label
    }()
    
    private let weekdayLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        return label
    }()
    
    private let distanceStatsView = SingleStatsView(title: "Km")
    private let kcalStatsView = SingleStatsView(title: "Kcal")
    private let durationStatsView = SingleStatsView(title: "Duration")
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureAppearance()
        configureContainerStack()
        configureTopSection()
        configureBottomSection()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    func configure(with viewModel: HistoryCellViewModel) {
        dateLabel.text = viewModel.formattedDate
        weekdayLabel.text = viewModel.formattedWeekday
        
        distanceStatsView.setValue(viewModel.formattedDistance)
        kcalStatsView.setValue(viewModel.formattedKcal)
        durationStatsView.setValue(viewModel.formattedDuration)
    }
}

// MARK: - Private Methods
private extension HistoryCell {
    func configureAppearance() {
        backgroundColor = .clear
    }
    
    func configureContainerStack() {
        contentView.addSubview(containerVStack)
        NSLayoutConstraint.activate([
            containerVStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            containerVStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            containerVStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            containerVStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }
    
    func configureTopSection() {
        let topStack = UIStackView.setupStack(axis: .horizontal)
        topStack.spacing = 16
        containerVStack.addArrangedSubview(topStack)
        
        let rightStack = UIStackView.setupStack(axis: .vertical)
        rightStack.distribution = .fillEqually
        rightStack.spacing = 0
        [dateLabel, weekdayLabel].forEach { rightStack.addArrangedSubview($0) }
        
        topStack.addArrangedSubview(runIconImageView)
        topStack.addArrangedSubview(rightStack)
    }
    
    func configureBottomSection() {
        let bottomStack = UIStackView.setupStack(axis: .horizontal)
        bottomStack.distribution = .fillEqually
        bottomStack.spacing = 0
        
        [distanceStatsView, kcalStatsView, durationStatsView].forEach {
            $0.statsAlignment = .left
            bottomStack.addArrangedSubview($0)
        }
        
        containerVStack.addArrangedSubview(bottomStack)
    }
}
