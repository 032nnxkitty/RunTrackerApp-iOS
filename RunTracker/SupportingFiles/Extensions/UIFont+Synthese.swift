//
//  UIFont+Synthese.swift
//  RunTracker
//
//  Created by Arseniy Zolotarev on 06.06.2023.
//

import UIKit

extension UIFont {
    static func syntheseLight(size: CGFloat, style: UIFont.TextStyle) -> UIFont {
        guard let customFont = UIFont(name: "Synthese-Light", size: size) else {
            return .preferredFont(forTextStyle: style)
        }
        return UIFontMetrics(forTextStyle: style).scaledFont(for: customFont)
    }
    
    static func syntheseBold(size: CGFloat, style: UIFont.TextStyle) -> UIFont {
        guard let customFont = UIFont(name: "Synthese-Bold", size: size) else {
            return .preferredFont(forTextStyle: style)
        }
        return UIFontMetrics(forTextStyle: style).scaledFont(for: customFont)
    }
}
