//
//  RunSessionViewController.swift
//  RunTracker
//
//  Created by Arseniy Zolotarev on 05.06.2023.
//

import UIKit
import MapKit

final class RunSessionViewController: UIViewController {
    private var viewModel: RunSessionViewModel!
    
    // MARK: - UI Elements
    private let mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.overrideUserInterfaceStyle = .dark
        mapView.mapType = .standard
        return mapView
    }()
    
    private let durationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .largeTitle)
        label.text = "00:32:39"
        return label
    }()
    
    private lazy var pauseButton: CapsuleButton = {
        let button = CapsuleButton(text: "Pause", color: .systemGray6)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(pauseButtonDidTap), for: .touchUpInside)
        button.configuration?.baseForegroundColor = .white
        return button
    }()
    
    private lazy var lockButton: CapsuleButton = {
        let button = CapsuleButton(image: UIImage(systemName: "lock.fill"), color: R.Colors.accentGreen)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(lockButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var finishButton: CapsuleButton = {
        let button = CapsuleButton(text: "Finish", color: .systemGray6)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(finishButtonDidTap), for: .touchUpInside)
        button.configuration?.baseForegroundColor = .white
        return button
    }()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAppearance()
        configureMapView()
        configureTopStack()
        configureSessionButtons()
    }
    
    // MARK: - Public Methods
    func setViewModel(_ viewModel: RunSessionViewModel) {
        self.viewModel = viewModel
    }
}

// MARK: - Private Methods
private extension RunSessionViewController {
    func configureAppearance() {
        view.backgroundColor = .systemBackground
    }
    
    func configureMapView() {
        view.insertSubview(mapView, at: 0)
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func configureTopStack() {
        let statsView = RunSessionStatsView()
        statsView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(statsView)
        NSLayoutConstraint.activate([
            statsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            statsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            statsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            statsView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func configureSessionButtons() {
        let containerStack = UIStackView()
        containerStack.translatesAutoresizingMaskIntoConstraints = false
        containerStack.axis = .horizontal
        containerStack.distribution = .fill
        containerStack.spacing = 10
        
        view.addSubview(containerStack)
        NSLayoutConstraint.activate([
            containerStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            containerStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            containerStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8)
        ])
        
        [finishButton, lockButton, pauseButton].forEach { containerStack.addArrangedSubview($0) }
        
        NSLayoutConstraint.activate([
            pauseButton.widthAnchor.constraint(equalTo: finishButton.widthAnchor, multiplier: 1),
            lockButton.widthAnchor.constraint(equalTo: lockButton.heightAnchor, multiplier: 1)
        ])
    }
}

@objc private extension RunSessionViewController {
    func pauseButtonDidTap() {
        
    }
    
    func finishButtonDidTap() {
        
    }
    
    func lockButtonDidTap() {
        
    }
}

