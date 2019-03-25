//
//  PhotosViewController.swift
//  DASample
//
//  Created by Daniel Avram on 24/03/2019.
//  Copyright © 2019 Daniel Avram. All rights reserved.
//

import UIKit

class PhotosViewController: UICollectionViewController, UIActivityIndicatable {

    private var photos = [PhotosItem]()
    private var manager: PhotosManager<PhotosViewController>!
    
    private var contentInsets: UIEdgeInsets = .all(with: 12)
    private var itemSpacing: CGFloat = 12
    private var itemHeightRatio: CGFloat = 1.23
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initialize()
        initUI()
        reload()
    }

    private func initialize() {
        collectionView.register(UINib(nibName: PhotosCell.identifier, bundle: nil), forCellWithReuseIdentifier: PhotosCell.identifier)
        manager = PhotosManager(delegate: self)
    }
    
    private func initUI() {
        addCloseButton()
        title = "Photos"
        collectionView.backgroundColor = .lightBackground
    }

    private func reload() {
        manager.fetch()
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int { return 1 }
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { return photos.count }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCell.identifier, for: indexPath) as? PhotosCell else { return UICollectionViewCell() }
    
        cell.item = photos.element(at: indexPath.item)
    
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    override func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard photos.isIndexLast(indexPath.item) else { return }
        reload()
    }
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = 0.5 * (
            collectionView.frame.width -
            contentInsets.left -
            contentInsets.right -
            itemSpacing
        )
        let height = width * itemHeightRatio
        return .init(width: width, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return contentInsets
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return itemSpacing
    }
}

extension PhotosViewController: PhotosDelegate {
    func didFetch(_ elements: [PhotosItem]) {
        photos += elements
        collectionView.reloadData()
    }
}
