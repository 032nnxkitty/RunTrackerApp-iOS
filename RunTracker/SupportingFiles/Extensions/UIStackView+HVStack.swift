//
//  UIStackView+HVStack.swift
//  RunTracker
//
//  Created by Arseniy Zolotarev on 12.06.2023.
//

import UIKit

extension UIStackView {
    static func setupStack(axis: NSLayoutConstraint.Axis) -> UIStackView {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = axis
        return stack
    }
}
