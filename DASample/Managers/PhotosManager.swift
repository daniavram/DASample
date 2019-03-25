//
//  PhotosManager.swift
//  DASample
//
//  Created by Daniel Avram on 24/03/2019.
//  Copyright © 2019 Daniel Avram. All rights reserved.
//

import UIKit

class PhotosManager<T: PhotosDelegate> {
    weak var delegate: T?
    private var provider: PhotosProvider?
    private let pageSize: Int = 10
    private var fetchedItems = [PhotosItem]() {
        didSet {
            guard fetchedItems.count == pageSize else { return }
            delegate?.didEndFetch()
            delegate?.didFetch(fetchedItems)
        }
    }
    
    init(delegate: T, provider: PhotosProvider = OnlinePhotosProvider()) {
        self.delegate = delegate
        self.provider = provider
    }
    
    func fetch() {
        fetchedItems = [PhotosItem]()
        delegate?.didStartFetch()
        
        for _ in (0 ..< pageSize) {
            provider?.getImage(ofSize: (width: 200, height: 400), completion: photosCallback(_:))
        }
    }
    
    private func photosCallback(_ image: UIImage?) {
        fetchedItems.append(PhotosItem(image: image))
    }
}
