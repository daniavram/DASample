//
//  UIActivityIndicatable.swift
//  DASample
//
//  Created by Daniel Avram on 24/03/2019.
//  Copyright © 2019 Daniel Avram. All rights reserved.
//

import UIKit

protocol UIActivityIndicatable: class {
    func startLoading()
    func stopLoading()
}

extension UIActivityIndicatable {
    func startLoading() {
        let container = UIView(frame: .init(origin: .zero, size: UIScreen.main.bounds.size))
        container.tag = 1234
        
        let blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
        blurEffectView.frame = .init(origin: .init(x: 0.5 * (container.frame.width - 100),
                                                   y: 0.5 * (container.frame.height - 100)),
                                     size: .init(width: 100, height: 100))
        blurEffectView.layer.cornerRadius = 5
        blurEffectView.clipsToBounds = true
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        let spinner = UIActivityIndicatorView(frame: .init(origin: .init(x: 0.5 * (container.frame.width - 50),
                                                                         y: 0.5 * (container.frame.height - 50)),
                                                           size: .init(width: 50, height: 50)))
        spinner.style = .whiteLarge
        spinner.startAnimating()
        
        container.addSubview(blurEffectView)
        container.addSubview(spinner)
        
        (UIApplication.shared.delegate as? AppDelegate)?.window?.addSubview(container)
    }
    func stopLoading() {
        guard let loadingView = (UIApplication.shared.delegate as? AppDelegate)?.window?.viewWithTag(1234) else { return }
        loadingView.removeFromSuperview()
    }
}
