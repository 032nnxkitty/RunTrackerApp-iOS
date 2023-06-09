//
//  RunSessionStatsView.swift
//  RunTracker
//
//  Created by Arseniy Zolotarev on 07.06.2023.
//

import UIKit

final class RunSessionStatsView: UIView {
    // MARK: - UI Elements
    private let gradientLayer = CAGradientLayer()
    
    private let durationValueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 50)
        label.text = "00:00:00"
        return label
    }()
    
    private let distanceStatsView = SingleStatsView(title: "Distance km")
    private let caloriesStatsView = SingleStatsView(title: "Calories")
    private let avgPaceStatsView  = SingleStatsView(title: "Avg. Pace /km")
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureGradient()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Life Cycle
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
    // MARK: - Public Methods
    func updateDuration(_ duration: String) {
        durationValueLabel.text = duration
    }
    
    func updateDistance(_ distance: String) {
        distanceStatsView.setValue(distance)
    }
    
    func updateKcal(_ kcal: String) {
        caloriesStatsView.setValue(kcal)
    }
    
    func updateAvgPace(_ avgPace: String) {
        avgPaceStatsView.setValue(avgPace)
    }
}

// MARK: - Private Methods
private extension RunSessionStatsView {
    func configureGradient() {
        let colorTop = UIColor.black.cgColor
        let colorBottom = UIColor.clear.cgColor

        gradientLayer.locations = [0.6, 1]
        gradientLayer.colors = [colorTop, colorBottom]
        
        self.layer.addSublayer(gradientLayer)
    }
    
    func configure() {
        let vStack = UIStackView()
        vStack.translatesAutoresizingMaskIntoConstraints = false
        vStack.axis = .vertical
        vStack.spacing = 0
        vStack.distribution = .fill
        
        addSubview(vStack)
        NSLayoutConstraint.activate([
            vStack.topAnchor.constraint(equalTo: topAnchor),
            vStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            vStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            vStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -32)
        ])
        
        vStack.addArrangedSubview(durationValueLabel)
        
        let hStack = UIStackView()
        hStack.axis = .horizontal
        hStack.distribution = .fillEqually
        
        [distanceStatsView, caloriesStatsView, avgPaceStatsView].forEach {
            hStack.addArrangedSubview($0)
        }
        
        vStack.addArrangedSubview(hStack)
    }
}
