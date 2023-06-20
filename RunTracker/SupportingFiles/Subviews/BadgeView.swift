//
//  BadgeView.swift
//  RunTracker
//
//  Created by Arseniy Zolotarev on 20.06.2023.
//

import UIKit

final class BadgeView: UIView {
    // MARK: - UI Elements
    private let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .preferredFont(forTextStyle: .footnote)
        label.textColor = .black
        return label
    }()
    
    // MARK: - Init
    init(text: String) {
        super.init(frame: .zero)
        self.label.text = text
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Properties
    var text: String? = nil {
        didSet {
            label.text = text
        }
    }
}

// MARK: - Private Methods
private extension BadgeView{
    func configureAppearance() {
        backgroundColor = R.Colors.accentGreen
        layer.cornerRadius = 8
        
        addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
    }
}
