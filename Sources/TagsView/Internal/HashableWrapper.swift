//
//  HashableWrapper.swift
//  
//
//  Created by Alexander Ignatov on 9.02.21.
//

import Foundation

struct HashableWrapper<T>: Hashable {
    let id: Int
    let data: T
    
    static func == (lhs: HashableWrapper<T>, rhs: HashableWrapper<T>) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
