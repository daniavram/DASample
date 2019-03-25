//
//  Endpoint.swift
//  DASample
//
//  Created by Daniel Avram on 25/03/2019.
//  Copyright © 2019 Daniel Avram. All rights reserved.
//

import UIKit

enum Endpoint {
    typealias PhotoSize = (Int, Int)
    case photo(PhotoSize)
    
    var value: String {
        switch self {
        case let .photo(width, height):
            return "\(Endpoint.main)/\(width)/\(height)/\(Endpoint.queryString)"
        }
    }
}

extension Endpoint {
    static var main: String = "https://loremflickr.com"
    static var queryString: String = "bro"
}
