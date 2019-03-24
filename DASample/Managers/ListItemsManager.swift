//
//  ListItemsManager.swift
//  DASample
//
//  Created by Daniel Avram on 24/03/2019.
//  Copyright © 2019 Daniel Avram. All rights reserved.
//

import Foundation

class ListItemsManager<T: ListItemsDelegate> {
    weak var delegate: T?
    
    init(delegate: T) {
        self.delegate = delegate
    }
    
    func fetch() {
        delegate?.didStartFetch()

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.delegate?.didEndFetch()
            
            let stubs: [ListItem] = [
                ListItem(icon: nil, title: "Error", subtitle: "This item shows an error", status: .error),
                ListItem(icon: nil, title: "Normal", subtitle: "This is just a regular, normal item; nothing special This is just a regular, normal item; nothing special This is just a regular, normal item; nothing special", status: .normal),
                ListItem(icon: nil, title: "Warning", subtitle: "Beware; be very ware", status: .warning),
                ListItem(icon: nil, title: "Success", subtitle: "Yahoo!", status: .success),
            ]
            
            self.delegate?.didFetch(stubs)
        }
    }
}
