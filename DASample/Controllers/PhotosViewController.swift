//
//  PhotosViewController.swift
//  DASample
//
//  Created by Daniel Avram on 24/03/2019.
//  Copyright © 2019 Daniel Avram. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController, UIActivityIndicatable {

    private var photos = [PhotosItem]()
    private var manager: PhotosManager<PhotosViewController>!
    
    private var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        initialize()
        initUI()
        reload()
    }

    private func initialize() {
        let layout = PhotosFlowLayout(fitting: view.frame.size,
                                      columns: 2,
                                      contentInsets: .all(with: 12),
                                      itemSpacing: 12)
        collectionView = UICollectionView(frame: view.frame,
                                          collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: PhotosCell.identifier, bundle: nil),
                                forCellWithReuseIdentifier: PhotosCell.identifier)
        view.addSubview(collectionView)
        
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
}

extension PhotosViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard photos.isIndexLast(indexPath.item) else { return }
        reload()
    }
}

extension PhotosViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int { return 1 }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { return photos.count }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCell.identifier, for: indexPath) as? PhotosCell else { return UICollectionViewCell() }
        
        cell.item = photos.element(at: indexPath.item)
        
        return cell
    }
}

extension PhotosViewController: PhotosDelegate {
    func didFetch(_ elements: [PhotosItem]) {
        photos += elements
        collectionView.reloadData()
    }
}
