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
    let statsView = RunSessionStatsView()
    
    private let mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.overrideUserInterfaceStyle = .dark
        mapView.mapType = .standard
        return mapView
    }()
    
    private lazy var pauseButton: CapsuleButton = {
        let button = CapsuleButton(text: "Pause", background: .systemGray6)
        button.addTarget(self, action: #selector(pauseButtonDidTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration?.baseForegroundColor = .white
        button.isAnimated = true
        return button
    }()
    
    private lazy var lockButton: CapsuleButton = {
        let button = CapsuleButton(image: UIImage(systemName: "lock.open.fill"), background: R.Colors.accentGreen)
        button.addTarget(self, action: #selector(lockButtonDidTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isAnimated = true
        return button
    }()
    
    private lazy var finishButton: CapsuleButton = {
        let button = CapsuleButton(text: "Finish", background: .systemGray6)
        button.addTarget(self, action: #selector(finishButtonDidTap), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration?.baseForegroundColor = .white
        button.isAnimated = true
        return button
    }()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAppearance()
        configureMapView()
        configureTopStack()
        configureSessionButtons()
        
        bindIsUserInteractionEnabled()
        bindIsOnPause()
        bindDuration()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.viewDidAppear()
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
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(closeButtonDidTap))
        navigationItem.rightBarButtonItem = MKUserTrackingBarButtonItem(mapView: mapView)
    }
    
    func bindIsUserInteractionEnabled() {
        viewModel.isUserInteractionEnabled.bind { [weak self] newValue in
            guard let self else { return }
            
            self.lockButton.configuration?.baseBackgroundColor = newValue ? R.Colors.accentGreen : .systemRed
            self.lockButton.configuration?.image = newValue ? UIImage(systemName: "lock.open.fill") : UIImage(systemName: "lock.fill")
            
            self.finishButton.isUserInteractionEnabled = newValue
            self.pauseButton.isUserInteractionEnabled = newValue
            self.mapView.isUserInteractionEnabled = newValue
            self.navigationController?.navigationBar.isUserInteractionEnabled = newValue
        }
    }
    
    func bindIsOnPause() {
        viewModel.isOnPause.bind { [weak self] newValue in
            guard let self else { return }
            self.pauseButton.configuration?.baseBackgroundColor = newValue ? R.Colors.accentGreen : .systemGray6
            self.pauseButton.configuration?.baseForegroundColor = newValue ? .black: .white
        }
    }
    
    func bindDuration() {
        viewModel.secondsDuration.bind { [weak self] newValue in
            guard let self else { return }
            
            self.statsView.updateDuration(newValue.formatTimer())
        }
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
        statsView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(statsView)
        NSLayoutConstraint.activate([
            statsView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            statsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            statsView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
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
    func closeButtonDidTap() {
        navigationController?.popViewController(animated: true)
    }
    
    func pauseButtonDidTap() {
        viewModel.pauseButtonDidTap()
    }
    
    func finishButtonDidTap() {
        
    }
    
    func lockButtonDidTap() {
        viewModel.isUserInteractionEnabled.value.toggle()
    }
}

