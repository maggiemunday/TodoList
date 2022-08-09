//
//  ItemListViewModel.swift
//  TodoList
//
//  Created by Maggie Munday on 8/3/22.
//

import Foundation

class ItemListViewModel: ObservableObject {
    
    @Published var items: [Item] = [] {
        didSet {
            saveItems()
        }
    }
    
    let itemsKey: String = "ITEMS_KEY"
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([Item].self, from: data)
        else { return }
        
        self.items = savedItems
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
    
    func saveItems() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
    
}
