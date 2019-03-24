//
//  ListViewCell.swift
//  DASample
//
//  Created by Daniel Avram on 24/03/2019.
//  Copyright © 2019 Daniel Avram. All rights reserved.
//

import UIKit

class ListViewCell: UITableViewCell {

    static let identifier = String(describing: ListViewCell.self)
    
    @IBOutlet private var listItemView: ListItemView!
    
    var item: ListItem? {
        didSet {
            guard let item = item else { return }
            listItemView.customize(for: item)
        }
    }
}
