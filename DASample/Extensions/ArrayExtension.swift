//
//  ArrayExtension.swift
//  DASample
//
//  Created by Daniel Avram on 24/03/2019.
//  Copyright © 2019 Daniel Avram. All rights reserved.
//

import Foundation

extension Array {
    func element(at index: Int) -> Element? {
        guard (0 ..< count) ~= index else { return nil }
        return self[index]
    }
    
    func isIndexLast(_ index: Int) -> Bool {
        let isIt = index == count - 1
        return isIt
    }
}
