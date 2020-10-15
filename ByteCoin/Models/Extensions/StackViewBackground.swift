//
//  StackViewBackground.swift
//  ByteCoin
//
//  Created by Tarokh on 7/29/20.
//  Copyright © 2020 Tarokh. All rights reserved.
//

import UIKit

extension UIStackView {
    func addBackground(color: UIColor) {
        let subView = UIView(frame: bounds)
        subView.backgroundColor = color
        subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(subView, at: 0)
    }
}
