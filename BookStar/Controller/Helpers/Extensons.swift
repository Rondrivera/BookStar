//
//  Extensons.swift
//  BookStar
//
//  Created by Arpit Awasthi on 03/09/21.
//

import Foundation

extension Array where Element: Hashable {
    func distinct () -> Array <Element> {
        var set = Set<Element>()
        return filter { set.insert($0).inserted}
    }
}
