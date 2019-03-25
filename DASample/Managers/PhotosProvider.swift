//
//  PhotosProvider.swift
//  DASample
//
//  Created by Daniel Avram on 25/03/2019.
//  Copyright © 2019 Daniel Avram. All rights reserved.
//

import UIKit

typealias ImageSize = (width: Int, height: Int)

protocol PhotosProvider {
    func getImage(ofSize size: ImageSize, completion: @escaping (UIImage?) -> Void)
}
