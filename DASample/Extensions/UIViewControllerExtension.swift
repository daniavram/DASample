//
//  UIViewControllerExtension.swift
//  DASample
//
//  Created by Daniel Avram on 24/03/2019.
//  Copyright © 2019 Daniel Avram. All rights reserved.
//

import UIKit

extension UIViewController {
    func addCloseButton() {
        let button = UIButton(type: .custom)
        button.set(title: "Close", color: .primary, highlightedColor: .primaryHighlighted)
        button.addTarget(self, action: #selector(close), for: .touchUpInside)
        let closeButton = UIBarButtonItem(customView: button)
        navigationItem.setLeftBarButton(closeButton, animated: false)
    }
    
    @objc private func close() {
        dismiss(animated: true, completion: nil)
    }
}
