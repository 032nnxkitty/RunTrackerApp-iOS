//
//  WelcomeView.swift
//  RunTracker
//
//  Created by Arseniy Zolotarev on 18.06.2023.
//

import UIKit

final class WelcomeView: UIStackView {
    // MARK: - Nested Types
    enum Greeting: String {
        case morning
        case afternoon
        case evening
    }
    
    // MARK: - UI Elements
    private let greetingLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .preferredFont(forTextStyle: .body)
        return label
    }()
    
    private let readyLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .preferredFont(forTextStyle: .title2)
        return label
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureStack()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    func configure(with greeting: Greeting) {
        let time = greeting.rawValue.capitalized
        greetingLabel.text = "Good \(time), User!"
        readyLabel.text = "Ready to \(time) Run?"
    }
}

// MARK: - Private Methods
private extension WelcomeView {
    func configureStack() {
        axis = .vertical
        spacing = 4
        
        addArrangedSubview(greetingLabel)
        addArrangedSubview(readyLabel)
    }
}
