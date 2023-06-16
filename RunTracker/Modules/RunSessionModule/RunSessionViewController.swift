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
    
    private lazy var mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.overrideUserInterfaceStyle = .dark
        mapView.mapType = .standard
        mapView.showsUserLocation = true
        mapView.delegate = self
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
        bindPath()
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
        navigationItem.rightBarButtonItem = MKUserTrackingBarButtonItem(mapView: mapView)
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close,
                                                           target: self,
                                                           action: #selector(closeButtonDidTap))
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
            self.statsView.updateDuration(newValue.formatTime())
        }
    }
    
    func bindPath() {
        viewModel.newPathCoordinates.bind { [weak self] newPath in
            guard let self else { return }
            let polyLine = MKPolyline(coordinates: newPath, count: newPath.count)
            self.mapView.addOverlay(polyLine)
        }
    }
}

@objc private extension RunSessionViewController {
    func closeButtonDidTap() {
        presentAlert(title: "", message: "") { [weak self] in
            guard let self else { return }
            navigationController?.popViewController(animated: true)
        }
    }
    
    func pauseButtonDidTap() {
        viewModel.pauseButtonDidTap()
    }
    
    func finishButtonDidTap() {
        presentFinishSessionAlert()
        viewModel.finishSession()
    }
    
    func lockButtonDidTap() {
        viewModel.isUserInteractionEnabled.value.toggle()
    }
}

// MARK: - MKMapViewDelegate
extension RunSessionViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if overlay is MKPolyline {
            let renderer = MKPolylineRenderer(overlay: overlay)
            renderer.strokeColor = R.Colors.accentGreen
            return renderer
        } else {
            return MKPolylineRenderer()
        }
    }
}

