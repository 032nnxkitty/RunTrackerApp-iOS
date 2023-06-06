//
//  OnboardingViewController.swift
//  RunTracker
//
//  Created by Arseniy Zolotarev on 04.06.2023.
//

import UIKit

final class OnboardingViewController: UIViewController {
    // MARK: - UI Elements
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "onboardingImage")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let infoLabel1: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Track your activity\nand get better life"
        label.font = .syntheseBold(size: 30, style: .largeTitle)
        label.textAlignment = .center
        return label
    }()
    
    private let infoLabel2: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "Run and check the distance you have covered using the run tracker"
        label.font = .syntheseLight(size: 17, style: .body)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var startButton: RoundedButton = {
        let button = RoundedButton(text: "Start Journey", color: R.Colors.accentGreen)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(startButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAppearance()
        configureBackgroundImageView()
        configureStartButton()
        configureInfoLabels()
    }
}

// MARK: - Private Methods
private extension OnboardingViewController {
    func configureAppearance() {
        view.backgroundColor = .systemBackground
    }
    
    func configureBackgroundImageView() {
        view.insertSubview(backgroundImageView, at: 0)
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func configureStartButton() {
        view.addSubview(startButton)
        NSLayoutConstraint.activate([
            startButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 22),
            startButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -22),
            startButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32)
        ])
    }
    
    func configureInfoLabels() {
        let labelsStack = UIStackView()
        labelsStack.translatesAutoresizingMaskIntoConstraints = false
        labelsStack.axis = .vertical
        labelsStack.spacing = 16
        
        view.addSubview(labelsStack)
        NSLayoutConstraint.activate([
            labelsStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 22),
            labelsStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -22),
            labelsStack.bottomAnchor.constraint(equalTo: startButton.topAnchor, constant: -32)
        ])
        
        labelsStack.addArrangedSubview(infoLabel1)
        labelsStack.addArrangedSubview(infoLabel2)
    }
    
    @objc func startButtonDidTap() {
        UserDefaults.standard.isOnboarded = true
        
        let vc = TabBarController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
}
