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
    private let welcomeView = WelcomeView()
    
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
        configureWelcomeView()
        configureButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
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
    }
    
    func configureWelcomeView() {
        welcomeView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(welcomeView)
        NSLayoutConstraint.activate([
            welcomeView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            welcomeView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            welcomeView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 16)
        ])
        
        welcomeView.configure(with: .afternoon)
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

