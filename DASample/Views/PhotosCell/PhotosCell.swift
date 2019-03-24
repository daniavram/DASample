//
//  PhotosCell.swift
//  DASample
//
//  Created by Daniel Avram on 24/03/2019.
//  Copyright © 2019 Daniel Avram. All rights reserved.
//

import UIKit

class PhotosCell: UICollectionViewCell {

    static let identifier = String(describing: PhotosCell.self)
    
    @IBOutlet private var imageView: UIImageView!
    
    var item: PhotosItem? {
        didSet {
            imageView.contentMode = .scaleAspectFill
            imageView.image = item?.image?.withRenderingMode(.alwaysOriginal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initialize()
    }

    private func initialize() {
        backgroundColor = .background
        contentView.backgroundColor = .clear
        layer.cornerRadius = 6
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .primary
        imageView.image = UIImage.imagePlaceholder.withRenderingMode(.alwaysTemplate)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        initialize()
    }
}
