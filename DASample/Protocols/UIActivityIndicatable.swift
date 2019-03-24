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
        print("did start loading")
    }
    func stopLoading() {
        print("did stop loading")
    }
}
