//
//  UIStackView + ext.swift
//  Junior-Test-Task
//
//  Created by Данил Акимов on 14.03.2023.
//

import UIKit

extension UIStackView {
    convenience init(arrangedSubViews: [UIView], axis: NSLayoutConstraint.Axis, spacing: CGFloat) {
        self.init(arrangedSubviews: arrangedSubViews)
        self.axis = axis
        self.spacing = spacing
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
