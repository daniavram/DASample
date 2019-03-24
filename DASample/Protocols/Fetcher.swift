//
//  Fetcher.swift
//  DASample
//
//  Created by Daniel Avram on 24/03/2019.
//  Copyright © 2019 Daniel Avram. All rights reserved.
//

import Foundation

protocol Fetcher: class {
    associatedtype Element: Fetchable
    func didStartFetch()
    func didEndFetch()
    func didFetch(_ elements: [Element])
}

protocol Fetchable {}

extension Fetcher where Self: UIActivityIndicatable {
    func didStartFetch() {
        startLoading()
    }
    func didEndFetch() {
        stopLoading()
    }
}
