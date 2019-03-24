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
                ListItem(icon: .statusNormal, title: "Normal", subtitle: "This is just a regular, normal item; nothing special This is just a regular, normal item; nothing special This is just a regular, normal item; nothing special", status: .normal),
                ListItem(icon: .statusWarning, title: "Warning", subtitle: "Beware; be very ware", status: .warning),
                ListItem(icon: .statusSuccess, title: "Success", subtitle: "Yahoo!", status: .success),
                ListItem(icon: .statusError, title: "Error", subtitle: "This item shows an error", status: .error),
            ]
            
            self.delegate?.didFetch(stubs)
        }
    }
}
