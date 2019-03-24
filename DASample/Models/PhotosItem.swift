//
//  PhotosItem.swift
//  DASample
//
//  Created by Daniel Avram on 24/03/2019.
//  Copyright © 2019 Daniel Avram. All rights reserved.
//

import UIKit

class PhotosItem: Fetchable {
    private(set) var image: UIImage?
    
    init(image: UIImage?) {
        self.image = image
    }
}
