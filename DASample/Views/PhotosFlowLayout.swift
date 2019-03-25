//
//  PhotosFlowLayout.swift
//  DASample
//
//  Created by Daniel Avram on 25/03/2019.
//  Copyright © 2019 Daniel Avram. All rights reserved.
//

import UIKit

class PhotosFlowLayout: UICollectionViewFlowLayout {
    override init() { super.init() }
    required init?(coder aDecoder: NSCoder) { super.init(coder: aDecoder) }
    
    convenience init(fitting size: CGSize,
                     columns: CGFloat,
                     contentInsets: UIEdgeInsets,
                     itemSpacing: CGFloat,
                     heightRatio: CGFloat = 1.23) {
        self.init()
        
        sectionInset = contentInsets
        minimumInteritemSpacing = itemSpacing
        
        let width = (size.width - contentInsets.left - contentInsets.right - itemSpacing) / columns
        let height = width * heightRatio
        itemSize = .init(width: width, height: height)
    }
}
