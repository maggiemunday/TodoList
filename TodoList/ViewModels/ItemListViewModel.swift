//
//  ItemListViewModel.swift
//  TodoList
//
//  Created by Maggie Munday on 8/3/22.
//

import Foundation

class ItemListViewModel: ObservableObject {
    
    @Published var items: [Item] = []
    @Published var completeItems: [Item] = []
    
    init() {
        
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
        sortItems()
    }
    
    func updateItem(item: Item) {
        if let index = items.firstIndex(where: { $0.id == item.id }) {
            items[index] = item.updateCompletion()
        }
    }
    
    func sortItems() {
        items.sort { $1.isDone && !$0.isDone }
    }
    
}
