//
//  UIButtonExtension.swift
//  DASample
//
//  Created by Daniel Avram on 24/03/2019.
//  Copyright © 2019 Daniel Avram. All rights reserved.
//

import UIKit

extension UIButton {
    func set(title: String?, color: UIColor, highlightedColor: UIColor) {
        setTitle(title, for: .normal)
        setTitleColor(color, for: .normal)
        setTitleColor(highlightedColor, for: .highlighted)
    }
}
