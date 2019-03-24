//
//  PhotosManager.swift
//  DASample
//
//  Created by Daniel Avram on 24/03/2019.
//  Copyright © 2019 Daniel Avram. All rights reserved.
//

import Foundation

class PhotosManager<T: PhotosDelegate> {
    weak var delegate: T?
    
    init(delegate: T) {
        self.delegate = delegate
    }
    
    func fetch() {
        delegate?.didStartFetch()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.delegate?.didEndFetch()
            
            let stubs: [PhotosItem] = [
                PhotosItem(image: .imagePlaceholder),
                PhotosItem(image: .imagePlaceholder),
                PhotosItem(image: .imagePlaceholder)
            ]
            
            self.delegate?.didFetch(stubs)
        }
    }
}
