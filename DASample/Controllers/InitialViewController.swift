//
//  InitialViewController.swift
//  DASample
//
//  Created by Daniel Avram on 24/03/2019.
//  Copyright © 2019 Daniel Avram. All rights reserved.
//

import UIKit

class InitialViewController: UIViewController {

    @IBOutlet private var goToListButton: UIButton!
    @IBOutlet private var goToPhotosButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }

    private func initUI() {
        goToListButton.set(title: "go To List", color: .secondary, highlightedColor: .secondaryHighlighted)
        goToPhotosButton.set(title: "go To Photos", color: .secondary, highlightedColor: .secondaryHighlighted)
    }
    
    @IBAction func goToListButtonTap(_ sender: Any) {
        let (navigationController, _) = UIStoryboard.main.instantiateWithNavigationController(ListViewController.self)
        present(navigationController, animated: true, completion: nil)
    }
    
    @IBAction func goToPhotosButtonTap(_ sender: Any) {
        let (navigationController, _) = UIStoryboard.main.instantiateWithNavigationController(PhotosViewController.self)
        present(navigationController, animated: true, completion: nil)
    }
}

