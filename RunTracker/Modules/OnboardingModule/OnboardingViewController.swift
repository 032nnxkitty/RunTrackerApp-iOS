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
        label.text = "Track your activity and get better life"
        label.font = .syntheseBold(size: 30, style: .largeTitle)
        label.textAlignment = .center
        return label
    }()
    
    private let infoLabel2: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Run and check the distance you have covered using the run tracker"
        label.font = .syntheseLight(size: 14, style: .footnote)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var startButton: CapsuleButton = {
        let button = CapsuleButton(text: "Start Journey", background: R.Colors.accentGreen)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(startButtonDidTap), for: .touchUpInside)
        return button
    }()
    
    // MARK: - View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureAppearance()
        configureElements()
    }
}

// MARK: - Private Methods
private extension OnboardingViewController {
    func configureAppearance() {
        view.insertSubview(backgroundImageView, at: 0)
        NSLayoutConstraint.activate([
            backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func configureElements() {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 16
        
        view.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 22),
            stack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -22),
            stack.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32)
        ])
        
        [infoLabel1, infoLabel2, startButton].forEach {
            stack.addArrangedSubview($0)
        }
    }
    
    @objc func startButtonDidTap() {
        UserDefaults.standard.isOnboarded = true
        
        let vc = TabBarController()
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .flipHorizontal
        present(vc, animated: true)
    }
}
