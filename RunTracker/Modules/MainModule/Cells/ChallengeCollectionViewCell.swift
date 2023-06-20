//
//  ChallengeCollectionViewCell.swift
//  RunTracker
//
//  Created by Arseniy Zolotarev on 20.06.2023.
//

import UIKit

final class ChallengeCollectionViewCell: UICollectionViewCell {
    // MARK: - UI Elements
    private let badge = BadgeView(text: "Ends in 27 days")
    
    private let largeTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .syntheseBold(size: 25, style: .largeTitle)
        label.text = "Title"
        return label
    }()
    
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "challengeMockImage")
        return imageView
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
}

// MARK: - Private Methods
private extension ChallengeCollectionViewCell {
    func configureAppearance() {
        backgroundColor = .systemGray6
        layer.cornerRadius = 16
        
        insertSubview(backgroundImageView, at: 0)
        layer.masksToBounds = true
        
        badge.translatesAutoresizingMaskIntoConstraints = false
        addSubview(badge)
        NSLayoutConstraint.activate([
            badge.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            badge.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            backgroundImageView.topAnchor.constraint(equalTo: topAnchor),
            backgroundImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImageView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
