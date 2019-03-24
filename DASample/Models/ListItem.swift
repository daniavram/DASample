//
//  ListItem.swift
//  DASample
//
//  Created by Daniel Avram on 24/03/2019.
//  Copyright © 2019 Daniel Avram. All rights reserved.
//

import UIKit

class ListItem: Fetchable {
    private(set) var icon: UIImage?
    private(set) var title: String?
    private(set) var subtitle: String?
    private(set) var status: Status
    
    init(icon: UIImage?, title: String?, subtitle: String?, status: Status) {
        self.icon = icon
        self.title = title
        self.subtitle = subtitle
        self.status = status
    }
}

extension ListItem {
    enum Status {
        case normal
        case error
        case success
        case warning
        
        var color: UIColor {
            switch self {
            case .normal: return .primary
            case .error: return .error
            case .success: return .success
            case .warning: return .warning
            }
        }
    }
}
