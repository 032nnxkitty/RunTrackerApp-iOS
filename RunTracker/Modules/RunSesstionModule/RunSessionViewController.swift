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
        mapView.overrideUserInterfaceStyle = .light
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
    
    private lazy var pauseButton: RoundedButton = {
        let button = RoundedButton(text: "Pause", color: .systemGreen)
        button.addTarget(self, action: #selector(pauseButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var finishButton: RoundedButton = {
        let button = RoundedButton(text: "Finish", color: R.Colors.accentCoral)
        button.addTarget(self, action: #selector(finishButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAppearance()
        configureMapView()
        configureLabels()
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
        mapView.showsCompass = true
        view.addSubview(mapView)
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mapView.heightAnchor.constraint(equalToConstant: 220)
        ])
    }
    
    func configureLabels() {
        view.addSubview(durationLabel)
        NSLayoutConstraint.activate([
            durationLabel.topAnchor.constraint(equalTo: mapView.bottomAnchor, constant: 16),
            durationLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
    }
    
    func configureSessionButtons() {
        let containerStack = UIStackView()
        containerStack.translatesAutoresizingMaskIntoConstraints = false
        containerStack.axis = .horizontal
        containerStack.distribution = .fillEqually
        containerStack.spacing = 16
        
        view.addSubview(containerStack)
        NSLayoutConstraint.activate([
            containerStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            containerStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            containerStack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
        
        [finishButton ,pauseButton].forEach { containerStack.addArrangedSubview($0) }
    }
}

@objc private extension RunSessionViewController {
    func pauseButtonDidTap() {
        
    }
    
    func finishButtonDidTap() {
        
    }
}

