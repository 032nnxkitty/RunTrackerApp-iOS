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
    private let totalDurationSection = SingleStatsView(title: "Duration")
    private let totalDistanceSection = SingleStatsView(title: "Distance")
    private let totalCalSection = SingleStatsView(title: "Cal")
    
    private lazy var startRunButton: CapsuleButton = {
        let button = CapsuleButton(text: "Run!", background: R.Colors.accentGreen)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(startRunButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAppearance()
        configureTotalStats()
        configureButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
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
        title = "Total stats"
    }
    
    func configureTotalStats() {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.distribution = .fillEqually
        stack.axis = .horizontal
        
        view.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
        ])
        
        [totalDistanceSection, totalDurationSection, totalCalSection].forEach {
            stack.addArrangedSubview($0)
        }
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

