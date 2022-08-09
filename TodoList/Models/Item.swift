//
//  Item.swift
//  TodoList
//
//  Created by Maggie Munday on 8/1/22.
//

import SwiftUI

struct Item: Identifiable {
    let id: String
    let description: String
    let isDone: Bool
    
    init(id: String = UUID().uuidString, description: String, isDone: Bool) {
        self.id = id
        self.description = description
        self.isDone = isDone
    }
    
    func updateCompletion() -> Item {
        return Item(id: id, description: description, isDone: !isDone)
    }
}
