//
//  MainViewController.swift
//  RunTracker
//
//  Created by Arseniy Zolotarev on 01.06.2023.
//

import UIKit
import MapKit

final class MainViewController: UIViewController {
    private var viewModel: MainViewModel!
    
    // MARK: - UI Elements
    private let statsStack: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        return stack
    }()
    
    private let distanceStatsView = TotalStatsView(title: "Total Distance", accentColor: R.Colors.accentCoral)
    private let durationStatsView = TotalStatsView(title: "Total Duration", accentColor: .systemYellow)
    private let kcalStatsView     = TotalStatsView(title: "Total Kcal", accentColor: .systemBlue)
    
    private let mapView: MKMapView = {
        let mapView = MKMapView()
        mapView.translatesAutoresizingMaskIntoConstraints = false
        mapView.overrideUserInterfaceStyle = .light
        mapView.mapType = .standard
        return mapView
    }()
    
    private lazy var startRunButton: CapsuleButton = {
        let button = CapsuleButton(text: "Run!", color: R.Colors.accentCoral)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(startRunButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAppearance()
        configureStatsStack()
        configureMapView()
        configureButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        distanceStatsView.setValue(viewModel.totalDistance)
        durationStatsView.setValue(viewModel.totalDuration)
        kcalStatsView.setValue(viewModel.totalKcal)
    }
    
    // MARK: - Public Methods
    func setViewModel(_ viewModel: MainViewModel) {
        self.viewModel = viewModel
    }
}

// MARK: - Private Methods
private extension MainViewController {
    func configureAppearance() {
        view.backgroundColor = .systemBackground
        title = "Run tracker"
    }
    
    func configureStatsStack() {
        view.addSubview(statsStack)
        NSLayoutConstraint.activate([
            statsStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            statsStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            statsStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
        
        [distanceStatsView, durationStatsView, kcalStatsView].forEach {
            statsStack.addArrangedSubview($0)
        }
    }
    
    func configureMapView() {
        view.addSubview(mapView)
        NSLayoutConstraint.activate([
            mapView.topAnchor.constraint(equalTo: statsStack.bottomAnchor),
            mapView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mapView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            mapView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func configureButton() {
        view.addSubview(startRunButton)
        NSLayoutConstraint.activate([
            startRunButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 70),
            startRunButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -70),
            startRunButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }
    
    @objc func startRunButtonDidTap() {
        let vc = Assembly.createRunSessionModule()
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
}

