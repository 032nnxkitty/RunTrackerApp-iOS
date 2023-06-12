//
//  UIStackView+HVStack.swift
//  RunTracker
//
//  Created by Arseniy Zolotarev on 12.06.2023.
//

import UIKit

extension UIStackView {
    func setupStack(
        axis: NSLayoutConstraint.Axis,
        distribution: UIStackView.Distribution,
        spacing: CGFloat
    ) {
        self.axis = axis
        self.distribution = distribution
        self.spacing = spacing
    }
}
