//
//  UIStoryboardExtension.swift
//  DASample
//
//  Created by Daniel Avram on 24/03/2019.
//  Copyright © 2019 Daniel Avram. All rights reserved.
//

import UIKit

extension UIStoryboard {
    static var initial: UIStoryboard { return UIStoryboard(name: "Initial", bundle: nil) }
    static var list: UIStoryboard { return UIStoryboard(name: "List", bundle: nil) }
    static var photos: UIStoryboard { return UIStoryboard(name: "Photos", bundle: nil) }
    
    func instantiate<T: UIViewController>(_ viewControllerType: T.Type) -> T {
        let viewControllerIdentifier = String(describing: viewControllerType)
        let viewController = instantiateViewController(withIdentifier: viewControllerIdentifier)
        
        return viewController as! T
    }
    
    func instantiateWithNavigationController<T: UIViewController>(_ viewControllerType: T.Type) -> (UINavigationController, T) {
        let viewController = instantiate(viewControllerType)
        let navigationController = UINavigationController(rootViewController: viewController)
        
        return (navigationController, viewController)
    }
}
