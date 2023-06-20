//
//  HeaderSupplementaryView.swift
//  RunTracker
//
//  Created by Arseniy Zolotarev on 20.06.2023.
//

import UIKit

final class HeaderSupplementaryView: UICollectionReusableView {
    // MARK: - UI Elements
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = .syntheseBold(size: 17, style: .body)
        label.text = "..."
        return label
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
    func setTitle(_ text: String) {
        titleLabel.text = text
    }
}
// MARK: - Private Methods
private extension HeaderSupplementaryView {
    func configureAppearance() {
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
