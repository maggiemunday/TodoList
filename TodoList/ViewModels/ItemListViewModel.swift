//
//  ItemListViewModel.swift
//  TodoList
//
//  Created by Maggie Munday on 8/3/22.
//

import Foundation

class ItemListViewModel: ObservableObject {
    
    @Published var items: [Item] = []
    
    init() {
        getItems()
        
    }
    
    func getItems() {
        let newItems = [
            Item(description: "item 1", isDone: false),
            Item(description: "item 2", isDone: true),
            Item(description: "item 3", isDone: false),
        ]
        items.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(description: String) {
        let newItem = Item(description: description, isDone: false)
        items.append(newItem)
    }
    
    func updateItem(item: Item) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }
    
}
