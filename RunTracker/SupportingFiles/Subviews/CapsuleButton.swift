//
//  RoundedButton.swift
//  RunTracker
//
//  Created by Arseniy Zolotarev on 06.06.2023.
//

import UIKit

final class CapsuleButton: UIButton {
    // MARK: - Public Properties
    var isAnimated = false
    
    // MARK: - Init
    init(text: String? = nil, image: UIImage? = nil, background: UIColor) {
        super.init(frame: .zero)
        
        configureAppearance(text: text, image: image, color: background)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override Methods & Properties
    override var isHighlighted: Bool {
        didSet {
            guard isAnimated else { return }
            UIView.animate(withDuration: 0.1, delay: 0, options: [.beginFromCurrentState, .allowUserInteraction]) {
                self.transform = self.isHighlighted ? .init(scaleX: 0.9, y: 0.9) : .init(scaleX: 1, y: 1)
            }
        }
    }
    
    // MARK: - Private Methods
    private func configureAppearance(text: String? = nil, image: UIImage? = nil, color: UIColor) {
        var config = UIButton.Configuration.filled()
        config.title = text
        config.image = image
        config.baseBackgroundColor = color
        config.baseForegroundColor = .black
        config.cornerStyle = .capsule
        config.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0)
        config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
            var outgoing = incoming
            outgoing.font = .syntheseBold(size: 17, style: .body)
            return outgoing
        }
        
        self.configuration = config
    }
}
